package com.egamestore.model;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by wjw on 1/22/17.
 */
public class Cart {
    private String cartId;
    private Map<Integer ,CartItem> map ;
    private double grandTotal;

    public Cart(){
        map = new HashMap<Integer, CartItem>();
        grandTotal = 0;
    }

    public Cart(String cartId) {
        this();
        this.cartId = cartId;
    }

    public String getCartId() {
        return cartId;
    }

    public void setCartId(String cartId) {
        this.cartId = cartId;
    }

    public Map<Integer, CartItem> getMap() {
        return map;
    }

    public void setMap(Map<Integer, CartItem> map) {
        this.map = map;
    }

    public double getGrandTotal() {
        return grandTotal;
    }

    public void setGrandTotal(double grandTotal) {
        this.grandTotal = grandTotal;
    }

    public void addCartItem(CartItem item){
        int productId = item.getProduct().getProductId();
        if(map.containsKey(productId)){
            CartItem existingItem = map.get(productId);
            existingItem.setQuantity(existingItem.getQuantity()+item.getQuantity());
            map.put(productId,existingItem);
        }else {
            map.put(productId,item);
        }
        updateGrandTotal();
    }

    public  void removeCartItem(CartItem item){
        int productId = item.getProduct().getProductId();
        map.remove(productId);
        updateGrandTotal();
    }

    public void updateGrandTotal(){
        grandTotal = 0;
        for(CartItem item : map.values()){
            grandTotal+=item.getTotalPrice();
        }
    }
}
