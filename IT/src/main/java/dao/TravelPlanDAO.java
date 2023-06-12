package dao;

import static db.JdbcUtil.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.sql.DataSource;

import org.json.JSONObject;

import dto.TravelSchDTO;
import dto.TravelDTO;
import vo.Travel_LocInfoVO;
import vo.TravelPlanVO;
import vo.TravelSchMngVO;

public class TravelPlanDAO {

	DataSource ds;
	Connection con;
	private static TravelPlanDAO travelDTODAO;

	private TravelPlanDAO() {
	}

	public static TravelPlanDAO getInstance() {
		if (travelDTODAO == null) {
			travelDTODAO = new TravelPlanDAO();
		}
		return travelDTODAO;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}

	
	//여행스케줄 추가페이지에서 불러올 도시리스트
	public ArrayList<TravelPlanVO> selectCityList() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String travelDTO_list_sql = "select city_num, city_name, city_eng, city_con, city_exp from city_info";
		ArrayList<TravelPlanVO> selectCityList = new ArrayList<TravelPlanVO>();
		TravelPlanVO travelDTO = null;

		try {
			pstmt = con.prepareStatement(travelDTO_list_sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				travelDTO = new TravelPlanVO();
				travelDTO.setCity_num(rs.getInt("city_num"));
				travelDTO.setCity_name(rs.getString("city_name"));
				travelDTO.setCity_eng(rs.getString("city_eng"));
				travelDTO.setCity_con(rs.getString("city_con"));
				travelDTO.setCity_exp(rs.getString("city_exp"));
				selectCityList.add(travelDTO);
			}

		} catch (Exception ex) {
		} finally {
			close(rs);
			close(pstmt);
		}

