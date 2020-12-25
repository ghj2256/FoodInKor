package admin;

import java.sql.*;
import java.util.Vector;

import user.User;



public class UserMgr {

    private DBConnectionMgr pool = null;

    public UserMgr() {
        try {
            pool = DBConnectionMgr.getInstance();
        } catch (Exception e) {
            System.out.println("Error !!");
        }
    }

    public boolean checkId(String id) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean checkCon = false;
        try {
            con = pool.getConnection();
            String strQuery = "select id from user where id = ?";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            checkCon = rs.next();

        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return checkCon;
    }

 /*   public Vector zipcodeRead(String area3) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Vector vecList = new Vector();
        try {
            con = pool.getConnection();
            String strQuery = "select * from zipcode where area3 like '" + area3 + "%'";
            pstmt = con.prepareStatement(strQuery);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                ZipcodeBean tempZipcode = new ZipcodeBean();
                tempZipcode.setZipcode(rs.getString("zipcode"));
                tempZipcode.setArea1(rs.getString("area1"));
                tempZipcode.setArea2(rs.getString("area2"));
                tempZipcode.setArea3(rs.getString("area3"));
                tempZipcode.setArea4(rs.getString("area4"));
                vecList.addElement(tempZipcode);
            }

        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return vecList;
    }*/

    public boolean UserInsert(User regBean) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        try {
            con = pool.getConnection();
            String strQuery = "insert into user values(?,?,?,?,?,?)";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, regBean.getUserID());
            pstmt.setString(2, regBean.getUserPassword());
            pstmt.setString(3, regBean.getUserName());
            pstmt.setString(4, regBean.getGender());
            pstmt.setString(5, regBean.getEmail());
            pstmt.setString(6, regBean.getAddress());
            int count = pstmt.executeUpdate();

            if (count == 1) {
                flag = true;
            }

        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return flag;
    }

    public User getUser(String mem_id) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        User regBean = null;

        try {
            con = pool.getConnection();
            String strQuery = "select * from user where userID=?";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, mem_id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                regBean = new User();
                regBean.setUserID(rs.getString("userID"));
                regBean.setUserPassword(rs.getString("userPassword"));
                regBean.setUserName(rs.getString("userName"));
                regBean.setGender(rs.getString("Gender"));
                regBean.setEmail(rs.getString("Email"));
                regBean.setAddress(rs.getString("Address"));
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return regBean;
    }

    public Vector getUserList() {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        Vector vecList = new Vector();

        try {
            con = pool.getConnection();
            String strQuery = "select * from user";
            stmt = con.createStatement();
            rs = stmt.executeQuery(strQuery);

            while (rs.next()) {
                User regBean = new User();
                regBean.setUserID(rs.getString("userID"));
                regBean.setUserPassword(rs.getString("userPassword"));
                regBean.setUserName(rs.getString("userName"));
                regBean.setGender(rs.getString("Gender"));
                regBean.setEmail(rs.getString("Email"));
                vecList.add(regBean);
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
        return vecList;
    }

    public boolean UserUpdate(User regBean) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        try {
            con = pool.getConnection();
            String strQuery = "update user set userPassword=?, userName=?,";
            strQuery = strQuery + " Email=?, Gender=?";
            strQuery = strQuery + " where UserID=? ";
            
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, regBean.getUserPassword());
            pstmt.setString(2, regBean.getUserName());
            pstmt.setString(3, regBean.getEmail());
            pstmt.setString(4, regBean.getGender());
            pstmt.setString(5, regBean.getUserID());
            int count = pstmt.executeUpdate();
                   
            
            if (count == 1) {
                flag = true;
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return flag;
    }

    public boolean loginCheck(String id, String passwd) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean loginCon = false;
        try {
            con = pool.getConnection();
            String strQuery = "select id, passwd from user where id = ? and passwd = ?";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, id);
            pstmt.setString(2, passwd);
            rs = pstmt.executeQuery();
            loginCon = rs.next();
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return loginCon;
    }

    public boolean adminCheck(String adminID, String adminPassword) {
    	System.out.println(adminID);
    	System.out.println(adminPassword);
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean loginCon = false;
        try {
            con = pool.getConnection();
            String strQuery = "select adminID, adminPassword from admin where adminID = ? and adminPassword = ?";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, adminID);
            pstmt.setString(2, adminPassword);
            rs = pstmt.executeQuery();
            loginCon = rs.next();
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        System.out.println(loginCon);
        return loginCon;
    }
}
