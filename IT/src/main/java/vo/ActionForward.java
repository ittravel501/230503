package vo;
//vo(value object) 서블릿이나 JSP 등에서 Action 클래스의 실행 결과로 리턴되는 정보를 저장하는 클래스입니다.

public class ActionForward {
	private boolean isRedirect=false;
	private String path=null;
	
	public boolean isRedirect(){
		return isRedirect;
	}
	
	public String getPath(){
		return path;
	}
	
	public void setRedirect(boolean b){
		isRedirect=b;
	}
	
	public void setPath(String string){
		path=string;
	}
}