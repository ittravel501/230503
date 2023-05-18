package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import svc.ShoppingBuyService;
import svc.ShoppingCartDirectService;
import svc.ShoppingCartService;
import svc.ShoppingMainService;
import vo.ActionForward;
import vo.CartInfo;
import vo.OrderInfo;
import vo.ProdInfo;

public class ShoppingCartAction implements Action {
	
public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	
	ActionForward forward = new ActionForward();
	
//	HttpSession session = request.getSession();
//	String mem_id = (String)session.getAttribute("mem_id");
	String prodNumParam = request.getParameter("prod_num");
	
	HttpSession session = request.getSession();
	String mem_id = (String)session.getAttribute("mem_id");
	
	if (prodNumParam != null) {
		
		//경로: 제품상세페이지
		System.out.println("제품상세페이지 > 장바구니");
				
		String prod_name = request.getParameter("prod_name");
		String prod_mem_id = request.getParameter("prod_mem_id");
		int prod_num = Integer.parseInt(request.getParameter("prod_num"));
		int prod_price = Integer.parseInt(request.getParameter("prod_price"));
		int prod_quantity = Integer.parseInt(request.getParameter("prod_quantity"));
		
		String prod_bigct = request.getParameter("prod_bigct");
		String prod_smallct = request.getParameter("prod_smallct");
		String prod_image = request.getParameter("prod_image");
		String prod_opbct = request.getParameter("prod_opbct");
		String prod_opsct = request.getParameter("prod_opsct");
		
		CartInfo cart = new CartInfo();
		cart.setShop_bas_prod_name(prod_name);
		cart.setShop_bas_mem_id(prod_mem_id);
		cart.setShop_bas_prod_num(prod_num);
		cart.setShop_bas_prod_price(prod_price);
		cart.setShop_bas_prod_quantity(prod_quantity);
		
		cart.setShop_bas_bigct(prod_bigct);
		cart.setShop_bas_smallct(prod_smallct);
		cart.setShop_bas_image(prod_image);
		cart.setShop_bas_opbct(prod_opbct);
		cart.setShop_bas_opsct(prod_opsct);
		
		ShoppingCartService shoppingCartSvc = new ShoppingCartService();
		ArrayList<CartInfo> cartdirect_arr = shoppingCartSvc.getCart(cart); //메소드를 호출하였음.
		
		System.out.println();
		
		request.setAttribute("cartdirect_arr", cartdirect_arr);
		
		//만약에 AJAX를 사용해서 페이지에 머무르게 하고 싶다면 setRedirect 이 부분을 사용할 것
//		forward.setRedirect(false);
		
		response.sendRedirect("shopping_cart_direct.do");
//   	forward.setPath("/shopping_cart_direct.jsp");	
		
	} else if (mem_id != null) {
		
		//경로: 장바구니 direct
		System.out.println("쇼핑메인 > 장바구니 direct");
   		
//		ShoppingCartService aaa = new ShoppingCartService();
//		aaa.getCart(cartdirect_arr);
		
		ShoppingCartDirectService shoppingCartDirectSvc = new ShoppingCartDirectService();
		ArrayList<CartInfo> cartdirect_arr = shoppingCartDirectSvc.getCartDirect(mem_id); //메소드를 호출하였음.
		
		request.setAttribute("cartdirect_arr", cartdirect_arr);
		
   		forward.setPath("/shopping_cart_direct.jsp");
   		
	}
	if(prodNumParam != null) {
		return null;
	}else {
		return forward;
	}
}

}
