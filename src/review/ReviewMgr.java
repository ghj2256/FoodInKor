package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

import admin.DBConnectionMgr;
import admin.RestaurantBean;
import util.Database;

public class ReviewMgr {
    private DBConnectionMgr pool = null;
    boolean result = false;
    
    public ReviewMgr() {
        try {
            pool = DBConnectionMgr.getInstance();
        } catch (Exception e) {
            System.out.println("Error !!");
        }
    }
    
    public boolean insertReview(String restaurantNo, String reviewUserID,String reviewContents,String reviewRating) {
		String SQL = "insert into review(restaurantNo, reviewUserID, reviewContents, reviewRating, reviewDate)"
                + "values(?, ?, ?, ?, now())";
		try {
			Connection conn = Database.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, restaurantNo);
			pstmt.setString(2, reviewUserID);
			pstmt.setString(3, reviewContents);
			pstmt.setString(4, reviewRating);
			int count = pstmt.executeUpdate();
			if(count == 1) result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
    
    public Vector getReviewList() throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        Vector vReview = new Vector();

        try {
            con = pool.getConnection();
            String query = "select * from review order by reviewNo desc";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
            	ReviewBean review = new ReviewBean();
            	review.setRestaurantNo(rs.getString("restaurantNo"));
            	review.setReviewUserID(rs.getString("reviewUserID"));
            	review.setReviewContents(rs.getString("reviewContents"));
            	review.setReviewRating(rs.getString("reviewRating"));
            	review.setReviewDate(rs.getString("reviewDate"));
                vReview.add(review);
            }
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
        return vReview;
    }
}
