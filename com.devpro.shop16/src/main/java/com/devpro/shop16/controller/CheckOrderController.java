package com.devpro.shop16.controller;

import com.devpro.shop16.dto.OrderSearchModel;
import com.devpro.shop16.entities.Product;
import com.devpro.shop16.entities.Saleorder;
import com.devpro.shop16.entities.SaleorderProducts;
import com.devpro.shop16.repository.OrderProductRepository;
import com.devpro.shop16.repository.OrderRepository;
import com.devpro.shop16.repository.ProductRepository;
import com.devpro.shop16.service.SaleorderService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CheckOrderController extends BaseController {

    private final OrderRepository orderRepository;
    private final SaleorderService saleorderService;
    private final OrderProductRepository orderProductRepository;
    private final ProductRepository productRepository;

    public CheckOrderController(OrderRepository orderRepository, SaleorderService saleorderService, OrderProductRepository orderProductRepository, ProductRepository productRepository) {
        this.orderRepository = orderRepository;
        this.saleorderService = saleorderService;
        this.orderProductRepository = orderProductRepository;
        this.productRepository = productRepository;
    }

    @RequestMapping(value = {"/checkOrder/{code}"}, method = RequestMethod.GET)
    public ResponseEntity<Map<String, Object>> checkOrder(@PathVariable("code") String code) {
        Map<String, Object> jsonResult = new HashMap<>();

        Saleorder saleorder = orderRepository.findByCode(code);
        if (saleorder == null) {
            jsonResult.put("error", "Không có thông tin đơn hàng");
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(jsonResult);
        }
        List<SaleorderProducts> saleorderProductList = orderProductRepository.findBySaleOrder(saleorder.getId());
        List<Product> products = new ArrayList<>();
        StringBuilder messageBuilder = new StringBuilder();

        messageBuilder.append("Bạn đã mua " + saleorder.getTotal().intValue() + " sản phẩm gồm : ");

        for (SaleorderProducts saleorderProducts : saleorderProductList) {
            Product product = productRepository.findById(saleorderProducts.getProduct().getId()).orElse(null);
            products.add(product);
            messageBuilder.append(saleorderProducts.getQuality());
            messageBuilder.append(" sản phẩm ");
            messageBuilder.append(product.getTitle());
            messageBuilder.append(" và ");

        }

        DecimalFormat vnđFormat = new DecimalFormat("#,### VNĐ");
        BigDecimal totalPrice = saleorder.getTotalPrice();
        String formattedTotalPrice = vnđFormat.format(totalPrice);
        String fees = vnđFormat.format(saleorder.getFee());
        messageBuilder.append("<br>Tổng hóa đơn đơn hàng : " + formattedTotalPrice + " (đã bao gồm " + fees + " phí ship)");

        if (saleorder.getPaymentStatus() == 1) {
            messageBuilder.append("<br>Tình trạng đơn hàng của bạn : Chưa xử lý").append("<br>");
        } else if (saleorder.getPaymentStatus() == 2) {
            messageBuilder.append("<br>Tình trạng đơn hàng của bạn : Đang giao hàng").append("<br>");
        } else if (saleorder.getPaymentStatus() == 4) {
            messageBuilder.append("<br>Tình trạng đơn hàng của bạn : Hủy đơn").append("<br>");
            messageBuilder.append("<br>Lý do hủy đơn : " + saleorder.getReason()).append("<br>");
        } else {
            messageBuilder.append("<br>Tình trạng đơn hàng của bạn : Đã giao hàng").append("<br>");
        }

        jsonResult.put("success", messageBuilder.toString());

        return ResponseEntity.ok(jsonResult);
    }

    @RequestMapping(value = {"/checkOrder"}, method = RequestMethod.GET)
    public String checkOrder(final Model model, final HttpServletRequest request) {
        OrderSearchModel searchModel = new OrderSearchModel();
        searchModel.keyword = request.getParameter("keyword");
        searchModel.setPage(getCurrentPage(request));

        model.addAttribute("orderWithPaging", saleorderService.search(searchModel));
        model.addAttribute("searchModel", searchModel);

        return "khachhang/checkOrder";
    }

}
