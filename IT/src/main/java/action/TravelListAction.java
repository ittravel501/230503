package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.TravelListService;
import vo.ActionForward;
import dto.TravelDTO;


public class TravelListAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ArrayList<TravelDTO> travelList = new ArrayList<TravelDTO>();

		String tra_mem_id = (String)request.getAttribute("tra_mem_id");
		TravelDTO travelDTO = new TravelDTO();
		travelDTO.setTra_mem_id(tra_mem_id);

		travelList.add(travelDTO);
		
		TravelListService travelListService = new TravelListService();
		travelList = travelListService.selectTravelList(tra_mem_id);

		
		
		request.setAttribute("travelList", travelList);
		ActionForward forward = new ActionForward();
		forward.setPath("travel_list.jsp");
		return forward;

	}

}
