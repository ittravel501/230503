package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import javax.sql.DataSource;

import db.JdbcUtil;
import vo.OrderInfo;

public class OrderDao {
	
	DataSource ds;
	Connection con;
//	PreparedStatement pstmt = null;
	
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
		
		PreparedStatement pstmt = null;
		
		try {
				
			//ord_num 은 auto increment로 default 설정했음. 
			pstmt = con.prepareStatement( "insert into ord_info values (default ,?,?,?,?,?,?,?,?,?,?)" );
			
			Date currentDate = new Date();
			long futureMillis = currentDate.getTime() + (24 * 60 * 60 * 1000);
			Date futureDate = new Date(futureMillis);
			java.sql.Timestamp ord_date = new java.sql.Timestamp(futureDate.getTime());
			orderinfo.setOrd_date(ord_date.toString());
			
			/////////////////////////////////////////////////////////////////////////////////////////////////
			
//			int prod_num = orderinfo.getOrd_num();
//			orderinfo.getOrd_shop_bas_prod_num();
//			orderinfo.getOrd_prod_num();
//			orderinfo.getOrd_name();
//			orderinfo.getOrd_mobile1();
//			orderinfo.getOrd_mobile2();
//			orderinfo.getOrd_mobile3();
//			orderinfo.getOrd_mem_addr1();
//			orderinfo.getOrd_mem_addr2();
//			orderinfo.getOrd_mem_addr3();
//			orderinfo.getOrd_mem_addr4();
//			orderinfo.getOrd_ask();
//			orderinfo.getOrd_ask_detail();
//			orderinfo.getOrd_payway();
//			orderinfo.getOrd_card_select();
//			orderinfo.getOrd_cart_installment();
//			orderinfo.getOrd_date();
//			orderinfo.getOrd_mem_id();
//			orderinfo.getOrd_nobankbook();
			
			/////////////////////////////////////////////////////////////////////////////////////////////////
			//결제번호(default), 장바구니번호, 주문자이름, 번호, 주소, 요청사항, 요청사항 상세, 결제방법, 주문날짜, count, 상품번호, 아이디 
			
			pstmt.setInt(1, orderinfo.getOrd_num()); //장바구니 번호 
			pstmt.setString(2, orderinfo.getOrd_name()); //구매자이름
			pstmt.setString(3, orderinfo.getOrd_mobile1()+"/"+orderinfo.getOrd_mobile2()+"/"+orderinfo.getOrd_mobile3()); //전화번호
			pstmt.setString(4, orderinfo.getOrd_mem_addr1()+"/"+orderinfo.getOrd_mem_addr2()+"/"+orderinfo.getOrd_mem_addr3()+"/"+orderinfo.getOrd_mem_addr4()); //주소
			pstmt.setString(5, orderinfo.getOrd_ask()+"/"+orderinfo.getOrd_ask_detail()); //요청사항+상세
			pstmt.setString(6, orderinfo.getOrd_payway()+"/"+orderinfo.getOrd_card_select()+"/"+orderinfo.getOrd_cart_installment()+"/"+orderinfo.getOrd_nobankbook()); //결제수단
			pstmt.setString(7, orderinfo.getOrd_date()); //결제일
			pstmt.setInt(8, orderinfo.getOrd_count()); //총합
			pstmt.setInt(9, orderinfo.getOrd_prod_num()); //상품번호
			pstmt.setString(10, orderinfo.getOrd_mem_id()); //주문자 아이디
			
			/////////////////////////////////////////////////////////////////////////////////////////////////
			
			System.out.println("---------------------------");
			System.out.println("shoopnum?  "+ orderinfo.getOrd_num());
			System.out.println("prod_num?    "+orderinfo.getOrd_prod_num());
			System.out.println(orderinfo.getOrd_name());
			System.out.println(orderinfo.getOrd_mem_addr1()+"/"+orderinfo.getOrd_mem_addr2()+"/"+orderinfo.getOrd_mem_addr3()+"/"+orderinfo.getOrd_mem_addr4());
			System.out.println(orderinfo.getOrd_ask()+"/"+orderinfo.getOrd_ask_detail());
			System.out.println(orderinfo.getOrd_mobile1()+"/"+orderinfo.getOrd_mobile2()+"/"+orderinfo.getOrd_mobile3());
			System.out.println(orderinfo.getOrd_payway()+"/"+orderinfo.getOrd_card_select()+"/"+orderinfo.getOrd_cart_installment()+"/"+orderinfo.getOrd_nobankbook());
			System.out.println("set   " +ord_date);
			System.out.println("get   "+orderinfo.getOrd_date());
			System.out.println(orderinfo.getOrd_mem_id());
			System.out.println("---------------------------");
			
			int rowNum = pstmt.executeUpdate();
			
			System.out.println("들어갔?"+rowNum);
			
			if(rowNum <1) {
				
				throw new Exception("데이터를 DB에 입력할 수 없습니다");
			}
			System.out.println(rowNum+"=========rownum");
			
		} catch (Exception e) {
			
			System.out.println("order insert 실패");
			System.out.println(e);
			e.printStackTrace();
			
		} finally {
			JdbcUtil.commit(con);
			close(pstmt);
		
		}
		
	}
	
