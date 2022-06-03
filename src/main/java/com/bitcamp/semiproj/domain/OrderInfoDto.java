package com.bitcamp.semiproj.domain;

public class OrderInfoDto {
	private String cid;
	private Integer quantity;
	private Integer total_amount;
	private String item_name;
	private Integer adultCnt;
	private Integer youthCnt;
	private Integer specialCnt;
	private Integer totalPrice;
	private String movieID;
	private String scheduleID;
	private String screenID;
	private String classID;
	private BookingDto bookingDto;
	
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Integer getTotal_amount() {
		return total_amount;
	}
	public void setTotal_amount(Integer total_amount) {
		this.total_amount = total_amount;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public Integer getAdultCnt() {
		return adultCnt;
	}
	public void setAdultCnt(Integer adultCnt) {
		this.adultCnt = adultCnt;
	}
	public Integer getYouthCnt() {
		return youthCnt;
	}
	public void setYouthCnt(Integer youthCnt) {
		this.youthCnt = youthCnt;
	}
	public Integer getSpecialCnt() {
		return specialCnt;
	}
	public void setSpecialCnt(Integer specialCnt) {
		this.specialCnt = specialCnt;
	}
	public Integer getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Integer totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getMovieID() {
		return movieID;
	}
	public void setMovieID(String movieID) {
		this.movieID = movieID;
	}
	public String getScheduleID() {
		return scheduleID;
	}
	public void setScheduleID(String scheduleID) {
		this.scheduleID = scheduleID;
	}
	public String getScreenID() {
		return screenID;
	}
	public void setScreenID(String screenID) {
		this.screenID = screenID;
	}
	public String getClassID() {
		return classID;
	}
	public void setClassID(String classID) {
		this.classID = classID;
	}
	
	public BookingDto getBookingDto() {
		return bookingDto;
	}
	public void setBookingDto(BookingDto bookingDto) {
		this.bookingDto = bookingDto;
	}
	@Override
	public String toString() {
		return "OrderInfoDto [cid=" + cid + ", quantity=" + quantity + ", total_amount=" + total_amount + ", item_name="
				+ item_name + ", adultCnt=" + adultCnt + ", youthCnt=" + youthCnt + ", specialCnt=" + specialCnt
				+ ", totalPrice=" + totalPrice + ", movieID=" + movieID + ", scheduleID=" + scheduleID + ", screenID="
				+ screenID + ", classID=" + classID + ", bookingDto=" + bookingDto.toString() + "]";
	}
	
	
}
