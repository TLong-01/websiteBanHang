package com.devpro.shop16.controller.quantrivien;


import com.devpro.shop16.controller.BaseController;
import com.devpro.shop16.dto.OrderSearchModel;
import com.devpro.shop16.dto.PaymentStatus;
import com.devpro.shop16.entities.Product;
import com.devpro.shop16.entities.Saleorder;
import com.devpro.shop16.entities.SaleorderProducts;
import com.devpro.shop16.exception.CustomException;
import com.devpro.shop16.exception.MessageCode;
import com.devpro.shop16.repository.OrderProductRepository;
import com.devpro.shop16.repository.OrderRepository;
import com.devpro.shop16.repository.ProductRepository;
import com.devpro.shop16.service.SaleorderProductsService;
import com.devpro.shop16.service.SaleorderService;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class AdminOrderController extends BaseController{
	
	private final SaleorderService saleorderService;

	private final SaleorderProductsService saleorderProductsService;

	private final OrderProductRepository orderProductRepository;

	private final OrderRepository orderRepository;
	private final ProductRepository productRepository;

	public AdminOrderController(SaleorderService saleorderService, SaleorderProductsService saleorderProductsService,
								OrderProductRepository orderProductRepository, OrderRepository orderRepository,
								ProductRepository productRepository) {
		this.saleorderService = saleorderService;
		this.saleorderProductsService = saleorderProductsService;
		this.orderProductRepository = orderProductRepository;
		this.orderRepository = orderRepository;
		this.productRepository = productRepository;
	}

	@RequestMapping(value = { "/admin/order" }, method = RequestMethod.GET)
	public String adminOrder(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		
		OrderSearchModel searchModel = new OrderSearchModel();
		searchModel.keyword = request.getParameter("keyword");
		searchModel.setPage(getCurrentPage(request));
		
		model.addAttribute("orderWithPaging", saleorderService.search(searchModel));
		model.addAttribute("searchModel", searchModel);

		return "quantrivien/order";
	}


	@RequestMapping(value = { "/admin/order-product" }, method = RequestMethod.GET)
	public String adminOrderProduct(final Model model, final HttpServletRequest request,
									@RequestParam("orderId") Integer orderId)  {

		OrderSearchModel searchModel1 = new OrderSearchModel();
		searchModel1.keyword = request.getParameter("keyword");
		searchModel1.setPage(getCurrentPage(request));
		searchModel1.orderId = super.getInteger(request, "orderId");
		Saleorder order = saleorderService.getById(orderId);

		model.addAttribute("order", saleorderProductsService.getById(searchModel1));
		model.addAttribute("orderProductWithPaging", saleorderProductsService.search(searchModel1));
		model.addAttribute("searchModel1", searchModel1);

		return "quantrivien/order-product";
	}


	@GetMapping("/delete-orderProduct/{id}")
	@Transactional
	public String adminDelete(@PathVariable("id") Integer id) {
		Saleorder saleorder = orderRepository.findById(id).orElse(null);
		saleorder.setStatus(false);
		orderRepository.save(saleorder);
		return "redirect:/admin/order";
	}

	@PostMapping( "/admin/order-product/update-status")
	public String updatePaymentStatus(@RequestBody PaymentStatus paymentStatus){
		Saleorder saleorder = orderRepository.findById(paymentStatus.getSaleOrderId())
				.orElseThrow(() -> new CustomException(MessageCode.ORDER_IS_NULL));

		saleorder.setPaymentStatus(paymentStatus.getStatus());
		orderRepository.save(saleorder);
		return "redirect:/admin/order";
	}

	@RequestMapping(value = {"/admin/order-reject/update/{orderId}"}, method = RequestMethod.GET)
	public String adminEdit(final Model model, @PathVariable("orderId") int orderId) {
		Saleorder saleorder = saleorderService.getById(orderId);
		model.addAttribute("addCate", saleorder);

		return "quantrivien/reject-order";
	}

	@RequestMapping(value = {"/admin/order-reject/adds"}, method = RequestMethod.POST)
	public String adminAddSpringForm( final @ModelAttribute("addCate") Saleorder saleorder) {
		Saleorder saleorder1 = orderRepository.findById(saleorder.getId()).orElse(null);
		saleorder1.setPaymentStatus(4);
		saleorder1.setReason(saleorder.getReason());

		List<SaleorderProducts> saleorderProducts = orderProductRepository.findBySaleOrder(saleorder1.getId());
		for (SaleorderProducts saleorderProduct : saleorderProducts) {
			Product product = saleorderProduct.getProduct(); // Lấy sản phẩm
			Integer quantity = saleorderProduct.getQuality(); // Lấy số lượng sản phẩm
			if (product != null && quantity != null) {
				product.setQuantity(product.getQuantity() + quantity);
				productRepository.save(product);
			}
		}
		orderRepository.save(saleorder1);

		return "redirect:/admin/order";
	}

}


