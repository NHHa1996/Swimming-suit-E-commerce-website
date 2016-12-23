/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.util.ArrayList;
import model.user.Account;
import model.user.Admin;
import model.user.Customer;

/**
 *
 * @author Cuong
 */
public interface UserDAO {
   
    public ArrayList<Customer> getListCustomerFromDB();
    public ArrayList<Account> getListBankAccount();
        
    public Admin getAdminFromDB(String email);
    public Customer getCustomerFromDB(String email);
}
