/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.shop;

/**
 *
 * @author Cuong
 */
public class Category {

    private String cateName;
    private int cateID;
    private String dadCategory;

    public String getCateName() {
        return cateName;
    }

    public void setCateName(String cateName) {
        this.cateName = cateName;
    }

    public int getCateID() {
        return cateID;
    }

    public void setCateID(int cateID) {
        this.cateID = cateID;
    }

    public String getDadCategory() {
        return dadCategory;
    }

    public void setDadCategory(String dadCategory) {
        this.dadCategory = dadCategory;
    }

    public String toString() {
        return cateName;
    }

}
