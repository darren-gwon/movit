package com.bitcamp.semiproj.domain;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

//기존에 이미 만들어놓은 DTO를 재활용하도록 리팩토링
//2022-06-04
public class OrderInfoDto {
	private String cid;
	private Integer theater_id;
	private String theater_name;
	private String region_name;
	private String movie_id;
	private String title;
	private Integer age_group;
	private Integer runningtime;
	private String poster_img;
	private Integer schedule_id;
	private String screen_date;
	private String start_time;
	private String end_time;
	private String class_type;
	private Integer total_seats;
	private String screen_name;
	private Integer adultCnt;
	private Integer youthCnt;
	private Integer specialCnt;
	private Integer quantity;
	private Integer totalPrice;
	private String pay_tid;
	private String user_id;
	private String booking_id;
	private List<OwnSeatDto> ownSeatList;

	
	public String getPay_tid() {
		return pay_tid;
	}
	public void setPay_tid(String pay_tid) {
		this.pay_tid = pay_tid;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getBooking_id() {
		return booking_id;
	}
	public void setBooking_id(String booking_id) {
		this.booking_id = booking_id;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public Integer getTheater_id() {
		return theater_id;
	}
	public void setTheater_id(Integer theater_id) {
		this.theater_id = theater_id;
	}
	public String getTheater_name() {
		return theater_name;
	}
	public void setTheater_name(String theater_name) {
		this.theater_name = theater_name;
	}
	public String getRegion_name() {
		return region_name;
	}
	public void setRegion_name(String region_name) {
		this.region_name = region_name;
	}
	public String getMovie_id() {
		return movie_id;
	}
	public void setMovie_id(String movie_id) {
		this.movie_id = movie_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Integer getAge_group() {
		return age_group;
	}
	public void setAge_group(Integer age_group) {
		this.age_group = age_group;
	}
	public Integer getRunningtime() {
		return runningtime;
	}
	public void setRunningtime(Integer runningtime) {
		this.runningtime = runningtime;
	}
	public String getPoster_img() {
		return poster_img;
	}
	public void setPoster_img(String poster_img) {
		this.poster_img = poster_img;
	}
	public Integer getSchedule_id() {
		return schedule_id;
	}
	public void setSchedule_id(Integer schedule_id) {
		this.schedule_id = schedule_id;
	}
	public String getScreen_date() {
		return screen_date;
	}
	public void setScreen_date(String screen_date) {
		this.screen_date = screen_date;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public String getClass_type() {
		return class_type;
	}
	public void setClass_type(String class_type) {
		this.class_type = class_type;
	}
	public Integer getTotal_seats() {
		return total_seats;
	}
	public void setTotal_seats(Integer total_seats) {
		this.total_seats = total_seats;
	}
	public String getScreen_name() {
		return screen_name;
	}
	public void setScreen_name(String screen_name) {
		this.screen_name = screen_name;
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
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Integer getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Integer totalPrice) {
		this.totalPrice = totalPrice;
	}
	public List<OwnSeatDto> getOwnSeatList() {
		return ownSeatList;
	}
	public void setOwnSeatList(List<OwnSeatDto> ownSeatList) {
		this.ownSeatList = ownSeatList;
	}
	@Override
	public String toString() {
		return "OrderInfoDto [cid=" + cid + ", theater_id=" + theater_id + ", theater_name=" + theater_name + ", region_name=" + region_name
				+ ", movie_id=" + movie_id + ", title=" + title + ", age_group=" + age_group + ", runningtime=" + runningtime + ", poster_img="
				+ poster_img + ", schedule_id=" + schedule_id + ", screen_date=" + screen_date + ", start_time=" + start_time + ", end_time="
				+ end_time + ", class_type=" + class_type + ", total_seats=" + total_seats + ", screen_name=" + screen_name + ", adultCnt=" + adultCnt
				+ ", youthCnt=" + youthCnt + ", specialCnt=" + specialCnt + ", quantity=" + quantity + ", totalPrice=" + totalPrice + ", pay_tid="
				+ pay_tid + ", user_id=" + user_id + ", booking_id=" + booking_id + ", ownSeatList=" + ownSeatList + "]";
	}


}
