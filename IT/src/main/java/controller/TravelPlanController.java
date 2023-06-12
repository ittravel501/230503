package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URI;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.TravelListAction;
import action.TravelMasterAction;
import action.TravelPlanAction;
import action.TravelSchMngListAction;
import action.Travel_AutocompleteAction;
import action.Travel_DeleteScheduleAction;
import action.Travel_DeleteTravelAction;
import action.Travel_InsertMemoAction;
import action.Travel_InsertScheduleAction;
import action.Travel_getTraMasterFromListAction;
import vo.ActionForward;

@WebServlet("*.bo") // bo라고 끝나면 바로 컨트롤러 타고 들어간다는 뜻
					// 컨트롤러는 진행 방향만 알려주는 부분
public class TravelPlanController extends javax.servlet.http.HttpServlet {
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;

		if (command.equals("/travelPlan.bo")) {
			System.out.println("open");
			TravelPlanAction travelPlanAction = new TravelPlanAction();
			try {
				forward = travelPlanAction.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if (command.equals("/autocomplete.bo")) {
			System.out.println("autocomplete open");
			Travel_AutocompleteAction travel_AutocompleteAction = new Travel_AutocompleteAction();
			try {
				forward = travel_AutocompleteAction.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if (command.equals("/insertTravel.bo")) {
			action = new TravelMasterAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (command.equals("/travelSchMng.bo")) {
		    action = new TravelSchMngListAction();
		    try {
		    	forward = action.execute(request, response);
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		}

		if (command.equals("/insertSchedule.bo")) {
			action = new Travel_InsertScheduleAction();
			try {
				// 액션 실행
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (command.equals("/deleteSchedule.bo")) {
			action = new Travel_DeleteScheduleAction();
			try {
				// 액션 실행
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (command.equals("/insertMemo.bo")) {
			action = new Travel_InsertMemoAction();
			try {
				// 액션 실행
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if (command.equals("/editMemo.bo")) {
			action = new Travel_InsertMemoAction();
			try {
				// 액션 실행
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if (command.equals("/selectTravelList.bo")) {
			String tra_mem_id = request.getParameter("tra_mem_id");
			request.setAttribute("tra_mem_id", tra_mem_id);
			action = new TravelListAction();
			
			try {
				// 액션 실행
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if (command.equals("/MngSchList.bo")) {
			int tra_num = Integer.parseInt(request.getParameter("tra_num")); 
			request.setAttribute("tra_num", tra_num);
			action = new Travel_getTraMasterFromListAction();
			try {
				// 액션 실행
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if (command.equals("/deleteTravel.bo")) {
			action = new Travel_DeleteTravelAction();
			try {
				// 액션 실행
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if (forward != null) { 

			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}

		}


	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

}