/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import controller.DatabaseController;
import model.MyStaticVariable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.shop.Category;
import model.shop.Product;

/**
 *
 * @author Cuong
 */
public class ProductDAOImp implements ProductDAO {

    private Category getCatelogyByID(int cateID) {
        ArrayList<Category> listCatelogy = new CategoryDAOImp().getListSubCategory();
        for (int i = 0; i < listCatelogy.size(); i++) {
            if (listCatelogy.get(i).getCateID() == cateID) {
                return listCatelogy.get(i);
            }
        }
        return null;
    }

    @Override
    public ArrayList<Product> getListProductByQuery(String query) {
        try {
            DatabaseController.createConnection();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAOImp.class.getName()).log(Level.SEVERE, null, ex);
        }
        ArrayList<Product> arr = new ArrayList<>();

        try {
            ResultSet rs = DatabaseController.executeQuery(query);
            while (rs.next()) {
                Product product = new Product();
                product.setCategory(getCatelogyByID(rs.getInt("cateID")));
                product.setImage(rs.getString("image"));
                product.setDetail(rs.getString("detail"));
                product.setPrice(rs.getInt("price"));
                product.setProID(rs.getInt("proID"));
                product.setProName(rs.getString("proName"));
                product.setDiscount(rs.getInt("discount"));
                product.setType(rs.getString("type"));
                product.setBrand(rs.getString("brand"));
                arr.add(product);
            }
            rs.close();
            DatabaseController.closeConnection();
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAOImp.class.getName()).log(Level.SEVERE, null, ex);
        }
        return arr;
    }

    @Override
    public ArrayList<Product> getFullListProduct() {
        String query = "Select * from Product";
        return getListProductByQuery(query);
    }

    @Override
    public ArrayList<Product> getListProductByCategory(int cateID) {
        String query = "Select * from Product where cateID = " + cateID + "";
        return getListProductByQuery(query);
    }

    private boolean isAllClothing(ArrayList<String> allClothing, String subCate) {
        for (int i = 0; i < allClothing.size(); i++) {
            if (subCate.equalsIgnoreCase(allClothing.get(i))) {
                return true;
            }
        }
        return false;
    }

    @Override
    public ArrayList<Product> getListProductInCategory(String subCate) {
        ArrayList<String> allClothing = MyStaticVariable.categoryDAO.getCategoryAllClothing();
        String query = "";
        if (subCate.equalsIgnoreCase("all")) {
            query = "SELECT * from product";
        } else if (isAllClothing(allClothing, subCate)) {
            query = "SELECT p.* from product p, category c where p.cateID = c.cateID and c.cateName = '" + subCate + "'";
        } else {
            query = "Select * from product where type = '" + subCate + "'";
        }
        return getListProductByQuery(query);
    }

    @Override
    public int getNumProductbyQuery(String query) {
        try {
            DatabaseController.createConnection();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAOImp.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            ResultSet rs = DatabaseController.executeQuery(query);
            while (rs.next()) {
                return rs.getInt(1);
            }
            rs.close();
            DatabaseController.closeConnection();
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAOImp.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    @Override
    public int getNumProductbyType(String type) {
        String query = "Select COUNT(p.type) from product p where p.type = '" + type + "'";
        return getNumProductbyQuery(query);
    }

    @Override
    public int getNumProductbyBrand(String brand) {
        String query = "Select COUNT(p.brand) from product p where p.brand = '" + brand + "'";
        return getNumProductbyQuery(query);
    }

    @Override
    public int getNumProductbyBrand() {
        String query = "Select COUNT(p.brand) from product p";
        return getNumProductbyQuery(query);
    }

    @Override
    public int getNumProductbyType() {
        String query = "Select COUNT(p.type) from product p";
        return getNumProductbyQuery(query);
    }

    public int getNumProductbyDiscount() {
        String query = "Select COUNT(p.discount) from product p";
        return getNumProductbyQuery(query);
    }

    public int getNumProductbyDiscount(String from, String to) {
        String query = "Select COUNT(p.discount) from product p where p.discount > " + from + " and p.discount <= " + to;
        return getNumProductbyQuery(query);
    }

    @Override
    public ArrayList<String> getListStringbyQuery(String query) {
        ArrayList<String> arr = new ArrayList<String>();
        try {
            DatabaseController.createConnection();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAOImp.class.getName()).log(Level.SEVERE, null, ex);
        }
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
    public ArrayList<String> getListProductBrand() {
        String query = "Select DISTINCT p.brand from product p";
        return getListStringbyQuery(query);
    }

    @Override
    public ArrayList<String> getListProductType() {
        String query = "Select DISTINCT p.type from product p";
        return getListStringbyQuery(query);
    }

    @Override
    public Product getProductByID(int proID) {
        Product product = new Product();
        try {
            DatabaseController.createConnection();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAOImp.class.getName()).log(Level.SEVERE, null, ex);
        }
        String query = "Select * from product where proID = '" + proID + "'";
        try {
            ResultSet rs = DatabaseController.executeQuery(query);
            while (rs.next()) {
                product.setCategory(getCatelogyByID(rs.getInt("cateID")));
                product.setImage(rs.getString("image"));
                product.setDetail(rs.getString("detail"));
                product.setPrice(rs.getInt("price"));
                product.setProID(rs.getInt("proID"));
                product.setProName(rs.getString("proName"));
                product.setDiscount(rs.getInt("discount"));
                product.setType(rs.getString("type"));
                product.setBrand(rs.getString("brand"));
            }
            rs.close();
            DatabaseController.closeConnection();
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAOImp.class.getName()).log(Level.SEVERE, null, ex);
        }
        return product;
    }

    private boolean checkSearchInput(String input, Product product) {
        return product.getProName().matches("(?i).*" + input + ".*");
    }

    @Override
    public ArrayList<Product> searchProduct(String input) {
        ArrayList<Product> fullList = getFullListProduct();
        ArrayList<Product> listSearch = new ArrayList<Product>();
        for (int i = 0; i < fullList.size(); i++) {
            if (checkSearchInput(input, fullList.get(i))) {
                listSearch.add(fullList.get(i));
            }
        }
        return listSearch;
    }

    @Override
    public int getMaxPriceOfProduct() {
        return getNumProductbyQuery("SELECT Max(price) from product");
    }

    @Override
    public int getMinPriceOfProduct() {
        return getNumProductbyQuery("SELECT Min(price) from product");
    }

    @Override
    public ArrayList<Integer> getListNumProductDiscount() {
        ArrayList<Integer> numProducts = new ArrayList();
        numProducts.add(MyStaticVariable.productDAO.getNumProductbyDiscount("90", "95"));
        numProducts.add(MyStaticVariable.productDAO.getNumProductbyDiscount("80", "90"));
        numProducts.add(MyStaticVariable.productDAO.getNumProductbyDiscount("70", "80"));
        numProducts.add(MyStaticVariable.productDAO.getNumProductbyDiscount("60", "70"));
        numProducts.add(MyStaticVariable.productDAO.getNumProductbyDiscount("50", "60"));
        numProducts.add(MyStaticVariable.productDAO.getNumProductbyDiscount("40", "50"));
        numProducts.add(MyStaticVariable.productDAO.getNumProductbyDiscount("30", "40"));
        numProducts.add(MyStaticVariable.productDAO.getNumProductbyDiscount("20", "30"));
        numProducts.add(MyStaticVariable.productDAO.getNumProductbyDiscount("5", "10"));
        numProducts.add(MyStaticVariable.productDAO.getNumProductbyDiscount("-1", "5"));
        return numProducts;
    }

    @Override
    public ArrayList<Integer> getListNumProductBrand() {
        ArrayList<Integer> numBrands = new ArrayList();
        for (int i = 0; i < MyStaticVariable.listBrand.size(); i++) {
            String brand = MyStaticVariable.listBrand.get(i);
            numBrands.add(MyStaticVariable.productDAO.getNumProductbyBrand(brand));
        }
        return numBrands;
    }
    
    @Override
    public ArrayList<Integer> getListNumProductType() {
        ArrayList<Integer> numTypes = new ArrayList();
        for (int i = 0; i < MyStaticVariable.listType.size(); i++) {
            String type = MyStaticVariable.listType.get(i);
            numTypes.add(MyStaticVariable.productDAO.getNumProductbyType(type));
        }
        return numTypes;
    }
    

}
