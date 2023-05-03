package svc;

import java.sql.Connection;
import dao.Travel_sch_mng_DAO;
import dto.Travel_sch_mng_DTO;
import static db.JdbcUtil.*;

public class Travel_getLoc_Service {

	public Travel_sch_mng_DTO getLocInfo(String loc_name) throws Exception{
		
		boolean isWriteSuccess = false;
		Connection con = getConnection();
		Travel_sch_mng_DAO travel_sch_mng_DAO = Travel_sch_mng_DAO.selectLoc_Info(loc2_name);
		travel_sch_mng_DAO.setConnection(con);
		
		
		int insertCount = boardDAO.insertArticle(boardBean);
		
		if(insertCount > 0){
			commit(con);
			isWriteSuccess = true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isWriteSuccess;
		
	}

	
}
