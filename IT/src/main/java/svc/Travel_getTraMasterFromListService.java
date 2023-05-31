package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.TravelPlanDAO;
import dto.TravelDTO;

public class Travel_getTraMasterFromListService {

    public TravelDTO selectTraFromList(int tra_num) {
    	TravelDTO selectTraFromList = null;
        Connection con = null;
        try {
            con = getConnection();
            TravelPlanDAO travelPlanDAO = TravelPlanDAO.getInstance();
            travelPlanDAO.setConnection(con);
            selectTraFromList = travelPlanDAO.selectTraMasterFromList(tra_num);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(con);
        }
        return selectTraFromList;
    }
}