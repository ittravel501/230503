package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.Travel_getLoc_Service;
import dto.Travel_sch_mng_DTO;
import vo.ActionForward;



public class Trave_getLoc_Action implements Action {

	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
		   	
			String board_num=request.getParameter("loc_name");
			Travel_getLoc_Service travel_getLoc_Service = new Travel_getLoc_Service();
			Travel_sch_mng_DTO article = Travel_getLoc_Service.getArticle(loc_name);
			ActionForward forward = new ActionForward();
		   	request.setAttribute("article", article);
	   		forward.setPath("/qna_board_view.jsp");
	   		return forward;

		 }
	
}
