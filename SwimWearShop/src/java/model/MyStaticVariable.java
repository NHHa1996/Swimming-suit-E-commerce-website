/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import AES.AES;
import java.util.ArrayList;
import DAO.BillDAO;
import DAO.BillDAOImp;
import DAO.CartDAO;
import DAO.CartDAOImp;
import DAO.CategoryDAO;
import DAO.CategoryDAOImp;
import DAO.ProductDAO;
import DAO.ProductDAOImp;
import DAO.UserDAO;
import DAO.UserDAOImp;
import model.shop.Cart;
import model.shop.Category;
import model.shop.Product;
import model.user.Admin;
import model.user.Customer;

/**
 *
 * @author Cuong
 */
public class MyStaticVariable {

//    DAO
    public static UserDAO userDAO = new UserDAOImp();
    public static CategoryDAO categoryDAO = new CategoryDAOImp();
    public static ProductDAO productDAO = new ProductDAOImp();
    public static CartDAO cartDAO = new CartDAOImp();
    public static BillDAO billDAO = new BillDAOImp();

//    user
    public static Admin admin;
    public static Customer customer;
    
//    customer cart
    public static ArrayList<Product> listProduct;
    public static int numProduct;
    public static Cart cart;
    
//    shop item
    public static ArrayList<Category> categories = MyStaticVariable.categoryDAO.getListDadCategory();
    public static ArrayList<Product> fullproducts = MyStaticVariable.productDAO.getFullListProduct();
    public static int totalProduct = MyStaticVariable.productDAO.getNumProductbyType();
    public static ArrayList<String> listBrand = MyStaticVariable.productDAO.getListProductBrand();
    public static ArrayList<String> listType = MyStaticVariable.productDAO.getListProductType();
    public static ArrayList<Integer> numBrands = MyStaticVariable.productDAO.getListNumProductBrand();
    public static ArrayList<Integer> numTypes = MyStaticVariable.productDAO.getListNumProductType();
    public static ArrayList<Integer> numDiscounts = MyStaticVariable.productDAO.getListNumProductDiscount();

//  message
    public static boolean adminIsValid = true;
    public static String title404;
    public static String problem;
    public static String detail;
    public static String warning = "";
    public static String searchResult = "";
    public static String settingEdited = "";
    public static String productEdited = "";

// security
    public static AES aes = new AES();

// refresh page
    public static void refresh() {
        categories = MyStaticVariable.categoryDAO.getListDadCategory();
        fullproducts = MyStaticVariable.productDAO.getFullListProduct();
        totalProduct = MyStaticVariable.productDAO.getNumProductbyType();
        listBrand = MyStaticVariable.productDAO.getListProductBrand();
        listType = MyStaticVariable.productDAO.getListProductType();
        numBrands = MyStaticVariable.productDAO.getListNumProductBrand();
        numTypes = MyStaticVariable.productDAO.getListNumProductType();
        numDiscounts = MyStaticVariable.productDAO.getListNumProductDiscount();
    }
}
