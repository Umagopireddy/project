//package com.niit.commercialshop;
//
//import static org.junit.Assert.assertTrue;
//
//import java.util.List;
//
//import org.junit.BeforeClass;
//import org.junit.Ignore;
//import org.junit.Test;
//import org.springframework.context.annotation.AnnotationConfigApplicationContext;
//
//import com.niit.dao.ProductDao;
//import com.niit.models.Product;
//
//public class ProductTestCase {
//	static ProductDao productDao;
//	
//	@BeforeClass
//	public static void execute() {
//		AnnotationConfigApplicationContext context=new AnnotationConfigApplicationContext();
//		
//		context.scan("com.niit");;
//		context.refresh();
//		
//		productDao=(ProductDao)context.getBean("productDao");
//	}
//
//	@Test
//	public void addProductTest()
//	{
//		Product product=new Product();
//		product.setId(80);
//		product.setProductname("window");
//		product.setDescription("black");
//		product.setQuantity(6);
//		
//		assertTrue("Problem in Adding the Category",productDao.addProduct(product));
//	}
//	
//	@Ignore
//	@Test
//	public void updateProductTest()
//	{
//		Product product=productDao.getProduct(23);
//		product.setProductname("crafts");
//		assertTrue("Problem in Updating",productDao.updateProduct(product));
//	}
//	@Ignore
//	@Test
//	public void deleteProductTest()
//	{
//		Product product=productDao.getProduct(16);
//				assertTrue("Problem in deleting",productDao.deleteProduct(product));
//	}
//	@Ignore
//	@Test
//	public void listProductsTest()
//	{
//		List<Product>listProducts=productDao.productList();
//		
//		assertTrue("Problem in Listing",listProducts.size()>0);
//		
//		for(Product product:listProducts)
//		{
//			System.out.println("Product ID:"+product.getId());
//			System.out.println("Product Name:"+product.getProductname());
//			System.out.println("Product Description:"+product.getDescription());
//			System.out.println("Product Price:"+product.getPrice());
//			System.out.println("Product Quantity:"+product.getQuantity());
//		}
//	}
//}
//
//			
//			
//			
//		
//	
//	
//
//	
//
