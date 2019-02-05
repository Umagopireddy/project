package com.niit.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.niit.models.Product;

@Repository("productDao")
public interface ProductDao {
boolean addProduct(Product p);
List<Product> productList();
boolean updateProduct(Product p);
boolean deleteProduct(Product p);
Product getProduct(int id);
public List<Product> listCategoryWiseProducts(int category_id);
public List<Product> listSupplierWiseProducts(int supplier_id);
}