		return selectCityList;

	}

	
	//여행 출발일-도착일 사이 일자
	public ArrayList<String> getDates(String startDate, String endDate) {
		ArrayList<String> dates = new ArrayList<>();
		LocalDate start = LocalDate.parse(startDate);
		LocalDate end = LocalDate.parse(endDate);
		System.out.println(start);
		System.out.println(end);
		for (LocalDate date = start; date.isBefore(end.plusDays(1)); date = date.plusDays(1)) {
			dates.add(date.toString());
		}
		return dates;
	}

	//여행스케줄 추가
	public int insertTravelMaster(TravelDTO article) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int insertCount = 0;

		try {
			sql = "SELECT max(tra_num)+1 as tra_num FROM tra_master";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int num = 0;
			while (rs.next()) {
				num = rs.getInt("tra_num");
			}

			sql = "INSERT INTO tra_master"
				+ "(tra_num, tra_mem_id, tra_title, tra_dday, "
				+ "tra_aday, tra_ppl, tra_city_num, tra_city) "
				+ "SELECT ?, ?, ?, ?, ?, ?, city_num, city_name "
				+ "FROM city_info " + "WHERE city_name = ?";
			
			System.out.println("dfsdf");
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, article.getTra_mem_id());
			pstmt.setString(3, article.getTra_title());
			pstmt.setString(4, article.getTra_dday());
			pstmt.setString(5, article.getTra_aday());
			pstmt.setInt(6, article.getTra_ppl());
			pstmt.setString(7, article.getTra_city());

			insertCount = pstmt.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace(); // 오류 발생 시 콘솔에 오류 메시지 출력
		} finally {
			close(rs);
			close(pstmt);
		}

		System.out.println("Insert count: " + insertCount);

		return insertCount;

	}

	
	//여행스케줄 -> 일정관리에서 불러올 여행정보
	public TravelDTO selectTraMasterList() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String traMaster_sql = "SELECT tm.tra_num, tm.tra_city, tm.tra_dday, "
							 + 	"tm.tra_aday, tm.tra_ppl, ci.city_eng "
							 + "FROM tra_master tm " 
							 + "INNER JOIN city_info ci "
							 + "ON tm.tra_city_num = ci.city_num "
							 + "WHERE tm.tra_num = (SELECT MAX(tra_num) "
							 + "FROM tra_master)";

		TravelDTO travelDTO = null;

		try {
			pstmt = con.prepareStatement(traMaster_sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				travelDTO = new TravelDTO();
				travelDTO.setTra_num(rs.getInt("tm.Tra_num"));
				travelDTO.setTra_dday(rs.getString("tm.tra_dday"));
				travelDTO.setTra_aday(rs.getString("tm.tra_aday"));
				travelDTO.setTra_ppl(rs.getInt("tm.tra_ppl"));
				travelDTO.setTra_city(rs.getString("tm.tra_city"));
				travelDTO.setCity_eng(rs.getString("ci.city_eng"));

//				selectTraMaster.add(travelDTO);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return travelDTO;

	}
	
	
	//내 여행목록 -> 일정관리에서 불러올 여행정보
	public TravelDTO selectTraMasterFromList(int tra_num) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String traMaster_sql = "SELECT tm.tra_num, tm.tra_city, tm.tra_dday, "
							+  "tm.tra_aday, tm.tra_ppl, ci.city_eng "
				+ "		FROM tra_master tm\r\n" + "		INNER JOIN city_info ci ON tm.tra_city_num = ci.city_num\r\n"
				+ "WHERE tm.tra_num = ?";
//		ArrayList<TravelDTO> selectTraMaster = new ArrayList<TravelDTO>();
		TravelDTO travelDTO = null;

		try {
			pstmt = con.prepareStatement(traMaster_sql);
			pstmt.setInt(1, tra_num);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				travelDTO = new TravelDTO();
				travelDTO.setTra_num(rs.getInt("tm.tra_num"));
				travelDTO.setTra_dday(rs.getString("tm.tra_dday"));
				travelDTO.setTra_aday(rs.getString("tm.tra_aday"));
				travelDTO.setTra_ppl(rs.getInt("tm.tra_ppl"));
				travelDTO.setTra_city(rs.getString("tm.tra_city"));
				travelDTO.setCity_eng(rs.getString("ci.city_eng"));

//				selectTraMaster.add(travelDTO);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return travelDTO;

	}
	
	//내 여행 목록 -> 일정관리에 불러올 일정/메모
	public ArrayList<TravelSchDTO> selectSchFromList(int tra_num) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

	    String traMaster_sql = "SELECT sm.sch_num, sm.sch_tra_num, "
	    					 + "sm.sch_day, sm.sch_filter, "
	    					 + "sm.sch_pla, sm.sch_memo, li2.loc2_loc "
	    					 + "FROM sch_manage sm INNER JOIN tra_master tm "
	    					 + "ON tm.tra_num = sm.sch_tra_num "
	    					 + "INNER JOIN loc_info2 li2 ON sm.sch_loc_num = li2.loc2_num "
	    					 + "WHERE tm.tra_num =  ?";

		ArrayList<TravelSchDTO> selectSchFromList = new ArrayList<TravelSchDTO>();


		try {
			pstmt = con.prepareStatement(traMaster_sql);
			pstmt.setInt(1, tra_num);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				 TravelSchDTO travelSchDTO = new TravelSchDTO();
		            travelSchDTO.setSch_num(rs.getInt("sm.sch_num"));
		            travelSchDTO.setSch_tra_num(rs.getInt("sm.sch_tra_num"));
		            travelSchDTO.setSch_day(rs.getString("sm.sch_day"));
		            travelSchDTO.setSch_filter(rs.getString("sm.sch_filter"));
		            travelSchDTO.setSch_pla(rs.getString("sm.sch_pla"));
		            travelSchDTO.setSch_memo(rs.getString("sm.sch_memo"));
		            travelSchDTO.setLoc2_loc(rs.getString("li2.loc2_loc"));
		            System.out.println(rs.getString("li2.loc2_loc"));

		            selectSchFromList.add(travelSchDTO);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return selectSchFromList;

	}
	
	//?
    public int getTraCityNum(String tra_city) {
	        int tra_city_num = 0;
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;

	        try {
	            conn = getConnection();
	            String sql = "SELECT tra_city_num FROM tra_master WHERE tra_city = ?";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, tra_city);
	            rs = pstmt.executeQuery();

	            if (rs.next()) {
	                tra_city_num = rs.getInt("tra_city_num");
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            // 리소스 해제
		        close(rs);
		        close(pstmt);
	        }

	        return tra_city_num;
	    }
	
	
	public ArrayList<TravelDTO> selectLocList(String tra_city) {
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String locInfoVO_sql = 	  "SELECT DISTINCT li.* FROM loc_info2 li "
	    						+ "INNER JOIN tra_master tm "
	    						+ "ON tm.tra_city_num = li.loc2_city_num "
	    						+ "WHERE tm.tra_city = ?";
	    ArrayList<TravelDTO> selectLocList = new ArrayList<TravelDTO>();

	    try {
	        pstmt = con.prepareStatement(locInfoVO_sql);
	        pstmt.setString(1, tra_city);
	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	        	TravelDTO travelDTO = new TravelDTO();

	        	travelDTO.setLoc2_num(rs.getInt("loc2_num"));
	        	travelDTO.setLoc2_name(rs.getString("loc2_name"));
	        	travelDTO.setLoc2_filter(rs.getString("loc2_filter"));
	        	travelDTO.setLoc2_name_lang(rs.getString("loc2_name_lang"));
	        	travelDTO.setLoc2_exp(rs.getString("loc2_exp"));
	        	travelDTO.setLoc2_addr(rs.getString("loc2_addr"));
	        	travelDTO.setLoc2_webp(rs.getString("loc2_webp"));
	        	travelDTO.setLoc2_hour(rs.getString("loc2_hour"));
	        	travelDTO.setLoc2_phone(rs.getString("loc2_phone"));
	        	travelDTO.setLoc2_loc(rs.getString("loc2_loc"));
	        	travelDTO.setLoc2_lat(rs.getString("loc2_lat"));
	        	travelDTO.setLoc2_lng(rs.getString("loc2_lng"));

	            selectLocList.add(travelDTO);
	        }
	    } catch (Exception ex) {
	        ex.printStackTrace();
	    } finally {
	        close(rs);
	        close(pstmt);
	    }

	    return selectLocList;
	}
	
	


