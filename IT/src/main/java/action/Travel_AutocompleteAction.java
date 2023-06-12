package action; 
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONObject;
import dto.TravelSchDTO;
import svc.Travel_AutocompleteService;
import vo.ActionForward;
import vo.TravelPlanVO;

public class Travel_AutocompleteAction implements Action {
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

        // JSON 데이터 파싱하여 필요한 값 추출
        String value = null;
        String[] params = jsonString.split("=");
        if (params.length == 2 && params[0].equals("value")) {
            value = URLDecoder.decode(params[1], "UTF-8"); // URL 디코딩
        }

        if (value != null) {
            Travel_AutocompleteService travel_AutocompleteService = new Travel_AutocompleteService();
            ArrayList<TravelPlanVO> autocompleteList = travel_AutocompleteService.getCityNameList(value);

            // 응답 데이터 생성
            JSONObject jsonResponse = new JSONObject();
            jsonResponse.put("autocompleteList", autocompleteList);

            // 응답 데이터 전송
            response.setContentType("application/json;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.print(jsonResponse.toString());
            out.flush();
        } else {
            // 유효한 value 값이 아닌 경우에 대한 처리
            // ...
        }

        return forward;
    }
}