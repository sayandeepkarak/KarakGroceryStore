/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package kgs;

import java.sql.*;

/**
 *
 * @author admin
 */


public class Crud {
    private Connection connection;
    private final String url = "jdbc:mysql://localhost:3306/sayandeepkarak";
    private Statement stmt;

    public Crud(String user, String password) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        this.connection = DriverManager.getConnection(this.url, user, password);
        this.stmt = this.connection.createStatement();
    }

    public ResultSet getData(String query) throws ClassNotFoundException, SQLException {
        return this.stmt.executeQuery(query);
    }

    public boolean dispatchOperation(String query) throws ClassNotFoundException, SQLException {
        boolean res = this.stmt.execute(query);
        return res;
    }
}
