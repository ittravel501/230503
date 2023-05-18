package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ShoppingMainService;
import svc.ShoppingProdAllService;
import svc.ShoppingProdDetailService;
import vo.ActionForward;
import vo.ProdInfo;

public class ShoppingProdAllAction implements Action {
	
public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
	   	
		ShoppingProdAllService prodAllService = new ShoppingProdAllService();
		//클래스 ShoppingProdDetailService 객체 생성
		
		ActionForward forward = new ActionForward();
		
		String clickedLiId = request.getParameter("clickedLiId");
		
		if(clickedLiId != null) {
			
			ArrayList<ProdInfo> article = prodAllService.getProdCategory(clickedLiId);
			request.setAttribute("prod_category", article);
			
			forward.setPath("/shopping_prod_all.jsp");
			
		} else {
		
			ArrayList<ProdInfo> article = prodAllService.getProdAll();
			//클래스 ShoppingProdDetailService의 메소드 getProd에 객체 prodinfo를 보낸다. 
			//ShoppingProdDetailService의 반환값을 article로 받는다. 
			//지금 이 article에는 클릭한 상품의 일련번호의 한 레코드의 데이터가 들어있다. 
			
		//	System.out.println(article.getProd_bigct()+"액션");
			
			
			
			request.setAttribute("prod_all", article);
		   	
	   		
	   		forward.setPath("/shopping_prod_all.jsp");
   		
		}
		
		return forward;
	
//	ShoppingMainService prodMainService = new ShoppingMainService();
//	ArrayList<ProdInfo> article =  prodMainService.getMain(); //메소드를 호출하였음. 
//	//article에는 ShoppingMainService의 반환값이 저장되어있다.
//	
//	ActionForward forward = new ActionForward();
//	
//	request.setAttribute("articlemain", article);
//	//저장된 article을 "article"로 다시 저장한다. 
//   	
//		forward.setPath("/shopping_prod_all.jsp");
//		
//		return forward;
//
	 }

}
