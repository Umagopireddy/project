package com.niit.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.niit.models.Cart;

import com.niit.models.User;
@Repository("cartDao")
public interface CartDao {
void addToCart(Cart cartItem);
User getUser(String email);
List<Cart> getCartItems(String email);
void deleteCartItem(int cartItemId);
void updateCartItem(int cartItemId, int requestedQuantity);
void updateCart(Cart c);
//CustomerOrder createCustomerOrder(CustomerOrder customerOrder);
}
