package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.TravelPlanDAO;
import dto.TravelSchDTO;

public class Travel_EditMemoService {
	public boolean editMemo(TravelSchDTO travelSchDTO) throws Exception {

		boolean isWriteSuccess = false;

		Connection con = getConnection();
		TravelPlanDAO travelPlanDAO = TravelPlanDAO.getInstance();
		travelPlanDAO.setConnection(con);
		int insertCount = travelPlanDAO.editMemo(travelSchDTO);

		if (insertCount > 0) {
			commit(con);
			isWriteSuccess = true;
			System.out.println(isWriteSuccess);
		} else {
			rollback(con);
		}

		close(con);

		travelSchDTO.setIsWriteSuccess(isWriteSuccess);

		return isWriteSuccess;
	}
}
