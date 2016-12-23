/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.util.ArrayList;
import model.shop.Category;
import controller.DatabaseController;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Cuong
 */
public class CategoryDAOImp implements CategoryDAO {

    private ArrayList<Category> getListCatelogyByQuery(String query) {
        try {
            DatabaseController.createConnection();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAOImp.class.getName()).log(Level.SEVERE, null, ex);
        }
        ArrayList<Category> arr = new ArrayList<Category>();

        try {
            ResultSet rs = DatabaseController.executeQuery(query);
            while (rs.next()) {
                Category catelogy = new Category();
                catelogy.setCateID(rs.getInt("cateID"));
                catelogy.setCateName(rs.getString("cateName"));
                catelogy.setDadCategory(rs.getString("dadCategory"));
                arr.add(catelogy);
            }
            rs.close();
            DatabaseController.closeConnection();
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAOImp.class.getName()).log(Level.SEVERE, null, ex);
        }
        return arr;
    }

    @Override
    public ArrayList<Category> getListDadCategory() {
        String query = "Select * from Category where dadCategory IS NULL";
        return getListCatelogyByQuery(query);
    }

    @Override
    public ArrayList<Category> getListSubCategory() {
        String query = "Select * from Category where dadCategory IS NOT NULL";
        return getListCatelogyByQuery(query);
    }

    @Override
    public ArrayList<Category> getListSubCategory(String dadCatelogy) {
        String query = "Select * from Category where dadCategory = '" + dadCatelogy + "'";
        return getListCatelogyByQuery(query);
    }

    @Override
    public ArrayList<String> getListNameCategory(String query) {
        try {
            DatabaseController.createConnection();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAOImp.class.getName()).log(Level.SEVERE, null, ex);
        }
        ArrayList<String> arr = new ArrayList<String>();
        try {
            ResultSet rs = DatabaseController.executeQuery(query);
            while (rs.next()) {
                arr.add(rs.getString(1));
            }
            rs.close();
            DatabaseController.closeConnection();
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAOImp.class.getName()).log(Level.SEVERE, null, ex);
        }
        return arr;
    }

    @Override
    public ArrayList<String> getCategoryAllClothing() {
        return getListNameCategory("Select cateName from Category where dadCategory = 'All Clothing'");
    }

    @Override
    public ArrayList<Category> getListProductCategory() {
        return getListCatelogyByQuery("Select * from Category where dadCategory = 'All Clothing' and cateName <> 'All'");
    }
    
    @Override
    public String getProductCategory(int proID) {
        return getListNameCategory("SELECT c.cateName from category c, product p WHERE c.cateID = p.cateID and p.proID =" + proID).get(0);
    }

}
