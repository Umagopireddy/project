package com.niit.dao;

import java.util.List;

import javax.persistence.criteria.Order;

import org.springframework.stereotype.Repository;

import com.niit.models.OrderDetails;

@Repository("orderdetailsDao")
public interface OrderDetailsDao {
	boolean addOrder(OrderDetails order);
	OrderDetails getOrder(int id);
	List<OrderDetails> listOrders(String email);

}
