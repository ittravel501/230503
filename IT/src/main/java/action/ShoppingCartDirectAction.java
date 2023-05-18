package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import svc.ShoppingCartDirectService;
import svc.ShoppingCartService;
import vo.ActionForward;
import vo.CartInfo;

public class ShoppingCartDirectAction implements Action {
	
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		HttpSession session = request.getSession();
		String cart_id = (String)session.getAttribute("mem_id");
//		String mem_id = request.getParameter("mem_id");
		
		//getParameter로 넘긴 mem_id값을 계속 넘겨줄 수 없으니까, session에 저장해두었던 같은 정보의 "mem_id"값을 가져온다.
		//이럴려고 session에 저장하는거임.
		//왜 이걸 생각 못했니
		
		ShoppingCartDirectService shoppingCartDirectSvc = new ShoppingCartDirectService();
		ArrayList<CartInfo> cartdirect_arr = shoppingCartDirectSvc.getCartDirect(cart_id); //메소드를 호출하였음.
		
		request.setAttribute("cartdirect_arr", cartdirect_arr);
		
		ActionForward forward = new ActionForward();
		
   		forward.setPath("/shopping_cart_direct.jsp");
   		
   		return forward;

	 }

}
