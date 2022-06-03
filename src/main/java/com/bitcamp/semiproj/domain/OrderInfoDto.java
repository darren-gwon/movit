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
	private Integer movieID;
	private Integer scheduleID;
	private Integer screenID;
	private Integer classID;
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

	
	public Integer getMovieID() {
		return movieID;
	}
	public void setMovieID(Integer movieID) {
		this.movieID = movieID;
	}
	public Integer getScheduleID() {
		return scheduleID;
	}
	public void setScheduleID(Integer scheduleID) {
		this.scheduleID = scheduleID;
	}
	public Integer getScreenID() {
		return screenID;
	}
	public void setScreenID(Integer screenID) {
		this.screenID = screenID;
	}
	public Integer getClassID() {
		return classID;
	}
	public void setClassID(Integer classID) {
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
