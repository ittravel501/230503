package svc;

import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.OrderDao;
import vo.OrderInfo;
import vo.ProdInfo;

public class ShoppingCompleteService {
	
public void getBuySuccess (OrderInfo orderinfo) throws Exception {
		
		Connection con = getConnection();
		OrderDao orderDao = OrderDao.getInstance();
		orderDao.setConnection(con);
		
		orderDao.order_pay(orderinfo);	 //결제정보 insert하려면 이거 주석풀면 된다.
//		OrderInfo order_select = orderDao.order_pay_success(orderinfo);
		
		
	}

public OrderInfo getComplete () throws Exception {
	
	Connection con = getConnection();
	OrderDao orderDao = OrderDao.getInstance();
	orderDao.setConnection(con);
	
	OrderInfo order_select = orderDao.order_pay_success();
	
	return order_select;
	
}

}
