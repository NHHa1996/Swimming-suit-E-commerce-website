/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.sql.ResultSet;

/**
 *
 * @author USER
 */
public class test {

    /**
     * @param args the command line arguments
     */
    private static String forgetPassword(String email) throws Exception {
        DatabaseController.createConnection();
        String query = "select password from customer where email='" + email + "'";
        ResultSet rs = DatabaseController.executeQuery(query);
        String pass = "";
        while (rs.next()) {
            pass = rs.getString("password");
        }
        rs.close();
        DatabaseController.closeConnection();
        return pass;
    }

    public static void main(String[] args) throws Exception {
        System.out.println(forgetPassword("cuongvip1295@yahoo.com.vn"));
    }

}
