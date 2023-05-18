package svc;

import static db.JdbcUtil.getConnection;

import java.io.Closeable;
import java.sql.Connection;
import java.util.ArrayList;

import dao.OrderDao;
import dao.ProdDao;
import vo.CartInfo;
import vo.ProdInfo;

public class ShoppingCartService {
	
	public ArrayList<CartInfo> getCart (CartInfo cart) throws Exception {
		
		Connection con = getConnection();
		ProdDao prodDao = ProdDao.getInstance();
		OrderDao orderDao = OrderDao.getInstance();
		
		prodDao.setConnection(con);
		orderDao.setConnection(con);
		
		prodDao.Prod_order_info(cart);
		
//		orderDao.order_mem_info(prod_mem_id);
		
		String mem_id = cart.getShop_bas_mem_id();
		
		ArrayList<CartInfo> cartdirect_arr =  prodDao.Prod_cart_direct_select(mem_id);
		
		return cartdirect_arr;
		
	}

}
