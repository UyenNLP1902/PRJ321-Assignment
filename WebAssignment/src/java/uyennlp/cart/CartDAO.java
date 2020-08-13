/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package uyennlp.cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.naming.NamingException;
import uyennlp.util.DBHelper;

/**
 *
 * @author SE140355
 */
public class CartDAO {
    
    public boolean insert(String title, int quantity, String customer)
            throws NamingException, SQLException {
        Connection con = null;

        PreparedStatement stm = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "INSERT INTO tblCart(title, quantity, customer) "
                        + "VALUES(?,?,?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, title);
                stm.setInt(2, quantity);
                stm.setString(3, customer);
                int count = stm.executeUpdate();
                if (count > 0) {
                    return true;
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }

        }
        return false;
    }

}
