package com.devpro.shop16.controller.quantrivien;

import com.devpro.shop16.controller.BaseController;
import com.devpro.shop16.dto.SearchModel;
import com.devpro.shop16.repository.ContactRepository;
import com.devpro.shop16.service.ContactService;
import com.devpro.shop16.service.IContactService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class AdminContactController extends BaseController{
	
	private final ContactService contactService;

	public AdminContactController(ContactService contactService, IContactService iContactService, ContactRepository contactRepository) {
		this.contactService = contactService;
		this.iContactService = iContactService;
		this.contactRepository = contactRepository;
	}

	private final IContactService iContactService;

	private final ContactRepository contactRepository;

	@RequestMapping(value = { "/admin/contact" }, method = RequestMethod.GET)
	public String adminContact(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {

		SearchModel searchModel = new SearchModel();
		searchModel.keyword = request.getParameter("keyword");
		searchModel.setPage(getCurrentPage(request));
		
		model.addAttribute("contactWithPaging", contactService.search(searchModel));
		model.addAttribute("searchModel", searchModel);

		return "quantrivien/contact";
	}

	@GetMapping ("/delete-contact/{id}")
	public String deleteContact(@PathVariable("id") Integer id) {
		contactRepository.deleteById(id);
		return "redirect:/admin/contact";
	}
}
