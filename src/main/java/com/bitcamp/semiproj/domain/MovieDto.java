package com.bitcamp.semiproj.domain;

import java.sql.Date;

public class MovieDto {
	private Integer seq;
	private String movieID;
	private String title;
	private Integer age_group;
	private String genre;
	private Date opendate;
	private String director;
	private String casts;
	private String summary;
	private String runningtime;
	private String distributor;
	private String country;
	private Integer total_audience;
	private String poster_img;
	private String trailer_url;
	private Integer on_show;
	
	public Integer getSeq() {
		return seq;
	}
	public void setSeq(Integer seq) {
		this.seq = seq;
	}
	public String getMovieID() {
		return movieID;
	}
	public void setMovieID(String movieID) {
		this.movieID = movieID;
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
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public Date getOpendate() {
		return opendate;
	}
	public void setOpendate(Date opendate) {
		this.opendate = opendate;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getCasts() {
		return casts;
	}
	public void setCasts(String casts) {
		this.casts = casts;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getRunningtime() {
		return runningtime;
	}
	public void setRunningtime(String runningtime) {
		this.runningtime = runningtime;
	}
	public String getDistributor() {
		return distributor;
	}
	public void setDistributor(String distributor) {
		this.distributor = distributor;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public Integer getTotal_audience() {
		return total_audience;
	}
	public void setTotal_audience(Integer total_audience) {
		this.total_audience = total_audience;
	}
	public String getPoster_img() {
		return poster_img;
	}
	public void setPoster_img(String poster_img) {
		this.poster_img = poster_img;
	}
	public String getTrailer_url() {
		return trailer_url;
	}
	public void setTrailer_url(String trailer_url) {
		this.trailer_url = trailer_url;
	}
	public Integer getOn_show() {
		return on_show;
	}
	public void setOn_show(Integer on_show) {
		this.on_show = on_show;
	}
	@Override
	public String toString() {
		return "MovieDto [seq=" + seq + ", movieID=" + movieID + ", title=" + title + ", age_group=" + age_group
				+ ", genre=" + genre + ", director=" + director + ", casts=" + casts + ", summary=" + summary
				+ ", runningtime=" + runningtime + ", distributor=" + distributor + ", country=" + country
				+ ", total_audience=" + total_audience + ", poster_img=" + poster_img + ", trailer_url=" + trailer_url
				+ ", on_show=" + on_show + "]";
	}
	
	
}
