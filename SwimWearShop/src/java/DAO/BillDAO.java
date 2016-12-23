/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.util.ArrayList;
import model.shop.Bill;

/**
 *
 * @author Cuong
 */
public interface BillDAO {
    public ArrayList<Bill> getListBill();
    
    public void saveBill(int customerID, int payment, String date, int proID, int quantity);
    
    public ArrayList<Bill> getListTransaction(int customerID);
}
