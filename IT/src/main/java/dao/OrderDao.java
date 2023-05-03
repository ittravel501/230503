package dao;

import java.io.Closeable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import javax.sql.DataSource;
import javax.websocket.OnClose;

import dto.Joininfo;
import vo.OrderInfo;

public class OrderDao {
	
	DataSource ds;
	Connection con;
	PreparedStatement pstmt = null;
	
	private static OrderDao orderDao;

	private OrderDao() {
		
	}

	public static OrderDao getInstance(){
		if(orderDao == null){
			orderDao = new OrderDao();
		}
		return orderDao;
	}

	public void setConnection(Connection con){
		this.con = con;
	}
	
	
////////////////////////////////////////////////////////////////////////////////////
	
	public void order_pay(OrderInfo orderinfo) {
		
		
		try {
			
			pstmt = con.prepareStatement( "insert into ord_info values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)" );
			
			Date currentDate = new Date();
			// 내일 날짜를 구함
			long tomorrowMillis = currentDate.getTime() + (24 * 60 * 60 * 1000);
			Date tomorrowDate = new Date(tomorrowMillis);
			// 내일 날짜를 java.sql.Date로 변환하여 orderinfo 객체에 저장
			java.sql.Date ord_date = new java.sql.Date(tomorrowDate.getTime());
			orderinfo.setOrd_date(ord_date.toString());
			
			System.out.println(ord_date);
			
		} catch (Exception e) {
			
			System.out.println("order insert 실패");
			System.out.println(e);
			e.printStackTrace();
			// TODO: handle exception
			
		} finally {
		
		}
		
	}
	
	public void order_pay_success () {
			
			
			try {
				
				pstmt = con.prepareStatement( "select * from ord_info " );
				ResultSet rs =  pstmt.executeQuery();
				
//				Date currentDate = new Date();
//				// 내일 날짜를 구함
//				long tomorrowMillis = currentDate.getTime() + (24 * 60 * 60 * 1000);
//				Date tomorrowDate = new Date(tomorrowMillis);
//				// 내일 날짜를 java.sql.Date로 변환하여 orderinfo 객체에 저장
//				java.sql.Date ord_date = new java.sql.Date(tomorrowDate.getTime());
//				orderinfo.setOrd_date(ord_date.toString());
				
//				System.out.println(ord_date);
				
				rs.getString("ord_name");
				rs.getString("");
				
			} catch (Exception e) {
				
				System.out.println("결제성공페이지 select 실패");
				System.out.println(e);
				e.printStackTrace();
				// TODO: handle exception
				
			} finally {
			
			}
			
		}
	
	
	/////////////////////////
	
	public void order_mem_info (Joininfo joininfo) {
		
		
		try {
			
			pstmt = con.prepareStatement( " select * from mem_account " );
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				String mem_id = rs.getString("mem_id");
				String mem_addr = rs.getString("mem_addr");
				String mem_mobile = rs.getString("mem_mobile");
				String mem_name = rs.getString("mem_name");
//				String mem_id = rs.getString("mem_id");
//				String mem_id = rs.getString("mem_id");
//				String mem_id = rs.getString("mem_id");
				
			}
			
			
			
			
		} catch (Exception e) {
			
			System.out.println("order meminfo select 실패");
			System.out.println(e);
			e.printStackTrace();
			// TODO: handle exception
			
		} finally {
		
		}
		
	}
	

}
