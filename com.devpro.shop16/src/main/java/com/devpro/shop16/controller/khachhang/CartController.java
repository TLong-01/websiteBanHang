package com.devpro.shop16.controller.khachhang;

import com.devpro.shop16.controller.BaseController;
import com.devpro.shop16.dto.Cart;
import com.devpro.shop16.dto.CartItem;
import com.devpro.shop16.entities.Product;
import com.devpro.shop16.entities.Saleorder;
import com.devpro.shop16.entities.SaleorderProducts;
import com.devpro.shop16.service.MailService;
import com.devpro.shop16.service.ProductService;
import com.devpro.shop16.service.SaleorderProductsService;
import com.devpro.shop16.service.SaleorderService;
import com.devpro.shop16.ultilities.StringUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

@Controller
public class CartController extends BaseController {

    private final ProductService productService;

    private final SaleorderService saleOrderService;
    private final SaleorderProductsService saleorderProductsService;
    private final MailService mailService;

    public CartController(ProductService productService, SaleorderService saleOrderService, SaleorderProductsService saleorderProductsService, MailService mailService) {
        this.productService = productService;
        this.saleOrderService = saleOrderService;
        this.saleorderProductsService = saleorderProductsService;
        this.mailService = mailService;
    }

    @RequestMapping(value = {"/cart/checkout"}, method = RequestMethod.POST)
    public ResponseEntity<Map<String, Object>> cartFinish(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
            throws Exception {

        Map<String, Object> jsonResult = new HashMap<>();

        String customerFullName = request.getParameter("customer_name");
        String customerAddress = request.getParameter("customer_address");
        String customerEmail = request.getParameter("customer_email");
        String customerPhone = request.getParameter("customer_phone");
        if (customerFullName == null || customerFullName.isEmpty()) {
            jsonResult.put("error", "Vui lòng nhập họ tên");
        } else if (customerAddress == null || customerAddress.isEmpty()) {
            jsonResult.put("error", "Vui lòng nhập địa chỉ");
        } else if (customerEmail == null || customerEmail.isEmpty()) {
            jsonResult.put("error", "Vui lòng nhập email");
        } else if (customerPhone == null || customerPhone.isEmpty()) {
            jsonResult.put("error", "Vui lòng nhập số điện thoại");
        }

        if (jsonResult.containsKey("error")) {
            return ResponseEntity.badRequest().body(jsonResult);
        }
        Saleorder saleOrder = new Saleorder();

        saleOrder.setCustomer_name(customerFullName);
        saleOrder.setCustomer_email(customerEmail);
        saleOrder.setCustomer_address(customerAddress);
        saleOrder.setCustomer_phone(customerPhone);

        saleOrder.setCode(StringUtil.generateOrderCode());
        saleOrder.setPaymentType(1);
        saleOrder.setPaymentStatus(1);

        double fee = customerAddress.contains("Hà Nội") ? 15000 : 30000;
        saleOrder.setFee(fee);

        BigDecimal totalQuality = BigDecimal.ZERO;
        BigDecimal totalPrice = BigDecimal.ZERO;
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart != null) {
            for (CartItem cartItem : cart.getCartItems()) {
                SaleorderProducts saleOrderProducts = new SaleorderProducts();
                Product product = productService.getById(cartItem.getProductId());
                saleOrderProducts.setProduct(productService.getById(cartItem.getProductId()));
                saleOrderProducts.setQuality(cartItem.getQuanlity());
                saleOrderProducts.setTotal(cartItem.getPriceUnit().doubleValue() * cartItem.getQuanlity());

                // Giảm số lượng sản phẩm trong kho
                int remainingQuantity = product.getQuantity() - cartItem.getQuanlity();
                if (remainingQuantity < 0) {
                    jsonResult.put("error", "Xin lỗi , sản phẩm " + product.getTitle() + " này đã hết");
                } else {
                    product.setQuantity(remainingQuantity);
                    // Cập nhật sản phẩm trong cơ sở dữ liệu
                    productService.saveOrUpdate(product);

                    totalQuality = totalQuality.add(BigDecimal.valueOf(cartItem.getQuanlity()));
                    totalPrice = totalPrice.add(cartItem.getPriceUnit().multiply(BigDecimal.valueOf(cartItem.getQuanlity())));
                    saleOrder.addSaleOrderProducts(saleOrderProducts);
                }
            }
        }
        totalPrice = BigDecimal.valueOf(fee).add(totalPrice);
        saleOrder.setTotal(totalQuality);
        saleOrder.setTotalPrice(totalPrice);

        saleOrderService.saveOrUpdate(saleOrder);

        session.setAttribute("cart", null);
        session.setAttribute("totalItems", "0");

        NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
        String formattedTotalPrice = currencyFormat.format(saleOrder.getTotalPrice());
        String formattedFee = currencyFormat.format(saleOrder.getFee());

        //gửi email đơn hàng
        String to = saleOrder.getCustomer_email();
        String subject = "XÁC NHẬN ĐƠN HÀNG #" + saleOrder.getCode();
        String text = "Mã đơn hàng của bạn là #" + saleOrder.getCode() + "." + "<br>" +
                "Tổng hóa đơn này của bạn là : " + formattedTotalPrice + " ( đã bao gồm " + formattedFee + " tiền ship )." + "<br>" +
                "Nếu bạn đã chọn thanh toán bằng thẻ , vui lòng chuyển khoản vào Tài khoản : BIDV - ..." + "<br>"+
                "Nếu bạn đã chọn thanh toán bằng tiền mặt , hãy thanh toán khi nhận hàng nhé. " + "<br> " +
                "XIN CẢM ƠN BẠN RẤT NHIỀU!!";
        mailService.sendEmail(to, subject, text);


        //Đặt hàng thành công
        jsonResult.put("code", 200);
        jsonResult.put("status", "SUCCESS");
        jsonResult.put("success", "Đặt hàng thành công! " );

        // Thêm tổng số tiền vào model
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("success", "Đặt hàng thành công! " );

        return ResponseEntity.ok(jsonResult);
    }

