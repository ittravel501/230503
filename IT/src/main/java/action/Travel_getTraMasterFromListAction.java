package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.TravelDTO;
import dto.TravelSchDTO;
import svc.TravelSchMngListService;
import svc.Travel_LocListService;
import svc.Travel_SchDayService;
import svc.Travel_getScheduleListService;
import svc.Travel_getTraMasterFromListService;
import vo.ActionForward;


public class Travel_getTraMasterFromListAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
	//여행목록에서 선택하여 들어갈 때 왼쪽 사이드바 구성
    TravelDTO tra_cityFromList = new TravelDTO();
    int tra_num = (int) request.getAttribute("tra_num");
    System.out.println(tra_num);
	Travel_getTraMasterFromListService travel_getTraMasterFromListService = new Travel_getTraMasterFromListService();
	tra_cityFromList = travel_getTraMasterFromListService.selectTraFromList(tra_num);
	request.setAttribute("tra_cityList", tra_cityFromList);

	
	//왼쪽 사이드바 날짜, 스케줄 구성
	Travel_getScheduleListService Travel_getScheduleListService = new Travel_getScheduleListService();
	ArrayList<TravelSchDTO> travelSchDTO = new ArrayList<TravelSchDTO>();
	travelSchDTO = Travel_getScheduleListService.getScheduleList(tra_num);
	request.setAttribute("sch_dayList1", travelSchDTO);
	
	String tra_city = tra_cityFromList.getTra_city();
	
	request.setAttribute("tra_cityList", tra_cityFromList);
	
	
	
	
	//오른쪽 사이드바 추천장소 구성
    ArrayList<TravelDTO> locList = new ArrayList<TravelDTO>();
    Travel_LocListService locListService = new Travel_LocListService();
    locList = locListService.selectLocList(tra_city);
    request.setAttribute("locList", locList);
	

	
	
	ActionForward forward = new ActionForward();
	forward.setPath("/travel_sch_mng.jsp");
	return forward;

	}

}
