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
import svc.Travel_DeleteTravelService;
import dto.TravelDTO;
import vo.ActionForward;
import vo.TravelSchMngVO;

public class Travel_DeleteTravelAction implements Action {

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
		int tra_num = json.getInt("tra_num");
		travelSchDTO.setTra_num(tra_num);
		System.out.println(tra_num);
		
		Travel_DeleteTravelService travel_DeleteTravelService = new Travel_DeleteTravelService();
		boolean isDeleteSuccess = travel_DeleteTravelService.deleteTravel(tra_num);
		System.out.println(isDeleteSuccess);
		if (!isDeleteSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('엥');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		} else {
			response.setContentType("application/json;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("{\"success\": true}");
			out.flush();
		}

		return forward;
	}

}