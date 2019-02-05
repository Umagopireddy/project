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

import com.niit.dao.ProductDao;
import com.niit.dao.UserDao;
import com.niit.models.Product;
import com.niit.models.User;

@Controller
public class UserController {
	@Autowired
	UserDao userDao;
	

	@RequestMapping("/userlist")
	public ModelAndView ulist()
	{
		List<User> ulist=userDao.userList();
		ModelAndView mv=new ModelAndView("Userlist","uselist",ulist);
		return mv;
	}
	
	
	@RequestMapping(value="/adduser",method=RequestMethod.POST)
	public String add1(@ModelAttribute("command") @Valid User u,Model m,BindingResult bindingResult)
	{
		System.out.println("adding user");

		if (bindingResult.hasErrors()) {
			m.addAttribute("command",new User());
			return "Userpage"; 
		}
		User u1=userDao.getUser(u.getEmail_id());
		if(u1==null)
		userDao.addUser(u);
		else
	userDao.updateUser(u);
		return "redirect:/signin";
	}
	
	
	
	
	@RequestMapping("/Userpage")
	public ModelAndView pro()
	{
		ModelAndView mv=new ModelAndView("Userpage","command",new User());
		
		return mv;
	}
	
	
	
	

}
