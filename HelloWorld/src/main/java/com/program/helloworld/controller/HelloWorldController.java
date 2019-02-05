package com.program.helloworld.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.dao.CategoryDao;
import com.niit.dao.OrderDetailsDao;
import com.niit.dao.ProductDao;
import com.niit.dao.UserDao;
import com.niit.models.OrderDetails;
import com.niit.models.User;


@Controller
public class HelloWorldController {
	@Autowired
	ProductDao productDao;
	
	@Autowired
	OrderDetailsDao orderdetailsDao;
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	CategoryDao categoryDao;
	
	String message = "Welcome to Spring MVC!";
	
	
	
	
	
	
	
	
	@RequestMapping("/")
	public ModelAndView home()
	{
		
		ModelAndView mv=new ModelAndView("Homepage");
		mv.addObject("productlist",productDao.productList());
		return mv;
	
	}
	
	@RequestMapping("/Homepage")
	public ModelAndView page()
	{
		ModelAndView mv=new ModelAndView("Homepage");
		mv.addObject("productlist",productDao.productList());
		mv.addObject("categories",categoryDao.categoryList());
		return mv;
	}
	

	
	
	
	@RequestMapping("/navbar")
	public ModelAndView nav()
	{
		ModelAndView mv=new ModelAndView("navbar");
		return mv;
	}
	
	@RequestMapping("/signup")
	public ModelAndView up()
	{
		ModelAndView mv=new ModelAndView("signup","command",new User() );
		return mv;
	}
	
	
	@RequestMapping("/signin")
	public ModelAndView in()
	{
		ModelAndView mv=new ModelAndView("signin","command",new User() );
		return mv;
	}
	
	
	
	
	//@RequestMapping("/OrderDetails")
//	public String createOrderDetails(@ModelAttribute int orderId, Model model,
//			@AuthenticationPrincipal Principal principal,HttpSession session){
//		
//		
//		
////		Customer customer=user.getCustomer();
////		customer.setShippingAddress(shippingAddress);
////		
////		user.setCustomer(customer);
////		customer.setUser(user);
//		
//		String email=principal.getName();
//	User user=cartItemDao.getUser(email);
//		OrderDetails order=new OrderDetails();
//		order.setPurchaseDate(new Date());
//		order.setUser(user);
//		
//		List<OrderDetails> OrderDetails=.getCartItem(email);
//		double grandTotal=0.0;
//		for(CartItem cartItem:cartItems){
//			grandTotal=cartItem.getTotalPrice()+grandTotal;
//		}
//		(grandTotal);
//		//insert into customerorder values (....)
//		//update shippingaddress set ..... where shippingid=?
//		cartItemDao.createOrderDetails(OrderDetails);
//		model.addAttribute("cartItems",cartItems);
//		//delete all cartitem's from cartitem table for this login id
//		//update the product quantity 
//		
////		for(CartItem cartItem:cartItems){
////			Product product=cartItem.getProduct();
////			product.setQuantity(product.getQuantity() - cartItem.getQuantity());
////			productDao.saveOrUpdate(product);
////			cartItemDao.removeCartItem(cartItem.getCartItemId());
////		}
//		session.setAttribute("cartSize", 0);
//		model.addAttribute("OrderDetails",orderdetails);
//		return "orderdetails";
//	}
	



@RequestMapping("/Carddetails")
public ModelAndView card()
{
	ModelAndView mv = new ModelAndView("Carddetails");
	return mv;
}

@RequestMapping("/admin/adminpage")
public ModelAndView url()
{
	ModelAndView mv=new ModelAndView("Url");
	return mv;
}


@RequestMapping("/orderdisplay")
public String display(@AuthenticationPrincipal Principal principal,Model model){
	String email=principal.getName();
	User user=userDao.getUser(email);
	System.out.println(email);
  List<OrderDetails> OrderDetails=orderdetailsDao.listOrders(email);
  model.addAttribute("odlist",OrderDetails);
		return "Orderdetails"; 
	
}


}	
	
			
					
			
			
		
	
	

