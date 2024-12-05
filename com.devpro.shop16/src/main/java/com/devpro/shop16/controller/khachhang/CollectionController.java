package com.devpro.shop16.controller.khachhang;

import com.devpro.shop16.controller.BaseController;
import com.devpro.shop16.dto.OrderSearchModel;
import com.devpro.shop16.dto.ProductSearchModel;
import com.devpro.shop16.entities.Categories;
import com.devpro.shop16.service.CategoriesService;
import com.devpro.shop16.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class CollectionController extends BaseController {

	private final ProductService productService;
	
	private final CategoriesService categoriesService;

	public CollectionController(ProductService productService, CategoriesService categoriesService) {
		this.productService = productService;
		this.categoriesService = categoriesService;
	}

	@RequestMapping(value = { "/collection" }, method = RequestMethod.GET)
	public String cartView(final Model model, final HttpServletRequest request, final HttpServletResponse response
			) throws IOException {
		ProductSearchModel searchModel = new ProductSearchModel();
		searchModel.keyword = request.getParameter("keyword");

		model.addAttribute("productsWithPaging", productService.search(searchModel));
		model.addAttribute("searchModel", searchModel);
		return "khachhang/collection";
	}

	@RequestMapping(value = { "/collections" }, method = RequestMethod.GET)
	public String cartView(final Model model, final HttpServletRequest request, @RequestParam("productId") Integer productId
	){
		OrderSearchModel searchModel = new OrderSearchModel();
		searchModel.keyword = request.getParameter("keyword");
		searchModel.orderId = super.getInteger(request, "productId");
		Categories categories = categoriesService.getById(productId);

		model.addAttribute("order", productService.getById(searchModel));
		model.addAttribute("productsWithPaging", productService.search1(searchModel));
		model.addAttribute("searchModel", searchModel);
		return "khachhang/collection";
	}


}
