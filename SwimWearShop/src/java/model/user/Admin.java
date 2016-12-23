/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.user;

/**
 *
 * @author Cuong
 */
public class Admin extends User {

    public Admin() {
        this.type = "admin";
    }

    public void addProduct(int cateID,String image,String detail,int price,String proName,int discount,String type,String brand) throws Exception {
        update("insert into product(cateID,image,detail,price,proName,discount,type,brand) value(" + cateID + ",'" + image + "','" + detail + "'," + price + ",'" + proName + "'," + discount + ",'" + type + "','" + brand + "')");
    }

    public void deleteProduct(String proID) throws Exception {
        update("delete from product where proID = '" + proID + "'");
    }

    public void editProID(int proID) throws Exception {
        int newproID = proID+1;
        update("update product set proID = '" + proID + "' where proID = '" + newproID + "'");
    }

    public void addCategory() throws Exception {

    }

    public void deleteCategory(String cateID) throws Exception {
//        update("delete from product where cateID in (select from category where subCatelogy = '" + cateID + "')");
//        update("delete from category where subCatelogy = '" + cateID + "'");
        update("delete from category where cateID = '" + cateID + "'");
    }

    public void editCategory() throws Exception {

    }

    public void deleteUser(String customerID) throws Exception {
        update("delete from customer where customerID = " + customerID);
    }

//    public void deleteAllUser() throws Exception {
//        update("delete all from customer");
//    }
}
