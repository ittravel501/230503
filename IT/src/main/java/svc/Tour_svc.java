package svc;

import java.sql.Connection;
import java.util.ArrayList;
import dao.Tour_dao;
import vo.TourInfo;
import static db.JdbcUtil.*;


public class Tour_svc {

	public ArrayList<TourInfo> selectTourlist() throws Exception{
		
		ArrayList<TourInfo> tourlist = null;
		Connection con = getConnection();
		
		Tour_dao tour_dao = Tour_dao.getInstance();
		tour_dao.setConnection(con);
		tourlist = tour_dao.selectTourlist();
		close(con);
		return tourlist;
	}
	public TourInfo selectDetail(int tour_num) throws Exception{
		
		TourInfo tourlist = null;
		Connection con = getConnection();
		
		Tour_dao tour_dao = Tour_dao.getInstance();
		tour_dao.setConnection(con);
		tourlist = tour_dao.selectDetail();
		close(con);
		return tourlist;
	}

}
