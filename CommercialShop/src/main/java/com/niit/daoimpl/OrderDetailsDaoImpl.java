package com.niit.daoimpl;

import java.util.List;

import javax.persistence.criteria.Order;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.dao.OrderDetailsDao;
import com.niit.models.OrderDetails;

@Repository("orderdetailsDao")
@Transactional
public class OrderDetailsDaoImpl implements OrderDetailsDao {
	@Autowired
	private SessionFactory sessionFactory;
		public OrderDetailsDaoImpl(){
			System.out.println("OrderDetailsDaoImpl bean is created..");
		}
		public boolean addOrder(Order order) {
	       Session session= sessionFactory.getCurrentSession();
	       session.save(order);//Generate insert query..
	       return true;
		}
		public OrderDetails getOrder(int id) {
			Session session=sessionFactory.getCurrentSession();
			OrderDetails order=(OrderDetails)session.get(OrderDetails.class, id);
			//SQL query select * from product where id=?
			return order;
		}
//		@Override
//		public List<OrderDetails> listOrders() {
//			
//			    String s1="from Order";
//				Query o=sessionFactory.getCurrentSession().createQuery(s1);
//				List<OrderDetails> list=o.list();
//				return list;
//			
			
		
		public List<OrderDetails> listOrders(String email) {
                String s1="from OrderDetails where user.email_id='"+email+"'";
                Query o=sessionFactory.getCurrentSession().createQuery(s1);
				List<OrderDetails> list=o.list();
				return list;
		}
		
		
public boolean addOrder(OrderDetails order) {
	sessionFactory.getCurrentSession().save(order);
	return false;
}
	

}
