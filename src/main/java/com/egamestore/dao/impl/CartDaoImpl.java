package com.egamestore.dao.impl;

import com.egamestore.dao.CartDao;
import com.egamestore.model.Cart;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by wjw on 1/22/17.
 */
@Repository
public class CartDaoImpl implements CartDao{
    private Map<String, Cart> map;

    public CartDaoImpl() {
        this.map = new HashMap<String, Cart>();
    }

    public Cart create(Cart cart) {
        String cartId = cart.getCartId();
        if(map.containsKey(cartId)){
            throw new IllegalArgumentException(String.format("Cannot create cart with id already exists",cartId));
        }
        map.put(cartId,cart);
        return cart;
    }

    public Cart read(String CartId) {
        return map.get(CartId);
    }

    public void update(String CartId, Cart cart) {
        if(!map.containsKey(CartId)){
            throw new IllegalArgumentException(String.format("Cannot delete cart with id doesn't exists",CartId));
        }
        map.put(CartId,cart);
    }


    public void delete(String CartId) {
        if(!map.containsKey(CartId)){
            throw new IllegalArgumentException(String.format("Cannot delete cart with id doesn't exists",CartId));
        }
        map.remove(CartId);
    }
}
