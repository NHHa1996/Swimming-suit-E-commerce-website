/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.shop;

import java.util.ArrayList;
import DAO.CartDAO;
import DAO.CartDAOImp;
import model.user.Customer;

/**
 *
 * @author Cuong
 */
public class Cart {

    private ArrayList<Ordered> listOrdered;
    private Customer owner;

    public Cart() {
        listOrdered = new ArrayList<Ordered>();
    }

    public Customer getOwner() {
        return owner;
    }

    public void setOwner(Customer owner) {
        this.owner = owner;
    }

    public ArrayList<Ordered> getListOrdered() {
        return listOrdered;
    }

    public void setListOrdered(ArrayList<Ordered> listOrdered) {
        this.listOrdered = listOrdered;
    }

    public void addProduct(Ordered ordered) {
        listOrdered.add(ordered);
    }

    public int getNumProduct() {
        int num = 0;
        for (int i = 0; i < listOrdered.size(); i++) {
            num += listOrdered.get(i).getQuantity();
        }
        return num;
    }

    public int getCartCost() {
        int cost = 0;
        for (int i = 0; i < listOrdered.size(); i++) {
            cost += listOrdered.get(i).getPayment();
        }
        return cost;
    }
    
    public void refresh() {
        CartDAO cartDAO = new CartDAOImp();
        listOrdered = cartDAO.getCartByUserID(owner).getListOrdered();
    }

    public void emptyCart() {
        listOrdered = new ArrayList<Ordered>();
    }

    public String toString() {
        return listOrdered + "";
    }

}