//	public ArrayList<TravelDTO> selectLocList() {
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		String LocInfoVO_sql = "SELECT * FROM loc_info2";
//		ArrayList<TravelDTO> selectLocList = new ArrayList<TravelDTO>();
//
//		try {
//			pstmt = con.prepareStatement(LocInfoVO_sql);
//			rs = pstmt.executeQuery();
//
//			while (rs.next()) {
//
//				TravelDTO locInfoVO = new TravelDTO();
//
//				locInfoVO.setLoc2_num(rs.getInt("Loc2_num"));
//				locInfoVO.setLoc2_name(rs.getString("loc2_name"));
//				locInfoVO.setLoc2_filter(rs.getString("loc2_filter"));
//				locInfoVO.setLoc2_name_lang(rs.getString("loc2_name_lang"));
//				locInfoVO.setLoc2_exp(rs.getString("loc2_exp"));
//				locInfoVO.setLoc2_addr(rs.getString("loc2_addr"));
//				locInfoVO.setLoc2_webp(rs.getString("loc2_webp"));
//				locInfoVO.setLoc2_hour(rs.getString("loc2_hour"));
//				locInfoVO.setLoc2_phone(rs.getString("loc2_phone"));
//				locInfoVO.setLoc2_loc(rs.getString("loc2_loc"));
//				locInfoVO.setLoc2_lat(rs.getString("loc2_lat"));
//				locInfoVO.setLoc2_lng(rs.getString("loc2_lng"));
//
//				selectLocList.add(locInfoVO);
//			}
//		} catch (Exception ex) {
//		} finally {
//			close(rs);
//			close(pstmt);
//		}
//
//		return selectLocList;
//
//	}

	
	public ArrayList<TravelSchMngVO> selectSchMng() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectSchMng_sql = "SELECT sch_day FROM sch_manage WHERE sch_tra_num = (SELECT MAX(sch_tra_num) FROM sch_manage)";
		ArrayList<TravelSchMngVO> selectSchMngList = new ArrayList<TravelSchMngVO>();

		try {
			pstmt = con.prepareStatement(selectSchMng_sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				TravelSchMngVO travelSchMngVO = new TravelSchMngVO();
				travelSchMngVO.setSch_day(rs.getString("sch_day"));

				selectSchMngList.add(travelSchMngVO);

			}
		} catch (Exception ex) {
		} finally {
			close(rs);
			close(pstmt);
		}

		System.out.println(selectSchMngList);

		return selectSchMngList;

	}

	//일정추가
	public int insertSch(TravelSchDTO article) {
		PreparedStatement pstmt = null;

		String sql = "";
		int insertCount = 0;
		ResultSet generatedKeys = null;
		int sch_num = 0;


		try {
			sql = "INSERT INTO sch_manage (sch_tra_num, sch_day, "
				+ "sch_filter, sch_loc_num, sch_pla, sch_modified_date) "
				+ "SELECT ?, ?, loc2_filter, loc2_num, "
				+ "loc2_name, CURRENT_TIMESTAMP "
				+ "FROM loc_info2 "
				+ "WHERE loc2_filter=? and loc2_num =? "
				+ "and loc2_name  = ?";

			pstmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

			// JSON 데이터 파싱
			JSONObject json = new JSONObject(article);
			pstmt.setInt(1, json.getInt("sch_tra_num"));
			pstmt.setString(2, json.getString("sch_day"));
			pstmt.setInt(3, json.getInt("loc2_filter"));
			pstmt.setInt(4, json.getInt("loc2_num"));
			pstmt.setString(5, json.getString("loc2_name"));

			System.out.println();
			insertCount = pstmt.executeUpdate(); // 첫 번째 호출만 유지합니다.

			generatedKeys = pstmt.getGeneratedKeys();
			if (generatedKeys.next()) {
				sch_num = generatedKeys.getInt(1);
				article.setSch_num(sch_num);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(generatedKeys);
			close(pstmt);
		}
		System.out.println("Insert count: " + insertCount);
		System.out.println("Generated primary key: " + sch_num);
		return insertCount;
	}
	
	//메모추가
	public int insertMemo(TravelSchDTO article) {
		PreparedStatement pstmt = null;

		String sql = "";
		int insertCount = 0;
		ResultSet rs = null;

		try {
			sql = "UPDATE sch_manage " + "SET sch_memo = ? " + "WHERE sch_num = ?";

			pstmt = con.prepareStatement(sql);
			// JSON 데이터 파싱
			JSONObject json = new JSONObject(article);
			pstmt.setString(1, json.getString("sch_memo"));
			System.out.println(json.getString("sch_memo"));
			pstmt.setInt(2, json.getInt("sch_num"));
			System.out.println(json.getInt("sch_num"));

			insertCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("Insert count: " + insertCount);

		return insertCount;
	}

	//메모수정
	public int editMemo(TravelSchDTO article) {

		PreparedStatement pstmt = null;
		String memo_edit_sql="update sch_manage set sch_memo = ? where sch_num=?";
		int editCount=0;

		try{
			pstmt=con.prepareStatement(memo_edit_sql);
			JSONObject json = new JSONObject(article);
			pstmt.setString(1, json.getString("sch_memo"));
			System.out.println(json.getString("sch_memo"));
			pstmt.setInt(2, json.getInt("sch_num"));
			System.out.println(json.getInt("sch_num"));			

			editCount=pstmt.executeUpdate();
		}catch(Exception ex){
			ex.printStackTrace();
		}	finally{
			close(pstmt);
		}

		return editCount;

	}

	
	//메모삭제
	public int deleteMemo(int sch_num) {

		PreparedStatement pstmt = null;
		String board_delete_sql="delete from sch_manage where sch_num=?";
		int deleteCount=0;

		try{
			pstmt=con.prepareStatement(board_delete_sql);
			pstmt.setInt(1, sch_num);
			deleteCount=pstmt.executeUpdate();
		}catch(Exception ex){
			ex.printStackTrace();
		}	finally{
			close(pstmt);
		}

		return deleteCount;

	}
	
	
//여행리스트 불러오기
	public ArrayList<TravelDTO> selectTravelList(String tra_mem_id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
//		String travelDTO_list_sql = "SELECT tra_num, tra_mem_id, tra_title, tra_dday, tra_aday, tra_ppl "
//				+ "FROM ( "
//				+ "SELECT tra_num, tra_mem_id, tra_title, tra_dday, tra_aday, tra_ppl, sch_modified_date, "
//				+ "ROW_NUMBER() OVER (PARTITION BY tra_num ORDER BY sch_modified_date DESC) AS row_num "
//				+ "FROM tra_master "
//				+ "JOIN sch_manage ON tra_master.tra_num = sch_manage.sch_tra_num "
//				+ "WHERE tra_master.tra_mem_id = ? "
//				+ ") AS subquery "
//				+ "WHERE row_num = 1 "
//				+ "ORDER BY sch_modified_date DESC;";
		
		String travelDTO_list_sql = "SELECT tm.tra_num, tm.tra_mem_id, tm.tra_title, tm.tra_dday, tm.tra_aday, tm.tra_ppl, \r\n"
				+ "MAX(sm.sch_modified_date) AS sch_modified_date\r\n"
				+ "FROM tra_master tm\r\n"
				+ "JOIN sch_manage sm ON tm.tra_num = sm.sch_tra_num\r\n"
				+ "WHERE tm.tra_mem_id = ?\r\n"
				+ "GROUP BY tm.tra_num, tm.tra_mem_id, tm.tra_title, tm.tra_dday, tm.tra_aday, tm.tra_ppl\r\n"
				+ "ORDER BY sch_modified_date DESC;";
		ArrayList<TravelDTO> selectTravelList = new ArrayList<TravelDTO>();
		TravelDTO travelDTO = null;

		try {
			pstmt = con.prepareStatement(travelDTO_list_sql);
			pstmt.setString(1, tra_mem_id);
			rs = pstmt.executeQuery();
		
			while (rs.next()) {
				travelDTO = new TravelDTO();
				travelDTO.setTra_mem_id(rs.getString("tra_mem_id"));
				travelDTO.setTra_num(rs.getInt("tra_num"));
				travelDTO.setTra_title(rs.getString("tra_title"));
				travelDTO.setTra_dday(rs.getString("tra_dday"));
				travelDTO.setTra_aday(rs.getString("tra_aday"));
				travelDTO.setTra_ppl(rs.getInt("tra_ppl"));
				selectTravelList.add(travelDTO);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return selectTravelList;
	}
	
	
	//여행리스트 불러오기
	public ArrayList<TravelPlanVO> autocompleteList(String value) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String travelDTO_list_sql = "SELECT city_num, city_name FROM city_info WHERE city_name LIKE '%' || ? || '%'";
			ArrayList<TravelPlanVO> autocityList = new ArrayList<TravelPlanVO>();
			TravelDTO travelDTO = null;
			 try {
			        pstmt = con.prepareStatement(travelDTO_list_sql);
			        pstmt.setString(1, value);
			        rs = pstmt.executeQuery();

			        while (rs.next()) {
			        	TravelPlanVO travelPlanVO = new TravelPlanVO();
			        	travelPlanVO.setCity_num(rs.getInt("city_num"));
			        	travelPlanVO.setCity_name(rs.getString("city_name"));
			        	autocityList.add(travelPlanVO);
			        }

			    } catch (Exception ex) {
			        ex.printStackTrace();
			    } finally {
			        close(rs);
			        close(pstmt);
			    }

			    return autocityList;
			}

//여행목록에서 선택한 여행 지우기
	public int deleteTravel(int tra_num) {
	    PreparedStatement pstmt = null;
	    String sch_manage_delete_sql = "DELETE FROM sch_manage WHERE sch_tra_num = ?";
	    String tra_master_delete_sql = "DELETE FROM tra_master WHERE tra_num = ?";
	    
	    int deleteCount = 0;

	    try {
	        // sch_manage 테이블에서 레코드 삭제
	        pstmt = con.prepareStatement(sch_manage_delete_sql);
	        pstmt.setInt(1, tra_num);
	        pstmt.executeUpdate();
	        
	        // tra_master 테이블에서 레코드 삭제
	        pstmt = con.prepareStatement(tra_master_delete_sql);
	        pstmt.setInt(1, tra_num);
	        deleteCount = pstmt.executeUpdate();
	    } catch (Exception ex) {
	        ex.printStackTrace();
	    } finally {
	        close(pstmt);
	    }

	    return deleteCount;
	}


}
