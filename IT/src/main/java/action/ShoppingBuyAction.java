package action;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ShoppingBuyService;
import svc.ShoppingMainService;
import svc.ShoppingProdDetailService;
import vo.ActionForward;
import vo.CartInfo;
import vo.OrderInfo;
import vo.ProdInfo;

public class ShoppingBuyAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		ActionForward forward = new ActionForward();
		
		String prod_num = request.getParameter("prod_num");
		String prod_mem_id = request.getParameter("prod_mem_id");
		
		if (prod_num != null) { //경로: 제품상세페이지
			
			// service1 실행
			System.out.println("shoppingbuy action service1실행?");
			
//			String prod_price = request.getParameter("prod_price");
//			String prod_quantity = request.getParameter("prod_quantity");
			
			ShoppingBuyService prodBuyService = new ShoppingBuyService();
			OrderInfo article =  prodBuyService.getBuy(prod_mem_id);
			request.setAttribute("order_article", article);
			forward.setPath("/shopping_buy.jsp");
			
		}else { // 경로: 장바구니
			    System.out.println("action sevice2 실행?");
			    
			    String[] shop_bas_num_str = request.getParameterValues("shop_bas_num");
			    
			    ArrayList<Integer> shop_bas_num_list = new ArrayList<>();
			    for (String numStr : shop_bas_num_str) {
			        int num = Integer.parseInt(numStr);
			        shop_bas_num_list.add(num);
			    }
//			    System.out.println("cart_num_arraylist:  " + shop_bas_num_list);
			    
			    ArrayList<Integer> prod_quantity_list = new ArrayList<>();
			    for (String quantityStr : request.getParameterValues("prod_quantity")) {
			        int quantity = Integer.parseInt(quantityStr);
			        prod_quantity_list.add(quantity);
			    }
//			    System.out.println("cart_quantity_arraylist: " + prod_quantity_list);
			    
			    ArrayList<Integer> prod_price_list = new ArrayList<>();
			    for (String priceStr : request.getParameterValues("prod_price")) {
			        int price = Integer.parseInt(priceStr);
			        prod_price_list.add(price);
			    }
//			    System.out.println("cart_prod_price_arraylist: " + prod_price_list);
			    
			    ArrayList<String> prod_name_list = new ArrayList<>();
			    for (String name : request.getParameterValues("prod_name")) {
			        prod_name_list.add(name);
			    }
//			    System.out.println("cart_prod_name_arraylist: " + prod_name_list);
			    
			    ///////////////////////////////////////////????????????????????????????????
			    ShoppingBuyService prodBuyService = new ShoppingBuyService();
			    
			    //구매 회원정보 메소드
			    OrderInfo article = prodBuyService.getBuy(prod_mem_id);
			    request.setAttribute("order_article", article);
			    
			    String mobile1 = article.getOrd_mobile1();
			    String mobile2 = article.getOrd_mobile2();
			    String mobile3 = article.getOrd_mobile3();
			    String mobile4 = article.getOrd_mobile4();
			    
			    String addr1 = article.getOrd_mem_addr1();
			    String addr2 = article.getOrd_mem_addr2();
			    String addr3 = article.getOrd_mem_addr3();
			    String addr4 = article.getOrd_mem_addr4();
			    
//			    System.out.println(mobile2);
//			    System.out.println(mobile3);
//			    System.out.println(mobile4);
//			    System.out.println(addr1);
//			    System.out.println(addr2);
//			    System.out.println(addr3);
//			    System.out.println(addr4);
			    
			    OrderInfo orderinfo = new OrderInfo();
			    orderinfo.setOrd_shop_bas_prod_num2(shop_bas_num_list);
			    orderinfo.setProd_quantity2(prod_quantity_list);
			    orderinfo.setProd_price2(prod_price_list);
			    orderinfo.setOrd_name2(prod_name_list);
			    orderinfo.setOrd_mobile1(mobile1);
			    orderinfo.setOrd_mobile2(mobile2);
			    orderinfo.setOrd_mobile3(mobile3);
			    orderinfo.setOrd_mobile4(mobile4);
			    orderinfo.setOrd_mem_addr1(addr1);
			    orderinfo.setOrd_mem_addr2(addr2);
			    orderinfo.setOrd_mem_addr3(addr3);
			    orderinfo.setOrd_mem_addr4(addr4);
			    
			    
			    //구매 상품정보 메소드
//			    ArrayList<OrderInfo> aaa = prodBuyService.getBuyCart(orderinfo);
//			    request.setAttribute("cart_to_buy", aaa);
			    
			    System.out.println("==============================");
			    System.out.println("action back");
			    
//			    for (OrderInfo info : aaa) {
//			        System.out.println("장바구니 일련번호 배열 service: " + info.getOrd_shop_bas_prod_num2());
//			    }
			    
			    forward.setPath("/shopping_buy.jsp");
			}

   		
   		return forward;
	
	}

}
