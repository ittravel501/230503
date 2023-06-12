package dto;

public class TravelSchDTO {

	int tra_num, sch_num, sch_tra_num, sch_loc_num, sch_filnum, loc2_num;
	String sch_day, sch_pla, loc2_name, loc2_loc, sch_filter, loc2_filter, sch_memo;
	
	public int getTra_num() {
		return tra_num;
	}

	public void setTra_num(int tra_num) {
		this.tra_num = tra_num;
	}

	public String getSch_memo() {
		return sch_memo;
	}

	public void setSch_memo(String sch_memo) {
		this.sch_memo = sch_memo;
	}

	public int getSch_num() {
		return sch_num;
	}

	public void setSch_num(int sch_num) {
		this.sch_num = sch_num;
	}

	public int getLoc2_num() {
		return loc2_num;
	}

	public void setLoc2_num(int loc2_num) {
		this.loc2_num = loc2_num;
	}

	public String getLoc2_loc() {
		return loc2_loc;
	}

	public void setLoc2_loc(String loc2_loc) {
		this.loc2_loc = loc2_loc;
	}

	public int getSch_tra_num() {
		return sch_tra_num;
	}

	public void setSch_tra_num(int sch_tra_num) {
		this.sch_tra_num = sch_tra_num;
	}

	public int getSch_filnum() {
		return sch_filnum;
	}

	public void setSch_filnum(int sch_filnum) {
		this.sch_filnum = sch_filnum;
	}

	public int getSch_loc_num() {
		return sch_loc_num;
	}

	public void setSch_loc_num(int sch_loc_num) {
		this.sch_loc_num = sch_loc_num;
	}

	public String getSch_filter() {
		return sch_filter;
	}

	public void setSch_filter(String sch_filter) {
		this.sch_filter = sch_filter;
	}

	public String getLoc2_filter() {
		return loc2_filter;
	}

	public void setLoc2_filter(String loc2_filter) {
		this.loc2_filter = loc2_filter;
	}

	public String getSch_day() {
		return sch_day;
	}

	public void setSch_day(String sch_day) {
		this.sch_day = sch_day;
	}

	public String getSch_pla() {
		return sch_pla;
	}

	public void setSch_pla(String sch_pla) {
		this.sch_pla = sch_pla;
	}

	public String getLoc2_name() {
		return loc2_name;
	}

	public void setLoc2_name(String loc2_name) {
		this.loc2_name = loc2_name;
	}

	public void setIsWriteSuccess(boolean isWriteSuccess) {
		// TODO Auto-generated method stub
		
	}

}
