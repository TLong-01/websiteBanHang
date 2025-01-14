package com.devpro.shop16.controller.quantrivien;

import com.devpro.shop16.controller.BaseController;
import com.devpro.shop16.repository.OrderProductRepository;
import com.devpro.shop16.repository.OrderRepository;
import com.devpro.shop16.repository.ProductRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ReportController extends BaseController {

    private final ProductRepository productRepository;
    private final OrderProductRepository orderProductRepository;
    private final OrderRepository orderRepository;


    public ReportController(ProductRepository productRepository, OrderProductRepository orderProductRepository, OrderRepository orderRepository) {
        this.productRepository = productRepository;
        this.orderProductRepository = orderProductRepository;
        this.orderRepository = orderRepository;
    }

    @RequestMapping(value = {"/admin/report/list", "/admin/report"}, method = RequestMethod.GET)
    public String adminBlogList(final Model model) {
        Integer numberCurrent = productRepository.getSumQuantity() ;

        model.addAttribute("productWithPaging", numberCurrent);
        model.addAttribute("orderWithPaging", orderRepository.getSumOrder());
        model.addAttribute("saleOrderWithPaging", orderRepository.getSumQuantity());
        model.addAttribute("saleOrderWithPagings", orderRepository.getSumPrice());

        return "quantrivien/report";
    }

}
