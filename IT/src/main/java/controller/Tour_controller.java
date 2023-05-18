package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import vo.ActionForward;
import action.Tour_action;
import action.Tour_detailAction;

@WebServlet("*.co") //.bo로 들어오는 모든 request를 이 컨트롤러에서 받겠다.
public class Tour_controller extends javax.servlet.http.HttpServlet {
	protected void doProcess (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String RequestURI = request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		ActionForward forward=null;
		Action action=null;
		
		if(command.equals("/tour.co")) {
			System.out.println("open");
			Tour_action tour_action = new Tour_action();
			try {
				forward=tour_action.execute(request,response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		if(command.equals("/tour_detail.co")) {
			System.out.println("detail");
			Tour_detailAction tour_action = new Tour_detailAction();
			try {
				forward=tour_action.execute(request,response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	if(forward != null){
			
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dispatcher=
						request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
			
		}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}  	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}   
}
