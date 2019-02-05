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

import com.niit.dao.SupplierDao;
import com.niit.models.Supplier;
@Controller
public class SupplierController {
	@Autowired
	SupplierDao supplierDao;
	
	
	

	@RequestMapping("/admin/supplierlist")
	public ModelAndView slist()
	{
		List<Supplier> clist=supplierDao.supplierList();
		ModelAndView mv=new ModelAndView("Supplierlist","suplist",clist);
		return mv;
	}
	
		
		@RequestMapping("/admin/Supplierpage")
			public ModelAndView sup()
			{
				ModelAndView mv=new ModelAndView("Supplierpage","command",new Supplier());
				return mv;
			}
			
		   
			
			
			@RequestMapping(value="/admin/deletesupplier/{supplier_id}")
			public String sdelete (@PathVariable("supplier_id")int supplier_id)
			{
				Supplier s=supplierDao.getSupplier(supplier_id);
				supplierDao.deleteSupplier(s);
				return "redirect:/supplierlist";
			}
			
			@RequestMapping("/admin/supplierupdate/{supplier_id}")
			public ModelAndView supdate(@PathVariable("supplier_id")int supplier_id)
			{
				Supplier s=supplierDao.getSupplier(supplier_id);
				ModelAndView mv=new ModelAndView("Supplierpage","command",s);
				return mv;
			
			}
			
			
			
			@RequestMapping(value="/admin/addsupplier",method=RequestMethod.POST)
			public String add1(@ModelAttribute("supplierdata") @Valid Supplier s,BindingResult bindingResult)
			{
				if (bindingResult.hasErrors()) {
					return "Supplierpage"; 
				}
				Supplier s1=supplierDao.getSupplier(s.getSupplier_id());
				if(s1==null)
					supplierDao.addSupplier(s);
				else
					supplierDao.updateSupplier(s);
				return "redirect:/admin/supplierlist";
			}
}
			

