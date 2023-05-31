package svc;

import java.sql.Connection;

import dao.TravelPlanDAO;
import static db.JdbcUtil.*;

public class Travel_DeleteScheduleService {

	public boolean deleteMemo(int sch_num) throws Exception {
		boolean isDeleteSuccess = false;
		Connection con = null;
		try {
			con = getConnection();
			TravelPlanDAO travelPlanDAO = TravelPlanDAO.getInstance();
			travelPlanDAO.setConnection(con);
			int deleteCount = travelPlanDAO.deleteMemo(sch_num);

			if (deleteCount > 0) {
				commit(con);
				isDeleteSuccess = true;
			} else {
				rollback(con);
			}
		} finally {
			close(con);
		}
		return isDeleteSuccess;
	}
}