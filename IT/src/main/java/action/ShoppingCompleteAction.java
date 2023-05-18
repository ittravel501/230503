package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ShoppingBuyService;
import svc.ShoppingCompleteService;
import vo.ActionForward;
import vo.OrderInfo;
import vo.ProdInfo;

public class ShoppingCompleteAction implements Action {
	
public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		ShoppingCompleteService prodCompleteService = new ShoppingCompleteService();
		
		OrderInfo orderinfo = new OrderInfo();
//		int prod_num = Integer.parseInt(request.getParameter("prod_num"));
//		int prod_quantity = Integer.parseInt(request.getParameter("prod_quantity"));
//		int prod_price = Integer.parseInt(request.getParameter("prod_price"));
		String prod_mem_id = request.getParameter("prod_mem_id");
		
		String mem_name = request.getParameter("mem_name");
		String mem_mobile1 = request.getParameter("mem_mobile1");
		String mem_mobile2 = request.getParameter("mem_mobile2");
		String mem_mobile3 = request.getParameter("mem_mobile3");
		String mem_addr1 = request.getParameter("mem_addr1");
		String mem_addr2 = request.getParameter("mem_addr2");
		String mem_addr3 = request.getParameter("mem_addr3");
		String mem_addr4 = request.getParameter("mem_addr4");
		String ord_ask = request.getParameter("ord_ask");
		String ord_ask_detail = request.getParameter("ord_ask_detail");
		String payway = request.getParameter("payway");
		String card_select = request.getParameter("card_select");
		String card_installment = request.getParameter("card_installment");
		
		String ord_nobankbook = request.getParameter("paymethod2");
		
//		orderinfo.setOrd_prod_num(prod_num);
//		orderinfo.setProd_quantity(prod_quantity);
		orderinfo.setOrd_mem_id(prod_mem_id);
		
		orderinfo.setOrd_name(mem_name);
		orderinfo.setOrd_mobile1(mem_mobile1);
		orderinfo.setOrd_mobile2(mem_mobile2);
		orderinfo.setOrd_mobile3(mem_mobile3);
		orderinfo.setOrd_mem_addr1(mem_addr1);
		orderinfo.setOrd_mem_addr2(mem_addr2);
		orderinfo.setOrd_mem_addr3(mem_addr3);
		orderinfo.setOrd_mem_addr4(mem_addr4);
		orderinfo.setOrd_ask(ord_ask);
		orderinfo.setOrd_ask_detail(ord_ask_detail);
		orderinfo.setOrd_payway(payway);
		orderinfo.setOrd_card_select(card_select);
		orderinfo.setOrd_cart_installment(card_installment);
//		orderinfo.setProd_price(prod_price);
		
		orderinfo.setOrd_nobankbook(ord_nobankbook);
		
		prodCompleteService.getBuySuccess(orderinfo); //메소드를 호출하였음. 
		//article에는 ShoppingMainService의 반환값이 저장되어있다.
		
		ActionForward forward = new ActionForward();
		
//		int ord_num = orderinfo.getOrd_num();

		OrderInfo article = prodCompleteService.getComplete();
//		System.out.println("mem_name action:              "+orderinfo.getOrd_name());
//		System.out.println("card_select action:              "+orderinfo.getOrd_card_select());
		 
		request.setAttribute("orderinfo_select", article);
		//저장된 article을 "article"로 다시 저장한다. 
	   	
   		forward.setPath("/shopping_complete.jsp");
   		
   		return forward;
	
		}
}
