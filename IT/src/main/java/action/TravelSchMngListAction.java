package action;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.TravelDTO;
import svc.Travel_LocListService;
import svc.Travel_SchDayService;
import svc.Travel_getTraMasterFromListService;
import svc.TravelPlanService;
import svc.TravelSchMngListService;
import vo.ActionForward;
import vo.Travel_LocInfoVO;
import vo.TravelPlanVO;
import vo.TravelSchMngVO;
import vo.ActionForward;

public class TravelSchMngListAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		

		
		
		// 왼쪽 사이드바를 구성하는 부분1 - 도시 등 정보
		TravelDTO tra_cityList = new TravelDTO();
		TravelSchMngListService travelSchMngListService = new TravelSchMngListService();
		tra_cityList = travelSchMngListService.tra_cityList();
		request.setAttribute("tra_cityList", tra_cityList);
		
		// 왼쪽 사이드바를 구성하는 부분2 - 날짜 정보
		ArrayList<TravelSchMngVO> travelSchMngVO = new ArrayList<TravelSchMngVO>();
		Travel_SchDayService schDayService = new Travel_SchDayService();

		travelSchMngVO = schDayService.schDayList();
		request.setAttribute("sch_dayList", travelSchMngVO);
				
		String tra_city = tra_cityList.getTra_city();

        ArrayList<TravelDTO> locList = new ArrayList<TravelDTO>();
        Travel_LocListService locListService = new Travel_LocListService();
        locList = locListService.selectLocList(tra_city);
        request.setAttribute("locList", locList);

        
       
		
        // 오른쪽 사이드바 구성하는 부분

		ActionForward forward = new ActionForward();
		forward.setPath("/travel_sch_mng.jsp");
		return forward;

	}
}
