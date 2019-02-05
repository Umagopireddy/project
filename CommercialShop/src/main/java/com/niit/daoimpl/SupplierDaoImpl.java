package com.niit.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.dao.SupplierDao;
import com.niit.models.Supplier;

@Repository("SupplierDao")
@Transactional
public class SupplierDaoImpl implements SupplierDao {
	
	@Autowired
	SessionFactory sessionFactory;

	
	public void addSupplier(Supplier s) {
		sessionFactory.getCurrentSession().save(s);
	}
		
		public List<Supplier> supplierList() {
			List<Supplier> slist=sessionFactory.getCurrentSession().createQuery("from Supplier").list();
			return slist;
		}
		
		public boolean updateSupplier(Supplier s) {
			sessionFactory.getCurrentSession().update(s);
			return true;
		}
		
		public void deleteSupplier(Supplier s) {
			sessionFactory.getCurrentSession().delete(s);
		}
		
		public Supplier getSupplier(int id) {
			Supplier s=(Supplier) sessionFactory.getCurrentSession().get(Supplier.class, id);
			return s;
		}
}
