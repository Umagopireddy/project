package com.program.helloworld.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.niit.dao.CategoryDao;
import com.niit.dao.ProductDao;
import com.niit.dao.SupplierDao;
import com.niit.models.Category;
import com.niit.models.Product;
import com.niit.models.Supplier;
@Controller
public class ProductController {
	@Autowired
	ProductDao productDao;
	
	@Autowired
	CategoryDao categoryDao;
	
	@Autowired
	  SupplierDao supplierDao;
	
	@RequestMapping("/productlist")
	public ModelAndView plist()
	{
		List<Product> plist=productDao.productList();
		ModelAndView mv=new ModelAndView("Productlist","prodlist",plist);
		return mv;
	}
	
	@RequestMapping(value="/admin/addproduct",method=RequestMethod.POST)
	public String add1(@ModelAttribute("command") @Valid Product p,Model m,BindingResult bindingResult,HttpServletRequest request  )
	{
		if (bindingResult.hasErrors()) {
			m.addAttribute("command",new Product());
			return "Productpage"; 
		}
		Product p1=productDao.getProduct(p.getId());
		int cid=p.getCategory().getCategory_id();
		Category cat=categoryDao.getCategory(cid);
		p.setCategory(cat);
		int sid=p.getSupplier().getSupplier_id();
		Supplier sup=supplierDao.getSupplier(sid);
		p.setSupplier(sup);
		
		if(p1==null)
		productDao.addProduct(p);
		else
			productDao.updateProduct(p);
		
		
		System.out.println(request.getServletContext().getRealPath("/"));
		//Get the uploaded image and transfer the image to a file named productid.png 
		Path path=Paths.get(request.getServletContext().getRealPath("/")+ "/WEB-INF/resources/images/"+p.getId()+".jpg");
		
		MultipartFile img=p.getImage();//image uploaded by the user
		if(img!=null && !img.isEmpty()){
			File file=new File(path.toString());
			try {
				img.transferTo(file);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return "redirect:/productlist";
	}
	
	
	@RequestMapping("/categorydisplay/{category_id}")
	public ModelAndView catproducts(@PathVariable("category_id") int id)
	{
		List<Product> plist=productDao.listCategoryWiseProducts(id);
		
		ModelAndView mv=new ModelAndView("Homepage");
		mv.addObject("categories",categoryDao.categoryList());
		mv.addObject("productlist",plist);
		return mv;
	}
	
	@RequestMapping("/admin/Productpage")
	public ModelAndView pro()
	{
		ModelAndView mv=new ModelAndView("Productpage","command",new Product());
		mv.addObject("suppliers",supplierDao.supplierList());
		
		mv.addObject("categories",categoryDao.categoryList());
		mv.addObject("prodlist",productDao.productList());
		
		return mv;
	}
	
	
	
	 @RequestMapping(value="/admin/deleteproduct/{id}")
		public  String pdelete(@PathVariable("id") int id)
{
Product p=productDao.getProduct(id);
productDao.deleteProduct(p);
return "redirect:/productlist";
	}
		
		
		@RequestMapping("/admin/productupdate/{id}")
		public ModelAndView pupdate(@PathVariable("id") int id)
		{
			Product p=productDao.getProduct(id);
			ModelAndView mv=new ModelAndView("Productpage","command",p);
			mv.addObject("suppliers",supplierDao.supplierList());
			
			mv.addObject("categories",categoryDao.categoryList());
			return mv;
		}
		
		
		@RequestMapping("/viewproduct/{id}")
		public ModelAndView view(@PathVariable("id")int id)
		{
			Product p=productDao.getProduct(id);
			ModelAndView mv=new ModelAndView("viewproduct","product",p);
			return mv;
		}
		}


