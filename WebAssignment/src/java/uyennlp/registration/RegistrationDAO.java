/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uyennlp.registration;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import uyennlp.util.DBHelper;

/**
 *
 * @author SE140355
 */
public class RegistrationDAO implements Serializable {

    /**
     *
     * @param username
     * @param password
     * @return
     * @throws java.lang.ClassNotFoundException
     * @throws java.sql.SQLException
     */
    public boolean checkLogin(String username, String password)
            throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            //1. Open connection thì stm với rs đã đc tạo sẵn cho mình xài, k cần kt null
            conn = DBHelper.makeConnection();
            if (conn != null) {
                //2. tạo câu lệnh truy vấn sql
                String sql = "SELECT username "
                        + "FROM tblRegistration "
                        + "WHERE username = ? AND password = ?";
                //3. tạo statement
                stm = conn.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
                //4. execute stm
                rs = stm.executeQuery();

                //5. process
                if (rs.next()) {
                    return true;
                }
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return false;
    }

    private List<RegistrationDTO> studentList;

    public List<RegistrationDTO> getStudentList() {
        return studentList;
    }

    public void searchLastname(String searchValue)
            throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            //1. Open connection thì stm với rs đã đc tạo sẵn cho mình xài, k cần kt null
            conn = DBHelper.makeConnection();
            if (conn != null) {
                //2. tạo câu lệnh truy vấn sql
                String sql = "SELECT username, password, lastname, isAdmin "
                        + "FROM tblRegistration "
                        + "WHERE lastname Like ?";
                //3. tạo statement
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + searchValue + "%");
                //4. execute stm
                rs = stm.executeQuery();

                //5. process
                while (rs.next()) {
                    String username = rs.getString("username");
                    String password = rs.getString("password");
                    String lastname = rs.getString("lastname");
                    boolean role = rs.getBoolean("isAdmin");

                    RegistrationDTO dto
                            = new RegistrationDTO(username, password, lastname, role);

                    if (this.studentList == null) {
                        this.studentList = new ArrayList<RegistrationDTO>();
                    }   //end if student list is null

                    this.studentList.add(dto);
                }   //end while rs
            }   //end if con is not null

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public boolean deleteAccount(String username)
            throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;

        try {
            //1. Open connection thì stm với rs đã đc tạo sẵn cho mình xài, k cần kt null
            conn = DBHelper.makeConnection();
            if (conn != null) {
                //2. tạo câu lệnh truy vấn sql
                String sql = "DELETE FROM tblRegistration "
                        + "WHERE username = ?";
                //3. tạo statement
                stm = conn.prepareStatement(sql);
                stm.setString(1, username);
                //5. process
                int row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }   //end if con is not null

        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return false;
    }

    public boolean updateAccount(String username, String password, boolean isAdmin)
            throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;

        try {
            //1. Open connection thì stm với rs đã đc tạo sẵn cho mình xài, k cần kt null
            conn = DBHelper.makeConnection();
            if (conn != null) {
                //2. tạo câu lệnh truy vấn sql
                String sql = "UPDATE tblRegistration "
                        + "set password = ?, isAdmin = ? "
                        + "WHERE username = ?";
                //3. tạo statement
                stm = conn.prepareStatement(sql);
                stm.setString(1, password);
                stm.setBoolean(2, isAdmin);
                stm.setString(3, username);
                //5. process
                int row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }   //end if con is not null

        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return false;
    }

    public boolean createAccount(RegistrationDTO dto)
            throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;

        try {
            //1. Open connection thì stm với rs đã đc tạo sẵn cho mình xài, k cần kt null
            conn = DBHelper.makeConnection();
            if (conn != null) {
                //2. tạo câu lệnh truy vấn sql
                String sql = "INSERT INTO "
                        + "tblRegistration(username, password, lastname, isAdmin) "
                        + "VALUES(?,?,?,?)";
                //3. tạo statement
                stm = conn.prepareStatement(sql);
                stm.setString(1, dto.getUsername());
                stm.setString(2, dto.getPassword());
                stm.setString(3, dto.getLastname());
                stm.setBoolean(4, dto.isRole());
                //4.excute 
                int row = stm.executeUpdate();

                //5. process
                if (row > 0) {
                    return true;
                }
            }   //end if con is not null

        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return false;
    }

    public RegistrationDTO getLastname(String username)
            throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            //1. Open connection thì stm với rs đã đc tạo sẵn cho mình xài, k cần kt null
            conn = DBHelper.makeConnection();
            if (conn != null) {
                //2. tạo câu lệnh truy vấn sql
                String sql = "SELECT lastname "
                        + "FROM tblRegistration "
                        + "WHERE username = ?";
                //3. tạo statement
                stm = conn.prepareStatement(sql);
                stm.setString(1, username);
                rs = stm.executeQuery();
                
                RegistrationDTO dto = null;
                if (rs.next()) {
                    dto = new RegistrationDTO();
                    dto.setLastname(rs.getString("lastname"));
                    return dto;
                }

            }   //end if con is not null

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return null;
    }
}
