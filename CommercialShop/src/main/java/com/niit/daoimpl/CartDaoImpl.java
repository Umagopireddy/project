package com.niit.daoimpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.dao.CartDao;
import com.niit.models.Cart;
import com.niit.models.Product;
import com.niit.models.User;
@Repository("cartDao")
@Transactional
public class CartDaoImpl implements CartDao {
	@Autowired
private SessionFactory sessionFactory;
	public void addToCart(Cart cartItem) {
		Session session=sessionFactory.getCurrentSession();
		session.save(cartItem);//insert into cartItem...
	}
	public User getUser(String email) {
		Session session=sessionFactory.getCurrentSession();
		User user=(User)session.get(User.class, email);
		return user;
	}
	public List<Cart> getCartItems(String email) {
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from Cart where user.email_id=:email");
		query.setString("email", email);
		List<Cart> cartItems=query.list();
		return cartItems;
		
	}
	public void updateCartItem(int cartItemId, int requestedQuantity) {
		//update requestedQuantity and also totalPrice
		  Session session=sessionFactory.getCurrentSession();
		  Cart cartItem=(Cart)session.get(Cart.class, cartItemId);
		  cartItem.setQuantity(requestedQuantity);//updated quantity
		  cartItem.setTotalPrice(requestedQuantity * cartItem.getProduct().getPrice());
		  session.update(cartItem);
	}
	public void deleteCartItem(int cartItemId) {
		Session session=sessionFactory.getCurrentSession();
		Cart cartItem=(Cart)session.get(Cart.class, cartItemId);
		session.delete(cartItem);
		
	}
	public void updateCart(Cart c) {
		sessionFactory.getCurrentSession().update(c);
		
	}

}
