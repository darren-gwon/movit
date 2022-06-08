package com.bitcamp.semiproj.domain;

import java.util.List;
import java.util.Objects;

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
	private BookingDto bookingDto;
	
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
	public BookingDto getBookingDto() {
		return bookingDto;
	}
	public void setBookingDto(BookingDto bookingDto) {
		this.bookingDto = bookingDto;
	}
	@Override
	public String toString() {
		return "OrderInfoDto [cid=" + cid + ", theater_id=" + theater_id + ", theater_name=" + theater_name
				+ ", region_name=" + region_name + ", movie_id=" + movie_id + ", title=" + title + ", age_group="
				+ age_group + ", runningtime=" + runningtime + ", poster_img=" + poster_img + ", schedule_id="
				+ schedule_id + ", screen_date=" + screen_date + ", start_time=" + start_time + ", end_time=" + end_time
				+ ", class_type=" + class_type + ", total_seats=" + total_seats + ", screen_name=" + screen_name
				+ ", bookingDto=" + bookingDto + "]";
	}
	@Override
	public int hashCode() {
		return Objects.hash(age_group, bookingDto, cid, class_type, end_time, movie_id, poster_img, region_name, runningtime, schedule_id,
				screen_date, screen_name, start_time, theater_id, theater_name, title, total_seats);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		OrderInfoDto other = (OrderInfoDto) obj;
		return Objects.equals(age_group, other.age_group) && Objects.equals(bookingDto, other.bookingDto) && Objects.equals(cid, other.cid)
				&& Objects.equals(class_type, other.class_type) && Objects.equals(end_time, other.end_time)
				&& Objects.equals(movie_id, other.movie_id) && Objects.equals(poster_img, other.poster_img)
				&& Objects.equals(region_name, other.region_name) && Objects.equals(runningtime, other.runningtime)
				&& Objects.equals(schedule_id, other.schedule_id) && Objects.equals(screen_date, other.screen_date)
				&& Objects.equals(screen_name, other.screen_name) && Objects.equals(start_time, other.start_time)
				&& Objects.equals(theater_id, other.theater_id) && Objects.equals(theater_name, other.theater_name)
				&& Objects.equals(title, other.title) && Objects.equals(total_seats, other.total_seats);
	}	
	
}
