package action;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import dto.TravelSchDTO;
import svc.Travel_EditMemoService;
import vo.ActionForward;

public class Travel_EditMemoAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		TravelSchDTO travelSchDTO = new TravelSchDTO();
		HttpSession session = request.getSession();
		
		
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

		Travel_EditMemoService travel_EditMemoService = new Travel_EditMemoService();
		boolean isModifySuccess = travel_EditMemoService.editMemo(travelSchDTO);
		
			if(!isModifySuccess){
				PrintWriter out = response.getWriter();

				response.setContentType("text/html;charset=UTF-8");

				out.println("<script>");
				out.println("alert('fail')");
				out.println("history.back();");
				out.println("</script>");
			}
			else{
				response.setContentType("application/json;charset=UTF-8");
				PrintWriter out = response.getWriter();

				// DB 값들을 응답 데이터에 포함시킴
				JSONObject jsonResponse = new JSONObject();
				jsonResponse.put("sch_num", travelSchDTO.getSch_num());
				jsonResponse.put("sch_memo", travelSchDTO.getSch_memo());

				out.print(jsonResponse.toString());
				out.flush();
			}

		return forward;
	}
}