public void cart_order(OrderInfo orderinfo) {
		
		PreparedStatement pstmt = null;
		
		try {
				
			//ord_num 은 auto increment로 default 설정했음. 
			pstmt = con.prepareStatement( " insert into cart_order values (?,?) " );
			pstmt.setInt(1, 0); //장바구니 일련번호
			pstmt.setInt(2, 0); //결제 일련번호
			

			/////////////////////////////////////////////////////////////////////////////////////////////////
			
			System.out.println("---------------------------");
			System.out.println("---------------------------");
			
			int rowNum = pstmt.executeUpdate();
			
			System.out.println("들어갔?"+rowNum);
			
			if(rowNum <1) {
				
				throw new Exception("데이터를 DB에 입력할 수 없습니다");
			}
			System.out.println(rowNum+"=========rownum");
			
		} catch (Exception e) {
			
			System.out.println("cart_order insert 실패");
			System.out.println(e);
			e.printStackTrace();
			
		} finally {
			JdbcUtil.commit(con);
			close(pstmt);
		
		}
		
	}
	
//	Date currentDate = new Date();
//	// 내일 날짜를 구함
//	long tomorrowMillis = currentDate.getTime() + (24 * 60 * 60 * 1000);
//	Date tomorrowDate = new Date(tomorrowMillis);
//	// 내일 날짜를 java.sql.Date로 변환하여 orderinfo 객체에 저장
//	java.sql.Date ord_date = new java.sql.Date(tomorrowDate.getTime());
//	orderinfo.setOrd_date(ord_date.toString());
	
