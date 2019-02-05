package com.program.helloworld.controller;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.niit.dao.CartDao;
import com.niit.dao.OrderDetailsDao;
import com.niit.dao.ProductDao;
import com.niit.models.Cart;
import com.niit.models.OrderDetails;
import com.niit.models.Product;
import com.niit.models.User;

@Controller
public class CartController {
	@Autowired
	private CartDao cartDao;
	@Autowired
	private ProductDao productDao;
	@Autowired
	private OrderDetailsDao orderdetailsDao;
	@Autowired
	Product p;
		
	@RequestMapping(value="/cart/addtocart/{product_id}")
	public String addToCart(@PathVariable int product_id,
			@RequestParam int requestedQuantity,@AuthenticationPrincipal Principal principal){//get two values from jsp page
		//1st value - product id
		//2nd value - requested quantity
		//to get user, use Principal Object
		//user,product,totalPrice,requested quantity
		String email="";
		if(principal!=null)
		email=principal.getName();
		
		Product product=productDao.getProduct(product_id);
		User user=cartDao.getUser(email);
		
		Cart cartItem=new Cart();
		cartItem.setQuantity(requestedQuantity);
		cartItem.setProduct(product);
		cartItem.setTotalPrice(product.getPrice()*requestedQuantity);
		cartItem.setUser(user);
		int flag=0;
		List<Cart> cartItems=cartDao.getCartItems(email);
		if(cartItems.size()==0 && requestedQuantity<=product.getQuantity())
		cartDao.addToCart(cartItem);
		else
		{
			for(Cart ct:cartItems)
			{
				p=ct.getProduct();
				if(p.getId()==product_id)
				{
					flag=1;
					ct.setQuantity(ct.getQuantity()+requestedQuantity);
					System.out.println(ct.getQuantity());
					if(ct.getQuantity()<=product.getQuantity())
					{
						cartDao.updateCart(ct);
					}
				}
			}
			     if(flag==0 && requestedQuantity<=product.getQuantity())
			    	 cartDao.addToCart(cartItem);
		}
		
		return "redirect:/cart/getcartitems";
	
					
				
			
			
	}
	
	
	
	@RequestMapping("/cart/getcartitems")
	public String getCartItems(@AuthenticationPrincipal Principal principal,Model model		){
		List<Cart> cartItems=null;
		if(principal!=null)
		cartItems=cartDao.getCartItems(principal.getName());
		model.addAttribute("cartItems",cartItems);
		return "Cart";
	}
	@RequestMapping("/cart/updatecartitem")
	public String updateCartItem(@RequestParam int cartItemId,@RequestParam int requestedQuantity){
		System.out.println(cartItemId + " " + requestedQuantity);
		cartDao.updateCartItem(cartItemId,requestedQuantity);
		return "redirect:/cart/getcartitems";
	}

	@RequestMapping(value="/cart/removecartitem/{cart_Id}")
	public String deleteCartItem(@PathVariable int cart_Id){
	    cartDao.deleteCartItem(cart_Id);
		return "redirect:/cart/getcartitems";
	}
	
	
	@RequestMapping(value="/cart/createorder")
	public String createCustomerOrder(@AuthenticationPrincipal Principal principal,HttpSession session){
		//set updated shippingaddress in customer object 
		
		String email=principal.getName();
		User user=cartDao.getUser(email);
		
		
		OrderDetails customerOrder=new OrderDetails();
		customerOrder.setPurchaseDate(new Date());
		customerOrder.setUser(user);
		
		List<Cart> cartItems=cartDao.getCartItems(email);
	double grandTotal=0.0;
		for(Cart cartItem:cartItems){
			grandTotal=cartItem.getTotalPrice()+grandTotal;
		}
		customerOrder.setGrandTotal(grandTotal);
		orderdetailsDao.addOrder(customerOrder);
		for(Cart cartItem:cartItems)
		{
			p=cartItem.getProduct();
			p.setQuantity(p.getQuantity()-cartItem.getQuantity());
			productDao.updateProduct(p);
			cartDao.deleteCartItem(cartItem.getCartItemId());
		}

		return "redirect:/orderdisplay";
	}
	
}