    @RequestMapping(value = {"/cart/view"}, method = RequestMethod.GET)
    public String cartView(final Model model, final HttpServletRequest request, final HttpServletResponse response)
            throws IOException {
        return "khachhang/cart";
    }

    @GetMapping("cart/remove/{productId}")
    public String removeProduct(final HttpServletRequest request, @PathVariable("productId") int productId) {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        List<CartItem> cartItem = cart.getCartItems();
        Product product = productService.getById(productId);

        var index = 0;
        for (int i = 0; i < cartItem.size(); i++) {
            if (cartItem.get(i).getProductId() == productId) {
                index = i;
                break;
            }
        }
        cartItem.remove(index);
        this.calculateTotalPrice(request);
        return "redirect:/cart/view";
    }

    @RequestMapping(value = {"/ajax/updateQuanlityCart"}, method = RequestMethod.POST)
    public ResponseEntity<Map<String, Object>> ajax_UpdateQuanlityCart(final Model model, final HttpServletRequest request,
                                                                       final HttpServletResponse response, final @RequestBody CartItem cartItem) {

        HttpSession session = request.getSession();

        Cart cart = null;
        if (session.getAttribute("cart") != null) {
            cart = (Cart) session.getAttribute("cart");
        } else {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        List<CartItem> cartItems = cart.getCartItems();

        int currentProductQuality = 0;
        for (CartItem item : cartItems) {
            if (item.getProductId() == cartItem.getProductId()) {
                currentProductQuality = item.getQuanlity() + 1;
                item.setQuanlity(currentProductQuality);
            }
        }

        this.calculateTotalPrice(request);

        Map<String, Object> jsonResult = new HashMap<String, Object>();
        jsonResult.put("code", 200);
        jsonResult.put("status", "TC");
        jsonResult.put("totalItems", getTotalItems(request));
        jsonResult.put("currentProductQuality", currentProductQuality);

        session.setAttribute("totalItems", getTotalItems(request));
        return ResponseEntity.ok(jsonResult);
    }

    @RequestMapping(value = {"/ajax/truQuanlityCart"}, method = RequestMethod.POST)
    public ResponseEntity<Map<String, Object>> ajax_TruQuanlityCart(final Model model, final HttpServletRequest request,
                                                                    final HttpServletResponse response, final @RequestBody CartItem cartItem) {

        HttpSession session = request.getSession();

        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        List<CartItem> cartItems = cart.getCartItems();
        int ciProductQuality = 0;

        for (CartItem item : cartItems) {
            if (item.getProductId() == cartItem.getProductId()) {
                ciProductQuality = item.getQuanlity() - 1;
                item.setQuanlity(ciProductQuality);
            }
        }

        this.calculateTotalPrice(request);

        Map<String, Object> jsonResult = new HashMap<>();
        jsonResult.put("code", 200);
        jsonResult.put("status", "TC");
        jsonResult.put("totalItems", getTotalItems(request));
        jsonResult.put("ciProductQuality", ciProductQuality);

        session.setAttribute("totalItems", getTotalItems(request));

        return ResponseEntity.ok(jsonResult);
    }


    @RequestMapping(value = {"/ajax/addToCart"}, method = RequestMethod.POST)
    public ResponseEntity<Map<String, Object>> ajax_AddToCart(final Model model, final HttpServletRequest request,
                                                              final HttpServletResponse response, final @RequestBody CartItem cartItem) {

        HttpSession session = request.getSession();

        Cart cart = null;
        if (session.getAttribute("cart") != null) {
            cart = (Cart) session.getAttribute("cart");
        } else {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        List<CartItem> cartItems = cart.getCartItems();

        //Kiểm tra số lượng sản phẩm trong kho
        Product productInDb = productService.getById(cartItem.getProductId());

        if (productInDb.getQuantity() < cartItem.getQuanlity()) {
            Map<String, Object> jsonResult = new HashMap<String, Object>();
            jsonResult.put("code", 400);
            jsonResult.put("status", "ERROR");
            jsonResult.put("message", "Số lượng trong kho không đủ.");
            return ResponseEntity.ok(jsonResult);
        }
        boolean isExists = false;
        for (CartItem item : cartItems) {
            if (item.getProductId() == cartItem.getProductId()) {
                isExists = true;
                item.setQuanlity(item.getQuanlity() + cartItem.getQuanlity());
            }
        }

        if (!isExists) {

            cartItem.setProductName(productInDb.getTitle());
            cartItem.setPriceUnit(productInDb.getPrice());
            cartItem.setProductPictures(productInDb.getAvatar());
            cart.getCartItems().add(cartItem);
        }

        this.calculateTotalPrice(request);

        Map<String, Object> jsonResult = new HashMap<String, Object>();
        jsonResult.put("code", 200);
        jsonResult.put("status", "SUCCESS");
        jsonResult.put("totalItems", getTotalItems(request));

        session.setAttribute("totalItems", getTotalItems(request));
        return ResponseEntity.ok(jsonResult);
    }

    private int getTotalItems(final HttpServletRequest request) {
        HttpSession httpSession = request.getSession();

        if (httpSession.getAttribute("cart") == null) {
            return 0;
        }

        Cart cart = (Cart) httpSession.getAttribute("cart");
        List<CartItem> cartItems = cart.getCartItems();

        int total = 0;
        for (CartItem item : cartItems) {
            total += item.getQuanlity();
        }

        return total;
    }

    private void calculateTotalPrice(final HttpServletRequest request) {

        HttpSession session = request.getSession();

        Cart cart = null;
        if (session.getAttribute("cart") != null) {
            cart = (Cart) session.getAttribute("cart");
        } else {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        List<CartItem> cartItems = cart.getCartItems();
        BigDecimal total = BigDecimal.ZERO;

        for (CartItem ci : cartItems) {
            total = total.add(ci.getPriceUnit().multiply(BigDecimal.valueOf(ci.getQuanlity())));
        }

        cart.setTotalPrice(total);
    }
}
