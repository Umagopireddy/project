package com.niit.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.niit.models.User;

@Repository("userDao")
public interface UserDao {
	void addUser(User u);
	List<User> userList();
	boolean updateUser(User u);
	void deleteUser(User u);
	User getUser(String id);
	

}
