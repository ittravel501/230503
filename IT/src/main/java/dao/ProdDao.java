package dao;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.ProdInfo;
import dto.PROD_MD;

import javax.sql.DataSource;

import dto.PROD_MD;

public class ProdDao {
	
	//PreparedStatement pstmt;
	
	DataSource ds;
	Connection con;
	
	private static ProdDao prodDao;

	public ProdDao() {
		
	}

	public static ProdDao getInstance(){
		if(prodDao == null){
			prodDao = new ProdDao();
		}
		return prodDao;
	}

	public void setConnection(Connection con){
		this.con = con;
	}


////////////////////////////////////////////////////////////////////////////////////
	
public void prod_image_insert () {
	
}
	
	
////////////////////////////////////////////////////////////////////////////////////


public ArrayList<ProdInfo> Prod_info() { //페이지에서 각 제품을 선택하면 보여지는 상세페이지의 데이터들.

	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ProdInfo prodInfo = null;
	
	ArrayList<ProdInfo> P_list = new ArrayList<> ();
	
	try {
		
			pstmt = con.prepareStatement( "SELECT * from prod_info " );
			rs = pstmt.executeQuery();
		
			while(rs.next()) {
				
				ProdInfo p_list = new ProdInfo();
				
				p_list.setProd_num(rs.getInt("prod_num"));
				p_list.setProd_bigct(rs.getString("prod_bigct"));;
				p_list.setProd_smallct(rs.getString("prod_smallct"));
				p_list.setProd_quantity(rs.getInt("prod_quantity"));
				p_list.setProd_price(rs.getInt("prod_price"));
				p_list.setProd_total_price(rs.getInt("prod_total_price"));
				p_list.setProd_img(rs.getString("prod_img"));
				p_list.setProd_review(rs.getString("prod_review"));
				p_list.setProd_qna(rs.getString("prod_qna"));
				p_list.setProd_avg(rs.getInt("prod_avg"));
				p_list.setProd_cou(rs.getInt("prod_cou"));
				p_list.setProd_postdate(rs.getString("prod_postdate"));
				p_list.setProd_name(rs.getString("prod_name"));
				p_list.setProd_opbct(rs.getString("prod_opbct"));
				p_list.setProd_opsct(rs.getString("prod_opsct"));
				p_list.setProd_check(rs.getString("prod_check"));
				p_list.setProd_mem_id(rs.getString("prod_mem_id"));
				
				P_list.add(p_list);
			
		}
		
	}catch (Exception e) {
		System.out.println("외않되");
		System.out.println(e);
		
		// TODO: handle exception
		
	}finally {
		close(rs);
		close(pstmt);
		
	}
	return P_list;

	}




///////////////////////////////////////////////////////////////////////

	public ProdInfo Prod_detail(int prod_num) { //메인페이지에서 이미지 누르면 이미지에 맞는 상품상세페이지 나옴. 
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProdInfo p_list = new ProdInfo();
		//ProdInfo P_list = new ProdInfo ();
		
		try {
			
			pstmt = con.prepareStatement( " select * from prod_info where prod_num = ? ");
			pstmt.setInt(1, prod_num);
			
			System.out.println(pstmt);
			//System.out.println(prod_num);
				
			rs = pstmt.executeQuery(); //rs에 셀렉문 저장됨.
			
			if(rs.next()) {
				//셀렉문 결과가 많은(전체 셀렉)것은 while로, 셀력 결과가 하나인 것(단일상품, 상세페이지 등등,,)은 if를 사용한다.
				
			//	System.out.println(rs.getInt(prod_num)); 
			//	System.out.println(rs.getString("prod_bigct"));
				
				p_list.setProd_num(rs.getInt("prod_num"));	
				p_list.setProd_name(rs.getString("prod_name"));
				p_list.setProd_bigct(rs.getString("prod_bigct"));;
				p_list.setProd_smallct(rs.getString("prod_smallct"));
				p_list.setProd_price(rs.getInt("prod_price"));
				p_list.setProd_img(rs.getString("prod_img"));
				p_list.setProd_avg(rs.getInt("prod_avg"));
				p_list.setProd_cou(rs.getInt("prod_cou"));
				p_list.setProd_postdate(rs.getString("prod_postdate"));
				p_list.setProd_opbct(rs.getString("prod_opbct"));
				p_list.setProd_opsct(rs.getString("prod_opsct"));
				p_list.setProd_mem_id(rs.getString("prod_mem_id"));
				
				
				//이거는 여기에다가 두는게 맞는건가. 이건 구매자가 선택해야 나오는 건데??
				p_list.setProd_total_price(rs.getInt("prod_total_price"));
				p_list.setProd_quantity(rs.getInt("prod_quantity"));
				p_list.setProd_review(rs.getString("prod_review"));
				p_list.setProd_qna(rs.getString("prod_qna"));
				p_list.setProd_check(rs.getString("prod_check"));
				
			}
			
		}catch (Exception e) {
			System.out.println("제품상세페이지 select 실패");
			System.out.println(e);
			e.printStackTrace();
			
			// TODO: handle exception
			
		}finally {
			close(rs);
			close(pstmt);
			
		}
		return p_list;
		
	}
	
/////////////////////////////////////////////////////////////////////////////////////


	public void Prod_order_info(ProdInfo prodinfo) { //상세페이지에서 수량, 옵션 등등..을 선택하고 장바구니, 결제하기 페이지로 보낼 데이터들.
	
		PreparedStatement pstmt = null;
		
		int shop_bas_prod_num = prodinfo.getProd_num();
		String shop_bas_prod_name = prodinfo.getProd_name();
		int shop_bas_prod_quantity = prodinfo.getProd_quantity();
		int shop_bas_prod_price = prodinfo.getProd_price();
		String shop_bas_mem_id = prodinfo.getProd_mem_id();
		
		try {
		
			pstmt = con.prepareStatement("insert into shop_bas values(default,?,?,?,?)");
			//String ss = String.format("insert into shop_bas values ( %s ,'%s',%s,%s,'%s')",shop_bas_prod_num,shop_bas_prod_name
			//,shop_bas_prod_quantity,shop_bas_prod_price,shop_bas_mem_id);
			
			//pstmt.setInt(1, shop_bas_prod_num);
			pstmt.setString(1, shop_bas_prod_name);
			pstmt.setInt(2,shop_bas_prod_quantity);
			pstmt.setInt(3,shop_bas_prod_price);
			pstmt.setString(4,shop_bas_mem_id);
			
			System.out.println(pstmt+"pstmt here");
		
			//pstmt.executeUpdate(ss);
			
			int rowNum = pstmt.executeUpdate();
			
			System.out.println("들어갔?"+rowNum);
		
		if(rowNum <1) {
			
			throw new Exception("데이터를 DB에 입력할 수 없습니다");
		}
		
		}catch (Exception e) {
			
			System.out.println("insert 실패");
			System.out.println(e);
			e.printStackTrace();
			
		}finally {
			close(pstmt);	
		}
	}
	
///////////////////////////////////////////////////////////////////////
	

}