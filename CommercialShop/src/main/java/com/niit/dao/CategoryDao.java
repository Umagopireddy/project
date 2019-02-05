package com.niit.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.niit.models.Category;


@Repository("categoryDao")
public interface CategoryDao {
void addCategory(Category c);
List<Category> categoryList();
boolean updateCategory(Category c);
void deleteCategory(Category c);
Category getCategory(int id);
}
