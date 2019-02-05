package com.niit.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.dao.ProductDao;
import com.niit.models.Product;

@Repository("productDao")
@Transactional
public class ProductDaoImpl implements ProductDao{

	@Autowired
	SessionFactory sessionFactory;
	
	public boolean addProduct(Product p) {
		sessionFactory.getCurrentSession().save(p);
		return true;
	}

	public List<Product> productList() {
		List<Product> plist=sessionFactory.getCurrentSession().createQuery("from Product").list();
		return plist;
	}
	
	public boolean updateProduct(Product p) {
		sessionFactory.getCurrentSession().update(p);
		return true;
	}

	public boolean deleteProduct(Product p) {
		sessionFactory.getCurrentSession().delete(p);
		return true;
	}

	public Product getProduct(int id) {
		Product p=(Product) sessionFactory.getCurrentSession().get(Product.class, id);
		return p;
	}

	public List<Product> listCategoryWiseProducts(int category_id) {
	List<Product> plist=sessionFactory.getCurrentSession().createQuery("from Product where category_id="+category_id).list();
		return plist;
	}

	public List<Product> listSupplierWiseProducts(int supplier_id) {
		// TODO Auto-generated method stub
		return null;
	}

}
