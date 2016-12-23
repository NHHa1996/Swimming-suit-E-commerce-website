/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import controller.DatabaseController;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.user.Admin;
import model.user.Account;
import model.user.Customer;

/**
 *
 * @author Cuong
 */
public class UserDAOImp implements UserDAO {

    @Override
    public ArrayList<Customer> getListCustomerFromDB() {
        try {
            DatabaseController.createConnection();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAOImp.class.getName()).log(Level.SEVERE, null, ex);
        }

        String query = "Select DISTINCT* from customer c, bankaccount b where c.bankID = b.bankID";
        ArrayList<Customer> customers = new ArrayList<Customer>();
        try {
            ResultSet rs = DatabaseController.executeQuery(query);
            while (rs.next()) {
                Account b = new Account();
                b.setBankID(rs.getInt("bankID"));
                b.setBankName(rs.getString("bankName"));
                b.setBankNumber(rs.getInt("bankNumber"));
                b.setAccountBalance(rs.getInt("money"));
                Customer cus = new Customer();
                cus.setEmail(rs.getString("email"));
                cus.setPassword(rs.getString("password"));
                cus.setName(rs.getString("name"));
                cus.setUserID(rs.getInt("customerID"));
                cus.setAddress(rs.getString("address"));
                cus.setPhoneNumber(rs.getString("phonenumber"));
                cus.setBankAccount(b);
                customers.add(cus);
            }
            rs.close();
            DatabaseController.closeConnection();
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAOImp.class.getName()).log(Level.SEVERE, null, ex);
        }
        return customers;
    }

    @Override
    public Admin getAdminFromDB(String email) {
        try {
            DatabaseController.createConnection();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAOImp.class.getName()).log(Level.SEVERE, null, ex);
        }

        String query = "Select * from admin where email = '" + email + "'";
        Admin ad = new Admin();

        try {
            ResultSet rs = DatabaseController.executeQuery(query);
            while (rs.next()) {
                ad.setEmail(rs.getString("email"));
                ad.setPassword(rs.getString("password"));
                ad.setName(rs.getString("name"));
                ad.setUserID(rs.getInt("userID"));
            }
            rs.close();
            DatabaseController.closeConnection();
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAOImp.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ad;
    }

    @Override
    public Customer getCustomerFromDB(String email) {
        try {
            DatabaseController.createConnection();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAOImp.class.getName()).log(Level.SEVERE, null, ex);
        }

        String query = "Select DISTINCT* from customer c, bankaccount b where email = '" + email + "' and c.bankID = b.bankID";
        Customer cus = new Customer();

        try {
            ResultSet rs = DatabaseController.executeQuery(query);
            while (rs.next()) {
                Account b = new Account();
                b.setBankID(rs.getInt("bankID"));
                b.setBankName(rs.getString("bankName"));
                b.setBankNumber(rs.getInt("bankNumber"));
                b.setAccountBalance(rs.getInt("money"));
                cus.setEmail(rs.getString("email"));
                cus.setPassword(rs.getString("password"));
                cus.setName(rs.getString("name"));
                cus.setUserID(rs.getInt("customerID"));

                cus.setAddress(rs.getString("address"));
                cus.setPhoneNumber(rs.getString("phonenumber"));
                cus.setBankAccount(b);
            }
            rs.close();
            DatabaseController.closeConnection();
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAOImp.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cus;
    }

    @Override
    public ArrayList<Account> getListBankAccount() {
        try {
            DatabaseController.createConnection();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAOImp.class.getName()).log(Level.SEVERE, null, ex);
        }

        String query = "Select * from bankaccount";
        ArrayList<Account> accounts = new ArrayList<Account>();

        try {
            ResultSet rs = DatabaseController.executeQuery(query);
            while (rs.next()) {
                Account b = new Account();
                b.setBankID(rs.getInt("bankID"));
                b.setBankName(rs.getString("bankName"));
                b.setBankNumber(rs.getInt("bankNumber"));
                b.setAccountBalance(rs.getInt("money"));
                accounts.add(b);
            }
            rs.close();
            DatabaseController.closeConnection();
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAOImp.class.getName()).log(Level.SEVERE, null, ex);
        }
        return accounts;
    }
}
