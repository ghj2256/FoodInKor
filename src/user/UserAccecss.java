package user;

import java.sql.*;

import util.Database;

public class UserAccecss {
	public int join(String userID, String userPassword,String userName,String Gender, String Email,String Address) {
		String SQL = "INSERT INTO USER VALUES (?,?,?,?,?,?)";
		try {
			Connection conn = Database.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setString(2, userPassword);
			pstmt.setString(3, userName);
			pstmt.setString(4, Gender);
			pstmt.setString(5, Email);
			pstmt.setString(6, Address);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
