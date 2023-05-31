package svc;
import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.TravelPlanDAO;

import dto.TravelSchDTO;

public class Travel_getScheduleListService {

	public ArrayList<TravelSchDTO> getScheduleList(int tra_num) {

		ArrayList<TravelSchDTO> getScheduleList = null;
	        Connection con = null;
	        try {
	            con = getConnection();
	            TravelPlanDAO travelPlanDAO = TravelPlanDAO.getInstance();
	            travelPlanDAO.setConnection(con);
	            getScheduleList = travelPlanDAO.selectSchFromList(tra_num);
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            close(con);
	        }
	        return getScheduleList;
	    }
	}
	
	
