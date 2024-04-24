package services.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import config.DBConnection;
import models.Cart;
import models.Demand;
import models.Product;
import services.CartInterface;

public class CartService implements CartInterface {
	
	

	@Override
	public String addProductToCart(String userId, String prodId, int prodQty) {
		// TODO Auto-generated method stub
		
		String status = "Failed to Add into Cart";

		Connection con = DBConnection.provideConnection();

		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		ResultSet rs = null;

		try {

			ps = con.prepareStatement("select * from usercart where username=? and prodid=?");

			ps.setString(1, userId);
			ps.setString(2, prodId);

			rs = ps.executeQuery();

			if (rs.next()) {

				int cartQuantity = rs.getInt("quantity");

				Product product = new ProductService().getProductDetails(prodId);

				int availableQty = product.getProdQuantity();

				prodQty += cartQuantity;
				//
				if (availableQty < prodQty) {

					status = updateProductToCart(userId, prodId, availableQty);

					status = "Only " + availableQty + " no of " + product.getProdName()
							+ " are available in the shop! So we are adding only " + availableQty
							+ " no of that item into Your Cart" + "";

					Demand demandBean = new Demand(userId, product.getProdId(), prodQty - availableQty);

					DemandService demand = new DemandService();

					boolean flag = demand.addProduct(demandBean);

					if (flag)
						status += "<br/>Later, We Will Mail You when " + product.getProdName()
								+ " will be available into the Store!";

				} else {
					status = updateProductToCart(userId, prodId, prodQty);

				}
			}

		} catch (SQLException e) {
			status = "Error: " + e.getMessage();
			e.printStackTrace();
		}

		DBConnection.closeConnection(con);
		DBConnection.closeConnection(ps);
		DBConnection.closeConnection(rs);
		DBConnection.closeConnection(ps2);

		return status;
	}

	@Override
	public String updateProductToCart(String userId, String prodId, int prodQty) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Cart> getAllCartItems(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getCartCount(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getCartItemCount(String userId, String itemId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String removeProductFromCart(String userId, String prodId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean removeAProduct(String userId, String prodId) {
		// TODO Auto-generated method stub
		return false;
	}

	
}
