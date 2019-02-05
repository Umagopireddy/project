package com.niit.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.dao.UserDao;
import com.niit.models.Authorities;
import com.niit.models.User;


@Repository("userDao")
@Transactional
public class UserDaoImpl implements UserDao {
	
	@Autowired
	SessionFactory sessionFactory;
	
	public void addUser(User u) {
		Authorities a=u.getAuthorities();
		a.setUser(u);
		sessionFactory.getCurrentSession().save(u);
	}
	
	public List<User> userList() {
		List<User> ulist=sessionFactory.getCurrentSession().createQuery("from User").list();
		return ulist;
	}
	
	public boolean updateUser(User u) {
		sessionFactory.getCurrentSession().update(u);
		return true;
	}
	
	public void deleteUser(User u) {
		sessionFactory.getCurrentSession().delete(u);
	}
	
	public User getUser(String id) {
		User u=(User) sessionFactory.getCurrentSession().get(User.class, id);
		return u;
	}
}
