package com.egamestore.model;

/**
 * Created by wjw on 1/22/17.
 */

public class CartItem {
    private  Product product;
    private  double totalPrice;
    private  int quantity;
    public CartItem(Product product) {
        this.product = product;
        this.totalPrice = product.getProductPrice();
        this.quantity = 1;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
        updateTotalprice();
    }

    public void updateTotalprice(){
        totalPrice = product.getProductPrice()*quantity;
    }
}
