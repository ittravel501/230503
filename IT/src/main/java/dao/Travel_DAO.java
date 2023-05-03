package dao;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.sql.DataSource;

public class Travel_DAO {
	
	DataSource ds;
//	데이터베이스와의 연결을 위한 DataSource 객체
	Connection con;
	private static Travel_DAO travel_DAO;
	
	private Travel_DAO() {
	}
//	Travel_DAO의 생성자
	
	public static Travel_DAO getInstance(){
//getInstance() 메서드를 통해 싱글톤 패턴을 구현하고 있어서, 
//Travel_DAO 객체는 애플리케이션 전체에서 하나만 생성되며, 모든 코드에서 동일한 객체에 접근할 수 있습니다.
		if(travel_DAO == null){
			travel_DAO = new Travel_DAO();
		}
		return travel_DAO;
	}
	
	public void setConnection(Connection con){
		this.con = con;
	}
//	setConnection() 메서드는 데이터베이스와의 연결을 설정하기 위해 호출됩니다. 
//	이 메서드를 호출하여 데이터베이스와의 연결을 설정한 후, 다른 메서드에서는 con 멤버 변수를 사용하여
//	데이터베이스 작업을 수행합니다.
	
}

