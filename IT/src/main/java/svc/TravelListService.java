package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.TravelPlanDAO;
import dto.TravelDTO;

public class TravelListService {
	public ArrayList<TravelDTO> selectTravelList(String tra_mem_id) throws Exception {

		ArrayList<TravelDTO> travelList = null;
		Connection con = getConnection();
		TravelPlanDAO travelPlanDAO = TravelPlanDAO.getInstance();
		travelPlanDAO.setConnection(con);
		travelList = travelPlanDAO.selectTravelList(tra_mem_id);
		close(con);
		return travelList;

	}

}
