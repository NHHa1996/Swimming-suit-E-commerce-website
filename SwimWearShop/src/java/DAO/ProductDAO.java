/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.util.ArrayList;
import model.shop.Product;

/**
 *
 * @author Cuong
 */
public interface ProductDAO {

    ArrayList<Product> getListProductByQuery(String query);

    ArrayList<Product> getFullListProduct();

    public ArrayList<Product> getListProductByCategory(int cateID);

    public ArrayList<Product> getListProductInCategory(String subCate);

    public int getNumProductbyQuery(String query);

    public int getNumProductbyBrand();

    public int getNumProductbyType();

    public int getNumProductbyDiscount();

    public int getNumProductbyBrand(String brand);

    public int getNumProductbyType(String type);

    public int getNumProductbyDiscount(String from, String to);

    public ArrayList<String> getListStringbyQuery(String query);

    public ArrayList<String> getListProductType();

    public ArrayList<String> getListProductBrand();

    public Product getProductByID(int proID);

    public ArrayList<Product> searchProduct(String input);

    public int getMaxPriceOfProduct();

    public int getMinPriceOfProduct();

    public ArrayList<Integer> getListNumProductDiscount();

    public ArrayList<Integer> getListNumProductBrand();
    
    public ArrayList<Integer> getListNumProductType();

}
