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
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.shop.Bill;

/**
 *
 * @author Cuong
 */
public class BillDAOImp implements BillDAO {

    @Override
    public ArrayList<Bill> getListBill() {
        return null;
    }

    @Override
    public void saveBill(int customerID, int payment, String date, int proID, int quantity) {
        String query = "insert into bill(customerID,payment,date,proID,quantity) VALUES(" + customerID + "," + payment + ",'" + date + "'," + proID + "," + quantity + ")";
        updateDatabase(query);
    }

    @Override
    public ArrayList<Bill> getListTransaction(int customerID) {
        
        try {
            DatabaseController.createConnection();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAOImp.class.getName()).log(Level.SEVERE, null, ex);
        }
        ArrayList<Bill> arr = new ArrayList<Bill>();
        String query = "SELECT billID,p.proID,payment,quantity,date,proName from bill b, product p WHERE customerID = " + customerID + " and b.proID = p.proID";
        try {
            ResultSet rs = DatabaseController.executeQuery(query);
            while (rs.next()) {
                Bill bill = new Bill();
                bill.setBillID(rs.getInt("billID"));
                bill.setCustomerID(customerID);
                bill.setDate(rs.getTimestamp("date"));
                bill.setPayment(rs.getInt("payment"));
                bill.setQuantity(rs.getInt("quantity"));
                bill.setProName(rs.getString("proName"));
                bill.setProID(rs.getInt("proID"));
                arr.add(bill);
            }
            rs.close();
            DatabaseController.closeConnection();
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAOImp.class.getName()).log(Level.SEVERE, null, ex);
        }
        return arr;
    }

}
