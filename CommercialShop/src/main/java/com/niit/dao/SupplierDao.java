package com.niit.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.niit.models.Supplier;

@Repository("supplierDao")
public interface SupplierDao {
	void addSupplier(Supplier s);
	List<Supplier> supplierList();
	boolean updateSupplier(Supplier s);
	void deleteSupplier(Supplier s);
	Supplier getSupplier(int id);

}
