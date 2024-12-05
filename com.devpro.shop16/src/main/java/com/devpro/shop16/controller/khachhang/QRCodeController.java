package com.devpro.shop16.controller.khachhang;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;

@Controller
public class QRCodeController {


	public QRCodeController() {}


	@RequestMapping(value = { "/qrcode" }, method = RequestMethod.GET)
	public String qrCode(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		BigDecimal totalPrice = (BigDecimal) model.asMap().get("totalPrice");
		model.addAttribute("totalPrice", totalPrice);

		return "khachhang/qrcode";
	}



}
