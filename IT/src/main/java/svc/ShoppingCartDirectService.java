package svc;

import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ProdDao;
import vo.CartInfo;

public class ShoppingCartDirectService {
	
public ArrayList<CartInfo> getCartDirect (String cart_id) throws Exception {
		
		Connection con = getConnection();
		ProdDao prodDao = ProdDao.getInstance();
		prodDao.setConnection(con);
		
		ArrayList<CartInfo> cartdirect_arr =  prodDao.Prod_cart_direct_select(cart_id);
		
		return cartdirect_arr;
	}

}
