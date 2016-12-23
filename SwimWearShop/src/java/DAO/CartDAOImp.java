/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import controller.DatabaseController;
import static controller.DatabaseController.updateDatabase;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.shop.Cart;
import model.shop.Product;
import model.shop.Ordered;
import model.user.Customer;

/**
 *
 * @author Cuong
 */
public class CartDAOImp implements CartDAO {

    @Override
    public Cart getCartByUserID(Customer customer) {

        ProductDAO productDAO = new ProductDAOImp();

        try {
            DatabaseController.createConnection();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAOImp.class.getName()).log(Level.SEVERE, null, ex);
        }
        Cart cart = new Cart();
        cart.setOwner(customer);
        int userID = customer.getUserID();

        String query = "SELECT * from cart WHERE customerID = '" + userID + "'";

        try {
            ResultSet rs = DatabaseController.executeQuery(query);
            while (rs.next()) {
                Product product = productDAO.getProductByID(rs.getInt("proID"));
                int quantity = rs.getInt("quantity");
                Ordered productOdered = new Ordered(product, quantity);
                cart.addProduct(productOdered);
            }
            rs.close();
            DatabaseController.closeConnection();
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAOImp.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cart;
    }

    private boolean isInCart(Ordered ordered, Customer owner) {
        Cart cart = getCartByUserID(owner);
        int customerID = owner.getUserID();
        int proID = ordered.getProduct().getProID();
        
        for (int i = 0; i < cart.getListOrdered().size(); i++) {
            if (cart.getListOrdered().get(i).getProduct().getProID() == proID && owner.getUserID() == customerID) {
                return true;
            }
        }
        return false;
    }

    @Override
    public void addProductToCart(Ordered ordered, Customer owner) {
        int quantity = ordered.getQuantity();
        int userID = owner.getUserID();
        int proID = ordered.getProduct().getProID();
        String query = "";
        if (isInCart(ordered, owner)) {
            query = "update cart set quantity = quantity + " + quantity + " WHERE customerID = " + userID + " and proID = " + proID;
        } else {
            query = "insert into cart value(" + userID + " , " + proID + " , " + quantity + ")";
        }
        updateDatabase(query);

    }

}
