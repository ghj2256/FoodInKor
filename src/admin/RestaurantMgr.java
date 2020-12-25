package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;


import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sun.glass.ui.Application;
import com.sun.xml.internal.ws.client.RequestContext;


public class RestaurantMgr {

    private DBConnectionMgr pool = null;

    public RestaurantMgr() {
        try {
            pool = DBConnectionMgr.getInstance();
        } catch (Exception e) {
            System.out.println("Error !!");
        }
    }

    public boolean insertRestaurant(HttpServletRequest req) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;
        try {
     
           String uploadDir =this.getClass().getResource("").getPath();
        	uploadDir =	   uploadDir.substring(1,uploadDir.indexOf(".metadata"))+"FoodInKorProject/WebContent/data";
            System.out.println(uploadDir);
        	MultipartRequest multi = new MultipartRequest(req, uploadDir, 5 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());

            con = pool.getConnection();
            String query = "insert into restaurant(name, address, tel, date, type, price, openhour, homepage, detail, image)"
                    + "values(?, ?, ?, now(), ?, ?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, multi.getParameter("name"));
            pstmt.setString(2, multi.getParameter("address"));
            pstmt.setString(3, multi.getParameter("tel"));
            pstmt.setString(4, multi.getParameter("type"));			
			pstmt.setString(5, multi.getParameter("price")); 
			pstmt.setString(6, multi.getParameter("openhour"));
			pstmt.setString(7, multi.getParameter("homepage")); 
			pstmt.setString(8, multi.getParameter("detail"));
			 
            if (multi.getFilesystemName("image") == null) {
                pstmt.setString(9, "ready.gif");
            } else {
                pstmt.setString(9, multi.getFilesystemName("image"));
            }
            int count = pstmt.executeUpdate();
            if (count == 1) result = true;

        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return result;
    }

    public RestaurantBean getRestaurant(String no) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        RestaurantBean restaurant = null;

        try {
            con = pool.getConnection();
            String query = "select * from restaurant where no=?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, no);
            rs = pstmt.executeQuery();

            if (rs.next()) {
            	restaurant = new RestaurantBean();
            	restaurant.setNo(rs.getInt("no"));
            	restaurant.setName(rs.getString("name"));
            	restaurant.setAddress(rs.getString("address"));
            	restaurant.setTel(rs.getString("tel"));
            	restaurant.setType(rs.getString("type"));
            	restaurant.setPrice(rs.getString("price"));
                restaurant.setOpenhour(rs.getString("openhour"));
                restaurant.setHomepage(rs.getString("homepage"));
                restaurant.setDetail(rs.getString("detail"));
                restaurant.setDate(rs.getString("date"));
                restaurant.setImage(rs.getString("image"));
            }
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return restaurant;

    }

    public boolean updateRestaurant(HttpServletRequest req) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;
        
        String uploadDir =this.getClass().getResource("").getPath();
     	uploadDir =	   uploadDir.substring(1,uploadDir.indexOf(".metadata"))+"FoodInKorProject/WebContent/data";

        try {
            con = pool.getConnection();
            MultipartRequest multi = new MultipartRequest(req, uploadDir, 5 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());

            if (multi.getFilesystemName("image") == null) {
                String query = "update restaurant set name = ?, address = ?, tel = ?, type = ?, price = ?, openhour = ?, homepage = ?, detail = ? where no = ?";
                pstmt = con.prepareStatement(query);
                pstmt.setString(1, multi.getParameter("name"));
                pstmt.setString(2, multi.getParameter("address"));
                pstmt.setString(3, multi.getParameter("tel"));
                pstmt.setString(4, multi.getParameter("type"));
                pstmt.setString(5, multi.getParameter("price"));
                pstmt.setString(6, multi.getParameter("openhour"));
                pstmt.setString(7, multi.getParameter("homepage"));
                pstmt.setString(8, multi.getParameter("detail"));
                pstmt.setString(9, multi.getParameter("no"));
                
            } else {
                String query = "update restaurant set name = ?, address = ?, tel = ?, type = ?, price = ?, openhour = ?, homepage = ?, detail = ?,image = ?  where no = ?";
                pstmt = con.prepareStatement(query);
                pstmt.setString(1, multi.getParameter("name"));
                pstmt.setString(2, multi.getParameter("address"));
                pstmt.setString(3, multi.getParameter("tel"));
                pstmt.setString(4, multi.getParameter("type"));
                pstmt.setString(5, multi.getParameter("price"));
                pstmt.setString(6, multi.getParameter("openhour"));
                pstmt.setString(7, multi.getParameter("homepage"));
                pstmt.setString(8, multi.getParameter("detail"));
                pstmt.setString(9, multi.getFilesystemName("image"));
                pstmt.setString(10, multi.getParameter("no"));
            }
            int count = pstmt.executeUpdate();
            if (count == 1) result = true;
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return result;
    }



    public Vector getRestaurantList() throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        Vector vRestaurant = new Vector();

