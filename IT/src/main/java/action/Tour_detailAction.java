package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.Tour_svc;
import vo.TourInfo;
import vo.ActionForward;

public class Tour_detailAction {
public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	int tour_num = Integer.parseInt(request.getParameter("tour_num"));
	
	TourInfo tourlist = new TourInfo();
	
	Tour_svc tour_svc = new Tour_svc();
	tourlist = tour_svc.selectDetail(tour_num);
	
	request.setAttribute("tourlist", tourlist);
	ActionForward forward = new ActionForward();
	forward.setPath("tour_detail.jsp");
	return forward;
	}
}
