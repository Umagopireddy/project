package com.program.helloworld.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.dao.CategoryDao;
import com.niit.models.Category;

@Controller
public class CategoryController {
	@Autowired
	CategoryDao categoryDao;
	
	
	
	@RequestMapping(value="/admin/addcategory",method=RequestMethod.POST)
	public String addcat(@ModelAttribute("categorydata") @Valid Category c,BindingResult bindingResult)
	{
		if (bindingResult.hasErrors()) {
			return "Categorypage"; 
		}
		Category c1=categoryDao.getCategory(c.getCategory_id());
		if(c1==null)
			categoryDao.addCategory(c);
		else
			categoryDao.updateCategory(c);
		
		return "redirect:/admin/categorylist";
	}
	
	
	@RequestMapping("/admin/categorylist")
	public ModelAndView clist()
	{
		List<Category> clist=categoryDao.categoryList();
		ModelAndView mv=new ModelAndView("Categorylist","catlist",clist);
		return mv;
	}
	
	@RequestMapping("/admin/Categorypage")
	public ModelAndView cat()
	{
		ModelAndView mv=new ModelAndView("Categorypage","command",new Category());
		
		return mv;
	
	}
	
	
	
	@RequestMapping(value="/admin/deletecategory/{category_id}")
	public String cdelete(@PathVariable("category_id")int category_id)
	{
		Category c=categoryDao.getCategory(category_id);
		try {
		categoryDao.deleteCategory(c);
		}
		catch(Exception e)
		{
			
		}
		return "redirect:/admin/categorylist";
	}
	
	@RequestMapping("/admin/categoryupdate/{category_id}")
	public ModelAndView cupdate(@PathVariable("category_id")int category_id)
	{
		Category c=categoryDao.getCategory(category_id);
		ModelAndView mv=new ModelAndView("Categorypage","command",c);
				return mv;
	
	}

	
	
	
}
