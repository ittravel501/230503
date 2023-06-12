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
import svc.Travel_InsertMemoService;
import vo.ActionForward;
import vo.TravelSchMngVO;

public class Travel_InsertMemoAction implements Action {

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
		JSONObject json = new JSONObject(jsonString);
		travelSchDTO.setSch_memo(json.getString("sch_memo"));
		travelSchDTO.setSch_num(json.getInt("sch_num"));
		// JSON 데이터 파싱하여 DTO 객체에 설정

		Travel_InsertMemoService travel_InsertMemoService = new Travel_InsertMemoService();
		boolean isWriteSuccess = travel_InsertMemoService.insertMemo(travelSchDTO);
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
			jsonResponse.put("sch_num", travelSchDTO.getSch_num());
			jsonResponse.put("sch_memo", travelSchDTO.getSch_memo());

			out.print(jsonResponse.toString());
			out.flush();
//			            forward = new ActionForward();
//			            forward.setRedirect(true);
//			            forward.setPath("travelSchMng.bo");
		}

		return forward;

	}
}