//	System.out.println(ord_date);
	
	/////////////////////////////////////////////////////////////////////////////////
	
	public OrderInfo order_pay_success () {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		OrderInfo orderinfo = new OrderInfo();
		
		System.out.println("ㅇㅈㅇㅈ");
//		orderinfoaa.getOrd_cart_installment();
		
		try {
//				orderinfoaa.getOrd_num();
				pstmt = con.prepareStatement( "select * from ord_info where ord_num = (select max(ord_num) from ord_info);" );
				rs =  pstmt.executeQuery();
				
				if (rs.next()) {
		            
//		            Date ordDate = rs.getDate("ord_date");// ord_date 값을 가져와서 Date 객체로 변환합니다.
//		            Calendar cal = Calendar.getInstance(); // Calendar 객체를 생성하여 Date 객체를 설정합니다.
//		            cal.setTime(ordDate);
//		            cal.add(Calendar.DAY_OF_MONTH, 1);	// 하루를 더한 다음, 다시 Date 객체로 변환합니다.
//		            Date nextDay = new Date(cal.getTimeInMillis());
		            
		            ////////////////////////////
					
//					Array  = rs.getArray("ord_shop_bas_prod_num");
//		            if (shopBasProdNumArray != null) {
//		                int[] shopBasProdNum = (int[]) shopBasProdNumArray.getArray();
//		                orderinfo.setOrd_shop_bas_prod_num(shopBasProdNum);
//		            }
		            
//					Array shopBasProdNumArray = rs.getArray("ord_shop_bas_prod_num");
//					Object[] shopBasProdNumObj = (Object[]) shopBasProdNumArray.getArray();
//					int[] shopBasProdNum = Arrays.stream(shopBasProdNumObj).mapToInt(o -> (Integer) o).toArray();
//					orderinfo.setOrd_shop_bas_prod_num(shopBasProdNum);

		            
//		            System.out.println("shopBasProdNum:           "+shopBasProdNum);
					
		            orderinfo.setOrd_num(rs.getInt("ord_num"));
					orderinfo.setOrd_shop_bas_prod_num(rs.getInt("ord_shop_bas_prod_num"));
					orderinfo.setOrd_name(rs.getString("ord_name"));
					
//					orderinfo.setOrd_mobile(rs.getString("ord_mobile"));
//					orderinfo.setOrd_mem_addr(rs.getString("ord_mem_addr"));
					
					String ord_mobile = rs.getString("ord_mobile");
					String[] ordMobileFields = ord_mobile.split("/");
					orderinfo.setOrd_mobile1(ordMobileFields[0]);
					orderinfo.setOrd_mobile2(ordMobileFields[1]);
					orderinfo.setOrd_mobile3(ordMobileFields[2]);
					
					
					String ord_mem_addr = rs.getString("ord_mem_addr");
					String[] ordAddrFields = ord_mem_addr.split("/");
					orderinfo.setOrd_mem_addr1(ordAddrFields[0]);
				    orderinfo.setOrd_mem_addr2(ordAddrFields[1]);
				    orderinfo.setOrd_mem_addr3(ordAddrFields[2]);
				    orderinfo.setOrd_mem_addr4(ordAddrFields[3]);
					
					
					orderinfo.setOrd_ask(rs.getString("ord_ask"));
					orderinfo.setOrd_payway(rs.getString("ord_payway"));
					orderinfo.setOrd_date(rs.getString("ord_date"));
					orderinfo.setOrd_num(rs.getInt("ord_count"));
					orderinfo.setOrd_num(rs.getInt("ord_num"));
					orderinfo.setOrd_num(rs.getInt("ord_prod_num"));
					orderinfo.setOrd_mem_id(rs.getString("ord_mem_id"));
					
//		            System.out.println("샵넘:            "+rs.getInt("ord_shop_bas_prod_num"));
//		            System.out.println("주소?         "+ orderinfo.getOrd_mem_addr1()+"/"+orderinfo.getOrd_mem_addr()+"/"+orderinfo.getOrd_mem_addr3()+"/"+orderinfo.getOrd_mem_addr4());
//					
////		            int ord_num = rs.getInt("ord_num");
//		            String ord_name = rs.getString("ord_name"); 
////		            String ord_mobile = rs.getString("ord_mobile"); 
//		            String ord_mem_addr1 = rs.getString("ord_mem_addr1");
//		            String ord_mem_addr2 = rs.getString("ord_mem_addr2");
//		            String ord_mem_addr3 = rs.getString("ord_mem_addr3");
//		            String ord_mem_addr4 = rs.getString("ord_mem_addr4");
//		            String ord_ask = rs.getString("ord_ask");
//		            String ord_payway = rs.getString("ord_payway");
////		            String ord_date = nextDay.toString(); // 변환된 Date 객체를 문자열로 변환합니다.
//		            String ord_count = rs.getString("ord_count");
//		            String ord_prod_num = rs.getString("ord_prod_num");
//		            String ord_mem_id = rs.getString("ord_mem_id");
//		            
//		            
//		            System.out.println(ord_date);
//		            System.out.println(ord_name);
		        }
				
				
				
			} catch (Exception e) {
				
				System.out.println("결제성공페이지 select 실패");
				System.out.println(e);
				e.printStackTrace();
				
				
			} finally {
				close(rs);
				close(pstmt);
			
			}
			return orderinfo;
			
		}
			
	/////////////////////////
	
	public OrderInfo order_mem_info (String shop_mem_id) {
		
		PreparedStatement pstmt = null;
		OrderInfo orderinfo = new OrderInfo();
		
		try {
			
			pstmt = con.prepareStatement( " select * from mem_account where mem_id = ? " );
			pstmt.setString(1, shop_mem_id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				orderinfo.setOrd_mem_id(rs.getString("mem_id"));
				orderinfo.setOrd_name(rs.getString("mem_name"));
				
				String memAddr = rs.getString("mem_addr");
				String[] memAddrFields = memAddr.split("/");
			    orderinfo.setOrd_mem_addr1(memAddrFields[0]);
			    orderinfo.setOrd_mem_addr2(memAddrFields[1]);
			    orderinfo.setOrd_mem_addr3(memAddrFields[2]);
			    orderinfo.setOrd_mem_addr4(memAddrFields[3]);
				//orderinfo.setOrd_mem_addr(rs.getString("mem_addr"));
			    
			    String memMobile = rs.getString("mem_mobile");
			    String[] memMobileFields = memMobile.split("/");
			    orderinfo.setOrd_mobile1(memMobileFields[0]);			    
				orderinfo.setOrd_mobile2(memMobileFields[1]);
				orderinfo.setOrd_mobile3(memMobileFields[2]);
				orderinfo.setOrd_mobile4(memMobileFields[3]);
				
//				orderinfo.setOrd_mem_addr(rs.getString("mem_addr"));
//				orderinfo.setOrd_name(rs.getString("mem_name"));
//				orderinfo.setOrd_name(rs.getString("mem_name"));
//				
//				String mem_id = rs.getString("mem_id");
//				String mem_addr = rs.getString("mem_addr");
//				String mem_mobile = rs.getString("mem_mobile");
//				String mem_name = rs.getString("mem_name");
//				String mem_id = rs.getString("mem_id");
//				String mem_id = rs.getString("mem_id");
//				String mem_id = rs.getString("mem_id");
				
//				System.out.println(orderinfo.getOrd_mobile1());
//				System.out.println(orderinfo.getOrd_mobile2());
//				System.out.println(orderinfo.getOrd_mobile3());
//				System.out.println(orderinfo.getOrd_mobile4());
//				System.out.println("--------------------------");
//				System.out.println(orderinfo.getOrd_mem_addr1());
//				System.out.println(orderinfo.getOrd_mem_addr2());
//				System.out.println(orderinfo.getOrd_mem_addr3());
//				System.out.println(orderinfo.getOrd_mem_addr4());
//				System.out.println("--------------------------");
				
			}
			
		} catch (Exception e) {
			
			System.out.println("order meminfo select 실패");
			System.out.println(e);
			e.printStackTrace();
			
			
		} finally {
		
		}
		return orderinfo;
		
	}
	
	//////////////////////////////////////////////
	
	public void cart_delete(int shop_bas_prod_num) {
		
		PreparedStatement pstmt = null;
		
		try {
			
			pstmt = con.prepareStatement( "delete from shop_bas where shop_bas_prod_num = ? " );
			pstmt.setInt(1, shop_bas_prod_num);

			int rowNum = pstmt.executeUpdate();
	         
	         System.out.println("장바구니 속 상품 삭제?"+rowNum);
	      
	      if(rowNum <1) {
	         
	         throw new Exception("데이터를 DB에 입력할 수 없습니다");
	      }
	      
	      	System.out.println(rowNum+"=========rownum");
			System.out.println("pstmt: "+pstmt);
			
		} catch (Exception e) {
			
			System.out.println(" cart 제품 delete 실패");
			System.out.println(e);
			e.printStackTrace();
			
		} finally {
			
			System.out.println("finally:      "+pstmt);
			 JdbcUtil.commit(con);
			 JdbcUtil.close(pstmt);
		
		} 
		
		
	}
	
