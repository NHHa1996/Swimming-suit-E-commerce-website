/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import model.shop.Cart;
import model.shop.Ordered;
import model.user.Customer;

/**
 *
 * @author Cuong
 */
public interface CartDAO {
    
    public Cart getCartByUserID(Customer customer);
    
    public void addProductToCart(Ordered ordered, Customer owner);
    
}
