package services.impl;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import config.DBConnection;
import constant.UserConstant;
import models.User;
import services.UserInterface;
import utils.MailMessage;


public class UserService implements UserInterface {
	@Override
	public String registerUser(String userName, Long mobileNo, String emailId, String address, int pinCode,
			String password) {

		User user = new User(userName, mobileNo, emailId, address, pinCode, password);

		String status = registerUser(user);

		return status;
	}
	
	@Override
	public String registerUser(User user) {

		String status = "User Registration Failed!";

		boolean isRegtd = isRegistered(user.getEmail());

		if (isRegtd) {
			status = "Email Id Already Registered!";
			return status;
		}
		Connection conn = DBConnection.provideConnection();
		PreparedStatement ps = null;
		if (conn != null) {
			System.out.println("Connected Successfully!");
		}

		try {

			ps = conn.prepareStatement("insert into " + UserConstant.TABLE_USER + " values(?,?,?,?,?,?)");

			ps.setString(1, user.getEmail());
			ps.setString(2, user.getName());
			ps.setLong(3, user.getMobile());
			ps.setString(4, user.getAddress());
			ps.setInt(5, user.getPinCode());
			ps.setString(6, user.getPassword());

			int k = ps.executeUpdate();

			if (k > 0) {
				status = "User Registered Successfully!";
				MailMessage.registrationSuccess(user.getEmail(), user.getName().split(" ")[0]);
			}

		} catch (SQLException e) {
			status = "Error: " + e.getMessage();
			e.printStackTrace();
		}

		DBConnection.closeConnection(ps);
		DBConnection.closeConnection(ps);

		return status;
	}
	
	public String updateUser(User user) {

		String status = "User Updation Failed!";
		
		Connection conn = DBConnection.provideConnection();
		PreparedStatement ps = null;
		if (conn != null) {
			System.out.println("Connected Successfully!");
		}

		try {

			ps = conn.prepareStatement("update user set name=?,mobile=?,address=?,pincode=? where email=?");

			ps.setString(1, user.getName());
			ps.setLong(2, user.getMobile());
			ps.setString(3, user.getAddress());
			ps.setInt(4, user.getPinCode());
			ps.setString(5, user.getEmail());

			int k = ps.executeUpdate();

			if (k > 0) {
				status = "Profile Updated Successfully!";
			}

		} catch (SQLException e) {
			status = "Error: " + e.getMessage();
			e.printStackTrace();
		}

		DBConnection.closeConnection(ps);
		DBConnection.closeConnection(ps);

		return status;
	}


	@Override
	public boolean isRegistered(String emailId) {
		// TODO Auto-generated method stub
		
		boolean flag = false;

		Connection con = DBConnection.provideConnection();

		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = con.prepareStatement("select * from user where email=?");

			ps.setString(1, emailId);

			rs = ps.executeQuery();

			if (rs.next())
				flag = true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		DBConnection.closeConnection(con);
		DBConnection.closeConnection(ps);
		DBConnection.closeConnection(rs);

		return flag;
	}

	@Override
	public String isValidCredential(String emailId, String password) {
		// TODO Auto-generated method stub
		String status = "Login Denied! Incorrect Username or Password";

		Connection con = DBConnection.provideConnection();

		PreparedStatement ps = null;
		ResultSet rs = null;

		try {

			ps = con.prepareStatement("select * from user where email=? and password=?");

			ps.setString(1, emailId);
			ps.setString(2, password);

			rs = ps.executeQuery();

			if (rs.next())
				status = "valid";

		} catch (SQLException e) {
			status = "Error: " + e.getMessage();
			e.printStackTrace();
		}

		DBConnection.closeConnection(con);
		DBConnection.closeConnection(ps);
		DBConnection.closeConnection(rs);
		
		return status;
	}

	@Override
	public User getUserDetails(String emailId, String password) {
		// TODO Auto-generated method stub
		User user = null;

		Connection con = DBConnection.provideConnection();

		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = con.prepareStatement("select * from user where email=? and password=?");
			ps.setString(1, emailId);
			ps.setString(2, password);
			rs = ps.executeQuery();

			if (rs.next()) {
				user = new User();
				user.setName(rs.getString("name"));
				user.setMobile(rs.getLong("mobile"));
				user.setEmail(rs.getString("email"));
				user.setAddress(rs.getString("address"));
				user.setPinCode(rs.getInt("pincode"));
				user.setPassword(rs.getString("password"));

				return user;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		DBConnection.closeConnection(con);
		DBConnection.closeConnection(ps);
		DBConnection.closeConnection(rs);

		return user;
	}
	
	
	
	public User getUserDetails(String emailId) {
		// TODO Auto-generated method stub
		User user = null;

		Connection con = DBConnection.provideConnection();

		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = con.prepareStatement("select * from user where email=?");
			ps.setString(1, emailId);
			rs = ps.executeQuery();

			if (rs.next()) {
				user = new User();
				user.setName(rs.getString("name"));
				user.setMobile(rs.getLong("mobile"));
				user.setEmail(rs.getString("email"));
				user.setAddress(rs.getString("address"));
				user.setPinCode(rs.getInt("pincode"));
				user.setPassword(rs.getString("password"));

				return user;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		DBConnection.closeConnection(con);
		DBConnection.closeConnection(ps);
		DBConnection.closeConnection(rs);

		return user;
	}

	@Override
	public String getFName(String emailId) {
		// TODO Auto-generated method stub
		
		String fname = "";

		Connection con = DBConnection.provideConnection();

		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = con.prepareStatement("select name from user where email=?");
			ps.setString(1, emailId);

			rs = ps.executeQuery();

			if (rs.next()) {
				fname = rs.getString(1);

				fname = fname.split(" ")[0];

			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return fname;
	}

	@Override
	public String getUserAddr(String userId) {
		// TODO Auto-generated method stub
		
		String userAddr = "";

		Connection con = DBConnection.provideConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = con.prepareStatement("select address from user where email=?");

			ps.setString(1, userId);

			rs = ps.executeQuery();

			if (rs.next())
				userAddr = rs.getString(1);

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return userAddr;
	}
}
