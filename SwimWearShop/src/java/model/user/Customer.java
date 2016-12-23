/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.user;

import controller.DatabaseController;
import static model.MyStaticVariable.customer;
import static model.MyStaticVariable.cart;
import DAO.UserDAO;
import DAO.UserDAOImp;
import java.sql.ResultSet;
import DAO.CartDAO;
import DAO.CartDAOImp;
import DAO.ProductDAO;
import DAO.ProductDAOImp;
import java.sql.SQLException;
import model.shop.Cart;
import model.shop.Ordered;

/**
 *
 * @author Cuong
 */
public class Customer extends User {

    private Account bankAccount;
    private String address;
    private String phoneNumber;

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Account getBankAccount() {
        return bankAccount;
    }

    public void setBankAccount(Account bankAccount) {
        this.bankAccount = bankAccount;
    }

    public Customer() {
        this.type = "customer";
    }

    public void setAccountInBank() throws Exception {
        DatabaseController.createConnection();
        String query = "Select * from bankAccount";
        ResultSet rs = DatabaseController.executeQuery(query);
        while (rs.next()) {
            if (rs.getInt("bankNumber") == bankAccount.getBankNumber() && rs.getString("bankName").equalsIgnoreCase(bankAccount.getBankName())) {
                bankAccount.setBankID(rs.getInt("bankID"));
                bankAccount.setAccountBalance(rs.getInt("money"));
            }
        }
        rs.close();
        DatabaseController.closeConnection();
    }

    private boolean checkBankAccount(int bankNumber, String bankName) throws Exception {
        DatabaseController.createConnection();
        String query = "Select * from bankAccount";
        ResultSet rs = DatabaseController.executeQuery(query);
        while (rs.next()) {
            if (rs.getInt("bankNumber") == bankNumber && rs.getString("bankName").equals(bankName)) {
                return true;
            }
        }
        rs.close();
        DatabaseController.closeConnection();
        return false;
    }

//    private boolean checkExistBankAccount(int bankNumber, String bankName) throws Exception {
//        DatabaseController.createConnection();
//        String query = "Select DISTINCT* from customer c, bankaccount b where email = '" + email + "' and c.bankID = b.bankID";
//        ResultSet rs = DatabaseController.executeQuery(query);
//        while (rs.next()) {
//            if (rs.getInt("bankNumber") == bankNumber && rs.getString("bankName").equals(bankName)) {
//                return true;
//            }
//        }
//        rs.close();
//        DatabaseController.closeConnection();
//        return false;
//    }
    public void register() throws Exception {
        if (!checkBankAccount(bankAccount.getBankNumber(), bankAccount.getBankName())) {
            throw new Exception("Bank name or bank number input incorrect");
        } else if (checkExistEmail(email)) {
            throw new Exception("This email is already registered");
        } else {
            String query = "insert into customer(email,name,password,bankID,address,phonenumber) values('" + email + "','" + name + "','" + password + "'," + bankAccount.getBankID() + ",'" + address + "','" + phoneNumber + "')";
            update(query);
        }
    }

    public void addProductToCart(int proID, int quantity, Cart cart) throws Exception {
        ProductDAO productDAO = new ProductDAOImp();
        CartDAO cartDAO = new CartDAOImp();
        Ordered ordered = new Ordered(productDAO.getProductByID(proID), quantity);
        cart.addProduct(ordered);
        cartDAO.addProductToCart(ordered, this);
    }

    public void removeProductFromCart(int proID, Cart cart) throws Exception {
        update("delete from cart where customerID = " + userID + " and proID = " + proID);
        cart.refresh();
    }

    public void emptyCart(Cart cart) throws Exception {
        for (int i = 0; i < cart.getListOrdered().size(); i++) {
            update("delete from cart where customerID = " + userID + " and proID = " + cart.getListOrdered().get(i).getProduct().getProID());
        }
        cart.emptyCart();
    }

    public boolean payMoney(Cart cart) throws Exception {
        int newBalance = bankAccount.getAccountBalance() - cart.getCartCost();
        if (newBalance < 0) {
            return false;
        } else {
            update("update bankaccount set money = " + newBalance + " where bankName = '" + bankAccount.getBankName() + "' and bankNumber = " + bankAccount.getBankNumber());
            bankAccount.setAccountBalance(newBalance);
        }
        return true;
    }

    public void refresh() throws Exception {
        setAccountInBank();
    }

    public void accessSystem(String email) {
        CartDAO cartDAO = new CartDAOImp();
        UserDAO userDAO = new UserDAOImp();
        customer = userDAO.getCustomerFromDB(email);
        cart = cartDAO.getCartByUserID(customer);
    }
}