        try {
            con = pool.getConnection();
            String query = "select * from restaurant order by no desc";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                RestaurantBean restaurant = new RestaurantBean();
                restaurant.setNo(rs.getInt("no"));
                restaurant.setName(rs.getString("name"));
                restaurant.setPrice(rs.getString("price"));
                restaurant.setDetail(rs.getString("detail"));
                restaurant.setAddress(rs.getString("address"));
                restaurant.setTel(rs.getString("tel"));
                restaurant.setType(rs.getString("type"));
                restaurant.setPrice(rs.getString("price"));
                restaurant.setOpenhour(rs.getString("openhour"));
                restaurant.setHomepage(rs.getString("homepage"));
                restaurant.setDetail(rs.getString("detail"));
                restaurant.setDate(rs.getString("date"));
                restaurant.setImage(rs.getString("image"));
                vRestaurant.add(restaurant);
            }
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
        return vRestaurant;
    }
    
    public Vector getKoreanRestaurantList() throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        Vector vRestaurant = new Vector();

        try {
            con = pool.getConnection();
            String query = "select * from restaurant where type='한식' order by no desc";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                RestaurantBean restaurant = new RestaurantBean();
                restaurant.setNo(rs.getInt("no"));
                restaurant.setName(rs.getString("name"));
                restaurant.setPrice(rs.getString("price"));
                restaurant.setDetail(rs.getString("detail"));
                restaurant.setAddress(rs.getString("address"));
                restaurant.setTel(rs.getString("tel"));
                restaurant.setType(rs.getString("type"));
                restaurant.setPrice(rs.getString("price"));
                restaurant.setOpenhour(rs.getString("openhour"));
                restaurant.setHomepage(rs.getString("homepage"));
                restaurant.setDetail(rs.getString("detail"));
                restaurant.setDate(rs.getString("date"));
                restaurant.setImage(rs.getString("image"));
                vRestaurant.add(restaurant);
            }
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
        return vRestaurant;
    }
    
    public Vector getFastRestaurantList() throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        Vector vRestaurant = new Vector();

        try {
            con = pool.getConnection();
            String query = "select * from restaurant where type='패스트푸드' order by no desc";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                RestaurantBean restaurant = new RestaurantBean();
                restaurant.setNo(rs.getInt("no"));
                restaurant.setName(rs.getString("name"));
                restaurant.setPrice(rs.getString("price"));
                restaurant.setDetail(rs.getString("detail"));
                restaurant.setAddress(rs.getString("address"));
                restaurant.setTel(rs.getString("tel"));
                restaurant.setType(rs.getString("type"));
                restaurant.setPrice(rs.getString("price"));
                restaurant.setOpenhour(rs.getString("openhour"));
                restaurant.setHomepage(rs.getString("homepage"));
                restaurant.setDetail(rs.getString("detail"));
                restaurant.setDate(rs.getString("date"));
                restaurant.setImage(rs.getString("image"));
                vRestaurant.add(restaurant);
            }
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
        return vRestaurant;
    }
    
    public Vector getChineseRestaurantList() throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        Vector vRestaurant = new Vector();

        try {
            con = pool.getConnection();
            String query = "select * from restaurant where type='중식' order by no desc";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                RestaurantBean restaurant = new RestaurantBean();
                restaurant.setNo(rs.getInt("no"));
                restaurant.setName(rs.getString("name"));
                restaurant.setPrice(rs.getString("price"));
                restaurant.setDetail(rs.getString("detail"));
                restaurant.setAddress(rs.getString("address"));
                restaurant.setTel(rs.getString("tel"));
                restaurant.setType(rs.getString("type"));
                restaurant.setPrice(rs.getString("price"));
                restaurant.setOpenhour(rs.getString("openhour"));
                restaurant.setHomepage(rs.getString("homepage"));
                restaurant.setDetail(rs.getString("detail"));
                restaurant.setDate(rs.getString("date"));
                restaurant.setImage(rs.getString("image"));
                vRestaurant.add(restaurant);
            }
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
        return vRestaurant;
    }

    public Vector getDesertRestaurantList() throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        Vector vRestaurant = new Vector();

        try {
            con = pool.getConnection();
            String query = "select * from restaurant where type='카페,디저트' order by no desc";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                RestaurantBean restaurant = new RestaurantBean();
                restaurant.setNo(rs.getInt("no"));
                restaurant.setName(rs.getString("name"));
                restaurant.setPrice(rs.getString("price"));
                restaurant.setDetail(rs.getString("detail"));
                restaurant.setAddress(rs.getString("address"));
                restaurant.setTel(rs.getString("tel"));
                restaurant.setType(rs.getString("type"));
                restaurant.setPrice(rs.getString("price"));
                restaurant.setOpenhour(rs.getString("openhour"));
                restaurant.setHomepage(rs.getString("homepage"));
                restaurant.setDetail(rs.getString("detail"));
                restaurant.setDate(rs.getString("date"));
                restaurant.setImage(rs.getString("image"));
                vRestaurant.add(restaurant);
            }
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
        return vRestaurant;
    }
    
    public Vector getSnackBarRestaurantList() throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        Vector vRestaurant = new Vector();

        try {
            con = pool.getConnection();
            String query = "select * from restaurant where type='분식' order by no desc";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                RestaurantBean restaurant = new RestaurantBean();
                restaurant.setNo(rs.getInt("no"));
                restaurant.setName(rs.getString("name"));
                restaurant.setPrice(rs.getString("price"));
                restaurant.setDetail(rs.getString("detail"));
                restaurant.setAddress(rs.getString("address"));
                restaurant.setTel(rs.getString("tel"));
                restaurant.setType(rs.getString("type"));
                restaurant.setPrice(rs.getString("price"));
                restaurant.setOpenhour(rs.getString("openhour"));
                restaurant.setHomepage(rs.getString("homepage"));
                restaurant.setDetail(rs.getString("detail"));
                restaurant.setDate(rs.getString("date"));
                restaurant.setImage(rs.getString("image"));
                vRestaurant.add(restaurant);
            }
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
        return vRestaurant;
    }

    public Vector getSushiRestaurantList() throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        Vector vRestaurant = new Vector();

        try {
            con = pool.getConnection();
            String query = "select * from restaurant where type='일식' order by no desc";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                RestaurantBean restaurant = new RestaurantBean();
                restaurant.setNo(rs.getInt("no"));
                restaurant.setName(rs.getString("name"));
                restaurant.setPrice(rs.getString("price"));
                restaurant.setDetail(rs.getString("detail"));
                restaurant.setAddress(rs.getString("address"));
                restaurant.setTel(rs.getString("tel"));
                restaurant.setType(rs.getString("type"));
                restaurant.setPrice(rs.getString("price"));
                restaurant.setOpenhour(rs.getString("openhour"));
                restaurant.setHomepage(rs.getString("homepage"));
                restaurant.setDetail(rs.getString("detail"));
                restaurant.setDate(rs.getString("date"));
                restaurant.setImage(rs.getString("image"));
                vRestaurant.add(restaurant);
            }
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
        return vRestaurant;
    }
    
    public Vector getSearchRestaurantNameList(String search) throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        Vector vRestaurant = new Vector();

        try {
            con = pool.getConnection();
            String query = "select * from restaurant where name like '%" + search +"%' order by no desc";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                RestaurantBean restaurant = new RestaurantBean();
                restaurant.setNo(rs.getInt("no"));
                restaurant.setName(rs.getString("name"));
                restaurant.setPrice(rs.getString("price"));
                restaurant.setDetail(rs.getString("detail"));
                restaurant.setAddress(rs.getString("address"));
                restaurant.setTel(rs.getString("tel"));
                restaurant.setType(rs.getString("type"));
                restaurant.setPrice(rs.getString("price"));
                restaurant.setOpenhour(rs.getString("openhour"));
                restaurant.setHomepage(rs.getString("homepage"));
                restaurant.setDetail(rs.getString("detail"));
                restaurant.setDate(rs.getString("date"));
                restaurant.setImage(rs.getString("image"));
                vRestaurant.add(restaurant);
            }
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
        return vRestaurant;
    }
    
    public Vector getSearchRestaurantLocalList(String search) throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        Vector vRestaurant = new Vector();

        try {
            con = pool.getConnection();
            String query = "select * from restaurant where address like '%" + search +"%' order by no desc";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                RestaurantBean restaurant = new RestaurantBean();
                restaurant.setNo(rs.getInt("no"));
                restaurant.setName(rs.getString("name"));
                restaurant.setPrice(rs.getString("price"));
                restaurant.setDetail(rs.getString("detail"));
                restaurant.setAddress(rs.getString("address"));
                restaurant.setTel(rs.getString("tel"));
                restaurant.setType(rs.getString("type"));
                restaurant.setPrice(rs.getString("price"));
                restaurant.setOpenhour(rs.getString("openhour"));
                restaurant.setHomepage(rs.getString("homepage"));
                restaurant.setDetail(rs.getString("detail"));
                restaurant.setDate(rs.getString("date"));
                restaurant.setImage(rs.getString("image"));
                vRestaurant.add(restaurant);
            }
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
        return vRestaurant;
    }
    
    public boolean deleteRestaurant(String no) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;

        try {
            con = pool.getConnection();
            String query = "delete from restaurant where no = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, no);
            int count = pstmt.executeUpdate();
            if (count == 1) result = true;
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        
        Connection con_review = null;
        PreparedStatement pstmt_review = null;

        try {
        	con_review = pool.getConnection();
            String query = "delete from review where restaurantNo = ?";
            pstmt_review = con_review.prepareStatement(query);
            pstmt_review.setString(1, no);
            int count = pstmt_review.executeUpdate();
            if (count == 1) result = true;
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con_review, pstmt_review);
        }
        
        return result;
    }


}