///////////////////////////////////////////////////////////////////////
	
	public ArrayList<OrderInfo> cart_to_buy(OrderInfo orderinfo) {
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
		
		PreparedStatement pstmt = null;
		ArrayList<OrderInfo> order_list = new ArrayList<OrderInfo>();
		
		try {
			
			System.out.println("orderinfo insert 실행");
			System.out.println("==============================");
			ArrayList<Integer> ord_shop_bas_prod_num = orderinfo.getOrd_shop_bas_prod_num2();
//			ArrayList<String> ord_shop_bas_prod_name = orderinfo.getOrd_name2();
			
				
			for (int i = 0; i < ord_shop_bas_prod_num.size(); i++) {
//				System.out.println("장바구니 일련번호 배열 Dao : " + ord_shop_bas_prod_num);
//				System.out.println("장바구니 상품이름 배열 Dao : " + ord_shop_bas_prod_name);
		
			pstmt = con.prepareStatement( " insert into ord_info values ( default ,?,?,?,?,?,?,?,?,? ) ");
			
			pstmt.setInt(1, ord_shop_bas_prod_num.get(i)); //장바구니 일련번호
			pstmt.setString(2, orderinfo.getOrd_name() ); //구매자 이름
			pstmt.setString(3, orderinfo.getOrd_mobile2()+"/"+orderinfo.getOrd_mobile3()+"/"+orderinfo.getOrd_mobile4()); //전화번호
			pstmt.setString(4, orderinfo.getOrd_mem_addr1()+"/"+orderinfo.getOrd_mem_addr2()+"/"+orderinfo.getOrd_mem_addr3()+"/"+orderinfo.getOrd_mem_addr4()); //주소
			pstmt.setString(5, orderinfo.getOrd_ask()+"/"+orderinfo.getOrd_ask_detail()); //요청사항+상세
			pstmt.setString(6, orderinfo.getOrd_payway());  //결제수단
			
			Date currentDate = new Date();
			java.sql.Date ord_date = new java.sql.Date(currentDate.getTime());
			orderinfo.setOrd_date(ord_date.toString());
			pstmt.setString(7, orderinfo.getOrd_date()); //결제일
			
			pstmt.setInt(8, orderinfo.getOrd_prod_num()); //상품 번호
			pstmt.setString(9, orderinfo.getOrd_mem_id()); //구매자 아이디 
			
			int rowNum = pstmt.executeUpdate();
			if(rowNum <1) {
				System.out.println("데이터베이스 insert실패");
			}
			System.out.println(rowNum+"=========rownum");
			
			// OrderInfo 객체를 ArrayList에 추가
			order_list.add(orderinfo);
			
//			// 출력을 추가하여 값을 확인
//            System.out.println("=== Prepared Statement Values ===");
//            System.out.println("1: " + ord_shop_bas_prod_num.get(i));
//            System.out.println("2: " + orderinfo.getOrd_name());
//            System.out.println("3: " + orderinfo.getOrd_mobile1() + "/" + orderinfo.getOrd_mobile2() + "/" + orderinfo.getOrd_mobile3());
//            System.out.println("4: " + orderinfo.getOrd_mem_addr1() + "/" + orderinfo.getOrd_mem_addr() + "/" + orderinfo.getOrd_mem_addr3() + "/" + orderinfo.getOrd_mem_addr4());
//            System.out.println("5: " + orderinfo.getOrd_ask() + "/" + orderinfo.getOrd_ask_detail());
//            System.out.println("6: " + orderinfo.getOrd_payway());
//            System.out.println("7: " + orderinfo.getOrd_date());
//            System.out.println("8: " + orderinfo.getOrd_prod_num());
//            System.out.println("9: " + orderinfo.getOrd_mem_id());
//            System.out.println("=================================");
			}
			
		}catch (Exception e) {
			System.out.println("==============================");
			System.out.println("ord_info insert 실패");
			System.out.println(e);
			e.printStackTrace();
		
		}finally {
			System.out.println("==============================");
			System.out.println("ord_info insert 성공");
			
			JdbcUtil.commit(con);
			close(pstmt);
		}
		return order_list;

	}

