/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.user;

import controller.DatabaseController;
import static controller.DatabaseController.updateDatabase;
import java.sql.ResultSet;

/**
 *
 * @author Cuong
 */
public abstract class User {

    protected String email;
    protected String name;
    protected String password;
    protected int userID;
    protected String type;

    public User() {
        type = null;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public boolean login(String userInput, String passwordInput) throws Exception {
        DatabaseController.createConnection();
        String query = "Select * from " + type;
        ResultSet rs = DatabaseController.executeQuery(query);
        while (rs.next()) {
            if (rs.getString("email").equals(userInput) && rs.getString("password").equals(passwordInput)) {
                return true;
            }
        }
        rs.close();
        DatabaseController.closeConnection();
        return false;
    }

    public boolean checkExistEmail(String email) throws Exception {
        DatabaseController.createConnection();
        String query = "Select * from " + type;
        ResultSet rs = DatabaseController.executeQuery(query);
        while (rs.next()) {
            if (rs.getString("email").equals(email)) {
                return true;
            }
        }
        rs.close();
        DatabaseController.closeConnection();
        return false;
    }

    protected void update(String query) {
        updateDatabase(query);
    }

    public void editInformation(String infor, String into) throws Exception {
        update("UPDATE " + type + " set " + infor + " = '" + into + "' WHERE email = '" + email + "'");
    }

}
