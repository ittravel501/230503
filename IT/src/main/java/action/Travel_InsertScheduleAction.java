package action;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import dto.TravelSchDTO;
import dto.TravelDTO;
import svc.Travel_InsertScheduleService;
import svc.Travel_SchDayService;
import svc.TravelMasterService;
import svc.TravelSchMngListService;
import vo.ActionForward;
import vo.TravelSchMngVO;

public class Travel_InsertScheduleAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = null;
		TravelSchDTO travelSchDTO = new TravelSchDTO();
		HttpSession session = request.getSession();

		// AJAX 요청으로부터 전달된 JSON 데이터 읽기
		BufferedReader reader = new BufferedReader(new InputStreamReader(request.getInputStream()));
		StringBuilder jsonBuilder = new StringBuilder();
		String line;
		while ((line = reader.readLine()) != null) {
			jsonBuilder.append(line);
		}
		String jsonString = jsonBuilder.toString();

		// JSON 데이터 파싱하여 DTO 객체에 설정
		JSONObject json = new JSONObject(jsonString);
		travelSchDTO.setSch_tra_num(json.getInt("sch_tra_num"));
		travelSchDTO.setLoc2_num(json.getInt("loc2_num"));
		travelSchDTO.setLoc2_filter(json.getString("loc2_filter"));
		travelSchDTO.setSch_day(json.getString("sch_day"));
		travelSchDTO.setLoc2_name(json.getString("loc2_name"));
		travelSchDTO.setLoc2_loc(json.getString("loc2_loc"));

		Travel_InsertScheduleService insertScheduleService = new Travel_InsertScheduleService();

		boolean isWriteSuccess = insertScheduleService.insertSch(travelSchDTO);
		System.out.println("isWriteSuccess: " + isWriteSuccess);
		if (!isWriteSuccess) {

			PrintWriter out = response.getWriter();

			response.setContentType("text/html;charset=UTF-8");

			out.println("<script>");
			out.println("alert('fail')");
			out.println("history.back();");
			out.println("</script>");
		} else {
			response.setContentType("application/json;charset=UTF-8");
			PrintWriter out = response.getWriter();

			// DB 값들을 응답 데이터에 포함시킴
			JSONObject jsonResponse = new JSONObject();
			jsonResponse.put("sch_tra_num", travelSchDTO.getSch_tra_num());
			jsonResponse.put("sch_day", travelSchDTO.getSch_day());
			jsonResponse.put("loc2_filter", travelSchDTO.getLoc2_filter());
			jsonResponse.put("loc2_num", travelSchDTO.getLoc2_num());
			jsonResponse.put("loc2_name", travelSchDTO.getLoc2_name());
			jsonResponse.put("loc2_loc", travelSchDTO.getLoc2_loc());

			int sch_num = travelSchDTO.getSch_num();
			jsonResponse.put("sch_num", sch_num);

			out.print(jsonResponse.toString());
			out.flush();
//		            forward = new ActionForward();
//		            forward.setRedirect(true);
//		            forward.setPath("travelSchMng.bo");
		}

		return forward;
	}
}
//		public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		    
//			ActionForward forward = null;
//			TravelSchDTO travelSchDTO = new TravelSchDTO();
//			HttpSession session = request.getSession();
//			
////오른쪽에서 날짜, 추가하기 눌렀을 때 sch_manage에 값 추가하는 부분			
//			String Sch_tra_numString = request.getParameter("sch_tra_num");
//			int Sch_tra_numInt = Integer.parseInt(Sch_tra_numString);
//			System.out.println(Sch_tra_numInt);
//			travelSchDTO.setSch_tra_num(Sch_tra_numInt);
//			
//			String Loc_num_String = request.getParameter("loc2_num");
//			int loc2_numInt = Integer.parseInt(Loc_num_String);
//			System.out.println(loc2_numInt);
//			travelSchDTO.setLoc2_num(loc2_numInt);
//			
//			travelSchDTO.setLoc2_filter(request.getParameter("loc2_filter"));
//			travelSchDTO.setSch_day(request.getParameter("sch_day"));
//			travelSchDTO.setLoc2_name(request.getParameter("loc2_name"));
//			
//
//			String loc2_name = request.getParameter("loc2_name");
//			travelSchDTO.setLoc2_name(loc2_name);
//			System.out.println("loc2_name: " + loc2_name);
//			travelSchDTO.setLoc2_loc(request.getParameter("loc2_loc"));
//			Travel_InsertScheduleService insertScheduleService = new Travel_InsertScheduleService();
//						
//			boolean isWriteSuccess = insertScheduleService.insertSch(travelSchDTO);
//			System.out.println("isWriteSuccess: " + isWriteSuccess);
//			if (!isWriteSuccess) {
//
//				PrintWriter out = response.getWriter();
//				
//				response.setContentType("text/html;charset=UTF-8");
//				
//				out.println("<script>");
//				out.println("alert('fail')");
//				out.println("history.back();");
//				out.println("</script>");
//			} else {
//				forward = new ActionForward();
//				forward.setRedirect(true);
//				forward.setPath("travelSchMng.bo");
//			}
//
//			return forward;
//
//		}
//
//	}

//	
//
//schDTO.setLoc2_name(request.getParameter("loc2_name"));
// 
//// ...
//
//boolean isWriteSuccess = insertScheduleService.insertSch(schDTO);
//
//if (isWriteSuccess) {
//    // 데이터 저장이 성공한 경우
//    response.setContentType("application/json;charset=UTF-8");
//    PrintWriter out = response.getWriter();
//    // loc2_name 값을 응답 데이터에 포함시킴
//    out.print("{\"loc2_name\": \"" + schDTO.getLoc2_name() + "\"}");
//    out.flush();
//} else {
//    // 데이터 저장이 실패한 경우
//    response.setContentType("text/html;charset=UTF-8");
//    PrintWriter out = response.getWriter();
//    out.println("<script>");
//    out.println("alert('fail')");
//    out.println("history.back();");
//    out.println("</script>");
//}
//	
//	
//	
//	