package svc;

import static db.JdbcUtil.getConnection;

import java.io.Closeable;
import java.sql.Connection;
import java.util.ArrayList;

import dao.ProdDao;
import dto.Joininfo;
import vo.ProdInfo;

import dao.OrderDao;
import vo.CartInfo;
import vo.OrderInfo;


public class ShoppingBuyService {
	
	public OrderInfo getBuy (String shop_mem_id) throws Exception { //주문자 회원정보 셀렉
		
		Connection con = getConnection();
		OrderDao orderDao = OrderDao.getInstance();
		orderDao.setConnection(con);
		
		OrderInfo orderinfo = orderDao.order_mem_info(shop_mem_id);
		
		return orderinfo;
		
	}
	
public ArrayList<OrderInfo> getBuyCart (OrderInfo orderinfo) throws Exception { //주문자 장바구니 셀렉
		
		Connection con = getConnection();
		OrderDao orderDao = OrderDao.getInstance();
		orderDao.setConnection(con);
		
//		System.out.println("===============주소===========");
//		System.out.println(orderinfo.getOrd_mem_addr1());
//		System.out.println(orderinfo.getOrd_mem_addr2());
//		System.out.println(orderinfo.getOrd_mem_addr3());
//		System.out.println(orderinfo.getOrd_mem_addr4());
//		System.out.println("===============주소===========");
		
		ArrayList<OrderInfo> vv = orderDao.cart_to_buy(orderinfo);
		
		// vv에 저장된 값 출력
	    for (OrderInfo info : vv) {
	        System.out.println("장바구니 일련번호 배열: " + info.getOrd_shop_bas_prod_num2());
//	        System.out.println("장바구니 상품이름 배열: " + info.getOrd_name2());
	        // 추가적인 필요한 값들 출력

	        System.out.println("==============================");
	    }

		
		return vv;
	}

}
