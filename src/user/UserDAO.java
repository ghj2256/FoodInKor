package user;
import java.sql.*;


public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/foodinkor?serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "dongyang";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword) {
			String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
			try {
				pstmt = conn.prepareStatement(SQL); 
				pstmt.setString(1, userID);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					if(rs.getString(1).equals(userPassword)) {
						return 1;
					}
					else
						return 0;
				}
				return -1;
			} catch (Exception e) {
				e.printStackTrace();
			}
			return -2;
	}
	
	public String userName(String userID) {
		String SQL = "SELECT userName FROM USER WHERE userID = ?";
		String name;
		try {
			pstmt = conn.prepareStatement(SQL); 
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				name = rs.getString(1);
				return name;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
