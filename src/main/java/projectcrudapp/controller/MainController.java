package projectcrudapp.controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.RedirectView;

import projectcrudapp.dao.ProductDao;
import projectcrudapp.model.Product;

@Controller
@RequestMapping("/home")
public class MainController {
	@Autowired
	private ProductDao productDao;

	@RequestMapping("/")
	public String home(Model m) {
		List<Product> products = productDao.getProducts();
		m.addAttribute("products", products);
		m.addAttribute("title", "HOME PAGE");
		return "index";
	}

	// show add product page
	@RequestMapping("/add-product")
	public String addProduct(Model m) {
		m.addAttribute("title", "ADD PRODUCT");

		return "add_product_form";
	}

	// control add operation
	@RequestMapping(value="/handle-product", method = RequestMethod.POST)
	public RedirectView handleProduct(@ModelAttribute ("product") Product product, HttpServletRequest request) {

		productDao.createProduct(product);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/home/");
		return redirectView;
	}
	@RequestMapping("/delete-product/{productId}")
	public RedirectView deleteProduct(@PathVariable("productId") int pid ,HttpServletRequest request) {
		this.productDao.deleteProduct(pid);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/home/");
		return redirectView;
	}

	@RequestMapping("/update-product/{productId}")
	public String updateProduct(@PathVariable("productId") int pid ,Model model) {
		Product product = this.productDao.getProduct(pid);
		model.addAttribute("product",product);
		return "update_product_form";
	}

	@RequestMapping(value="/handle-update-request", method = RequestMethod.POST)
	public RedirectView handleUpdateProduct(@ModelAttribute ("product") Product product, HttpServletRequest request) {
		System.out.println("hello");
		try {
			this.productDao.updateProduct(product); // Use updateProduct, not deleteProduct and createProduct  // could also use createorupdate instead
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e + "not updated");

		}
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/home/");
		return redirectView;
	}
}
