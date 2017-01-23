package com.egamestore.dao;

import com.egamestore.model.Product;

import java.util.List;

/**
 * Created by wjw on 1/19/17.
 */
public interface ProductDao {
    void addProduct(Product product);

//    void updateProduct(Product product);

    void deleteProduct(int id);

    Product getProductById(int id);

    List<Product> getProductList();

    void updateProduct(Product product);
}
