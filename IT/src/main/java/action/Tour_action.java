package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.ActionForward;
import vo.TourInfo;
import svc.Tour_svc;

public class Tour_action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{	 

			ArrayList<TourInfo> tourlist = new ArrayList<TourInfo>();
			
			Tour_svc tour_svc = new Tour_svc();
			tourlist = tour_svc.selectTourlist();
			
			request.setAttribute("tourlist", tourlist);
			ActionForward forward = new ActionForward();
			forward.setPath("tour002.jsp");
			return forward;
	}
	
}
