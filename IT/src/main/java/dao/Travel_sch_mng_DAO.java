package dao;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.sql.DataSource;
import dto.Travel_sch_mng_DTO;

public class Travel_sch_mng_DAO {

	DataSource ds; //DataSource 인터페이스를 구현한 객체를 저장하는 인스턴스 변수 ds 선언
	Connection con; // Connection 객체를 저장하는 인스턴스 변수 con 선언
	private static Travel_sch_mng_DAO travel_sch_mng_DAO;
		//Travel_sch_mngDAO 클래스의 인스턴스를 저장하는 변수 travel_sch_mngDAO 선언, 
		//private static으로 선언하여 외부에서 접근할 수 없고 하나의 인스턴스만 생성 가능하도록 함.
	public static Travel_sch_mng_DAO getInstance(){
		//travel_sch_mngDAO 인스턴스를 반환하는 정적 메소드 getInstance() 선언. 인스턴스가 없는 경우 생성 후 반환.
		if(travel_sch_mng_DAO == null){
			travel_sch_mng_DAO = new Travel_sch_mng_DAO();
		}
		//travel_sch_mngDAO 인스턴스가 null이면 새로운 Travel_sch_mngDAO 인스턴스 생성.
		return travel_sch_mng_DAO;
		// travel_sch_mngDAO 인스턴스 반환.
	}

	public void setConnection(Connection con){
		this.con = con;
	}
	//Connection 인스턴스를 저장하는 인스턴스 변수 con에 Connection 객체를 설정하는 메소드.
	//이 메소드는 외부에서 Connection 인스턴스를 전달해 Travel_sch_mngDAO의 인스턴스 변수에 저장하는데 사용된다.


	public Travel_sch_mng_DTO selectLoc_Info(String loc2_name){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Travel_sch_mng_DTO travel_sch_mng_DTO = null;

		try{
			pstmt = con.prepareStatement(
					"select (loc2_name, loc2_filter, loc2_name_lang, loc2_exp, loc2_addr, loc2_webp, loc2_hour"
					+ "from loc_info2 where loc2_name = ?");
			rs= pstmt.executeQuery();

			if(rs.next()){
				travel_sch_mng_DTO = new Travel_sch_mng_DTO();
				travel_sch_mng_DTO.setLoc2_name(rs.getString("log2_name"));
				travel_sch_mng_DTO.setLoc2_filter(rs.getString("log2_filter"));
				travel_sch_mng_DTO.setLoc2_name_lang(rs.getString("log2_name_lang"));
				travel_sch_mng_DTO.setLoc2_exp(rs.getString("log2_addr"));
				travel_sch_mng_DTO.setLoc2_addr(rs.getString("log2_webp"));
				travel_sch_mng_DTO.setLoc2_hour(rs.getString("log2_hour"));							
			}
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return travel_sch_mng_DTO;

	}

	

	
}


