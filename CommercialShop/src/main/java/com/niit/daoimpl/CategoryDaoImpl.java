package com.niit.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.dao.CategoryDao;
import com.niit.models.Category;

@Repository("categoryDao")
@Transactional
public class CategoryDaoImpl implements CategoryDao{
	@Autowired
	SessionFactory sessionFactory;
	
	public void addCategory(Category c) {
		sessionFactory.getCurrentSession().save(c);
		}
	public List<Category> categoryList() {
		List<Category> clist=sessionFactory.getCurrentSession().createQuery("from Category").list();
		return clist;
	}
	public boolean updateCategory(Category c) {
		sessionFactory.getCurrentSession().update(c);
		return true;
	}
	public void deleteCategory(Category c) {
		sessionFactory.getCurrentSession().delete(c);
	}
	public Category getCategory(int id) {
		Category c=(Category) sessionFactory.getCurrentSession().get(Category.class, id);
		return c;
	}

}
