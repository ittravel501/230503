package svc;

import static db.JdbcUtil.getConnection;

import java.io.Closeable;
import java.sql.Connection;

import dao.ProdDao;
import vo.ProdInfo;

public class ShoppingCartService {
	
	public void getCart (ProdInfo prod) throws Exception {
		
		Connection con = getConnection();
		ProdDao prodDao = ProdDao.getInstance();
		prodDao.setConnection(con);
		
		prodDao.Prod_order_info(prod);
		//db 처리하는 클래스
		//table shop_bas에 인서트하는 메소드
		//그 메소드에 제품 상세페이지에서 설정된 값들을 필요한 정보만 선택하여 insert한다.  
		
		
		
		
		
	}

}
