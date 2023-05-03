package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ShoppingCartService;
import svc.ShoppingMainService;
import vo.ActionForward;
import vo.ProdInfo;

public class ShoppingCartAction implements Action {
	
public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	
		int prod_num = Integer.parseInt(request.getParameter("prod_num"));
		String prod_name = request.getParameter("prod_name");
		String prod_bigct = request.getParameter("prod_bigct");
		String prod_smallct = request.getParameter("prod_smallct");
		String prodImgPath = request.getParameter("prodImgPath");
		int prod_quantity = Integer.parseInt(request.getParameter("prod_quantity"));
		int prod_price = Integer.parseInt(request.getParameter("prod_price"));
		String prod_mem_id = request.getParameter("prod_mem_id");
		
		String prod_opbct = request.getParameter("prod_opbct");
		String prod_opsct = request.getParameter("prod_opsct");
		
		ProdInfo prod = new ProdInfo();
		prod.setProd_num(prod_num);
		prod.setProd_name(prod_name);
		prod.setProd_bigct(prod_bigct);
		prod.setProd_smallct(prod_smallct);
		prod.setProd_img(prodImgPath);
		prod.setProd_quantity(prod_quantity);
		prod.setProd_price(prod_price);
		prod.setProd_mem_id(prod_mem_id);
		
		prod.setProd_opbct(prod_opbct);
		prod.setProd_opsct(prod_opsct);
	
		ShoppingCartService shoppingCartSvc = new ShoppingCartService();
	
		shoppingCartSvc.getCart(prod); //메소드를 호출하였음. 
		//article에는 ShoppingMainService의 반환값이 저장되어있다.
		
		ActionForward forward = new ActionForward();
		
		//request.setAttribute("article", article);
		//저장된 article을 "article"로 다시 저장한다. 
	   	
   		forward.setPath("/shopping_cart.jsp");
   		
   		return forward;

	 }

}
