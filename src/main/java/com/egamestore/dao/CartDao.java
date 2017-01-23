package com.egamestore.dao;

import com.egamestore.model.Cart;

/**
 * Created by wjw on 1/22/17.
 */
public interface CartDao {

    Cart create(Cart cart);

    Cart read(String CartId);

    void update(String CartId ,Cart cart);

    void delete(String CartId);
}
