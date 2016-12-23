/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.util.ArrayList;
import model.shop.Category;

/**
 *
 * @author Cuong
 */
public interface CategoryDAO {
    
    public ArrayList<Category> getListDadCategory();
    public ArrayList<Category> getListSubCategory();
    public ArrayList<Category> getListSubCategory(String dadCatelogy);
    
    public ArrayList<String> getListNameCategory(String query);
    public ArrayList<String> getCategoryAllClothing();
    public ArrayList<Category> getListProductCategory();
    public String getProductCategory(int proID);
}