//public ArrayList<CartInfo> select_cartinfo(int shop_bas_prod_num) { 
//
//	PreparedStatement pstmt = null;
//	ResultSet rs = null;
//	ArrayList<CartInfo> C_d_list = new ArrayList<CartInfo>();
//	
//	try {
//	
//		pstmt = con.prepareStatement( " select * from shop_bas where shop_bas_prod_num = ? ");
//		pstmt.setInt(1, shop_bas_prod_num);
//		rs = pstmt.executeQuery(); //rs에 셀렉문 저장됨.
//	
//	while(rs.next()) {
//	//셀렉문 결과가 많은(전체 셀렉)것은 while로, 셀력 결과가 하나인 것(단일상품, 상세페이지 등등,,)은 if를 사용한다.
//	
//		CartInfo cartinfo = new CartInfo();
//		
//		cartinfo.setShop_bas_prod_num(rs.getInt("shop_bas_prod_num"));	
//		cartinfo.setShop_bas_prod_name(rs.getString("shop_bas_prod_name"));	
//		cartinfo.setShop_bas_prod_quantity(rs.getInt("shop_bas_prod_quantity"));	
//		cartinfo.setShop_bas_prod_price(rs.getInt("shop_bas_price"));
//		cartinfo.setShop_bas_mem_id(rs.getString("shop_bas_mem_id"));	
//		
//		C_d_list.add(cartinfo);
//	
//	}
//	
//	}catch (Exception e) {
//		System.out.println("cartinfo select 실패");
//		System.out.println(e);
//		e.printStackTrace();
//	
//	
//	}finally {
//		close(rs);
//		close(pstmt);
//	
//	}
//		return C_d_list;	
//
//}
	

	
	
}
