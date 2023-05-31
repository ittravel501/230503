package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.TravelPlanDAO;
import dto.TravelDTO;


//public class Travel_LocListService {
//
//	public ArrayList<TravelDTO> selectCityList() throws Exception {
//
//		ArrayList<TravelDTO> locList = null;
//		Connection con = getConnection();
//		TravelPlanDAO travelPlanDAO = TravelPlanDAO.getInstance();
//		travelPlanDAO.setConnection(con);
//		locList = travelPlanDAO.selectLocList();
//		close(con);
//		return locList;
//
//	}
//
//}


public class Travel_LocListService {

    public ArrayList<TravelDTO> selectLocList(String tra_city) {
        ArrayList<TravelDTO> selectLocList = null;
        Connection con = null;
        try {
            con = getConnection();
            TravelPlanDAO travelPlanDAO = TravelPlanDAO.getInstance();
            travelPlanDAO.setConnection(con);
            selectLocList = travelPlanDAO.selectLocList(tra_city);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(con);
        }
        return selectLocList;
    }
}