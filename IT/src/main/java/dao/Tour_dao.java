package dao;

import java.io.Closeable;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;

import java.sql.*;

import vo.TourInfo;
import static db.JdbcUtil.*;

public class Tour_dao {
	DataSource ds;
	Connection con;
	private static Tour_dao tour_dao;
	private Tour_dao() {
		
	}
	
	public static Tour_dao getInstance() {
		if(tour_dao == null) {
			tour_dao = new Tour_dao();
		}
		return tour_dao;
	}
	public void setConnection(Connection con) {
		this.con = con;
	}
	public ArrayList<TourInfo> selectTourlist() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String tourlist_sql = "select tour_num,tour_name, tour_img1, tour_sub_name, tour_spe, tour_dc, tour_price, tour_avg, tour_review from tour_info";
		ArrayList<TourInfo> tourlist = new ArrayList<TourInfo>();
		TourInfo tourinfo = null;
		
		try {
			pstmt = con.prepareStatement(tourlist_sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				tourinfo = new TourInfo();
				tourinfo.setTour_num(rs.getInt("tour_num"));
				tourinfo.setTour_name(rs.getString("tour_name"));
				tourinfo.setTour_img1(rs.getString("tour_img1"));
				tourinfo.setTour_spe(rs.getString("tour_spe"));
				tourinfo.setTour_dc(rs.getInt("tour_dc"));
				tourinfo.setTour_price(rs.getInt("tour_price"));
				tourinfo.setTour_avg(rs.getFloat("tour_avg"));
				tourinfo.setTour_review(rs.getInt("tour_review"));
				tourinfo.setTour_sub_name(rs.getString("tour_sub_name"));
				tourlist.add(tourinfo);
			}
		} catch(Exception e) {
			
		}finally {
			close(rs);
			close(pstmt);
			
		}
		return tourlist;
	}
	public TourInfo selectDetail() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String tourlist_sql = "select tour_city, tour_tour, tour_img1, tour_num, tour_spe, tour_name, tour_sub_name, tour_price from tour_info";
		TourInfo tourlist = new TourInfo();
		TourInfo tourinfo = null;
		
		try {
			pstmt = con.prepareStatement(tourlist_sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				tourinfo = new TourInfo();
				tourinfo.setTour_city(rs.getString("tour_city"));
				tourinfo.setTour_tour(rs.getString("tour_tour"));
				tourinfo.setTour_img1(rs.getString("tour_img1"));
				tourinfo.setTour_num(rs.getInt("tour_num"));
				tourinfo.setTour_name(rs.getString("tour_name"));
				tourinfo.setTour_spe(rs.getString("tour_spe"));
				tourinfo.setTour_price(rs.getInt("tour_price"));
				tourinfo.setTour_sub_name(rs.getString("tour_sub_name"));
				
			}
		} catch(Exception e) {
			
		}finally {
			close(rs);
			close(pstmt);
			
		}
		return tourlist;
	}
}
