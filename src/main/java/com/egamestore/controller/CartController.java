package com.egamestore.controller;

import com.egamestore.dao.CartDao;
import com.egamestore.dao.ProductDao;
import com.egamestore.model.Cart;
import com.egamestore.model.CartItem;
import com.egamestore.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by wjw on 1/22/17.
 */
@Controller
@RequestMapping("/rest/cart")
public class CartController {
    @Autowired
    private CartDao cartDao;

    @Autowired
    private ProductDao productDao;

    @RequestMapping(value = "/{cartId}",method = RequestMethod.GET)
    public @ResponseBody Cart getCart(@PathVariable(value = "cartId") String cartId){
        System.out.println("I'm in here get part of controller");
        return cartDao.read(cartId);
    }

    @RequestMapping(value = "/{cartId}",method = RequestMethod.PUT)
    @ResponseStatus(value = HttpStatus.NO_CONTENT)
    public void  update(@PathVariable(value = "cartId") String cartId, @RequestBody Cart cart){
        cartDao.update(cartId,cart);
    }

    @RequestMapping(value = "/{cartId}",method = RequestMethod.DELETE)
    @ResponseStatus(value = HttpStatus.NO_CONTENT)
    public void delete(@PathVariable(value = "cartId") String cartId){
        cartDao.delete(cartId);
    }

    @RequestMapping(value = "/add/{productId}",method = RequestMethod.PUT)
    @ResponseStatus(value = HttpStatus.NO_CONTENT)
    public  void  addItem(@PathVariable(value = "productId") int productId, HttpServletRequest request){
        String sessionId = request.getSession().getId();
        Cart cart = cartDao.read(sessionId);

        if(cart==null){
            cart = cartDao.create(new Cart(sessionId));
        }

        Product product = productDao.getProductById(productId);
        if(product==null){
            throw new IllegalArgumentException(new Exception());
        }

        cart.addCartItem(new CartItem(product));

        cartDao.update(sessionId,cart);
    }

    @RequestMapping(value = "/remove/{productId}",method = RequestMethod.PUT)
    @ResponseStatus(value = HttpStatus.NO_CONTENT)
    public  void  removeItem(@PathVariable(value = "productId") int productId, HttpServletRequest request){
        String sessionId = request.getSession().getId();
        Cart cart = cartDao.read(sessionId);

        if(cart==null){
            cart = cartDao.create(new Cart(sessionId));
        }

        Product product = productDao.getProductById(productId);
        if(product==null){
            throw new IllegalArgumentException(new Exception());
        }

        cart.removeCartItem(new CartItem(product));

        cartDao.update(sessionId,cart);
    }

    @ExceptionHandler(IllegalArgumentException.class)
    @ResponseStatus(value = HttpStatus.BAD_REQUEST, reason = "Illegal request ,please check your payload")
    public void handleClientErrors(Exception e){

    }

    @ExceptionHandler(Exception.class)
    @ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR, reason = "Internal Server error ")
    public void handleServerErrors(Exception e){

    }

}
