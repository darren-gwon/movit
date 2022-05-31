package com.bitcamp.semiproj.domain;

import java.util.Objects;

public class NaverDto {

	private long n_number;	// pk로 쓸 값
	private String n_birthday;
	private String n_email;
	private String n_gender;
	private String n_name;
	private String n_nickName;
	private String n_birthyear;
	public long getN_number() {
		return n_number;
	}
	public void setN_number(long n_number) {
		this.n_number = n_number;
	}
	public String getN_birthday() {
		return n_birthday;
	}
	public void setN_birthday(String n_birthday) {
		this.n_birthday = n_birthday;
	}
	public String getN_email() {
		return n_email;
	}
	public void setN_email(String n_email) {
		this.n_email = n_email;
	}
	public String getN_gender() {
		return n_gender;
	}
	public void setN_gender(String n_gender) {
		this.n_gender = n_gender;
	}
	public String getN_name() {
		return n_name;
	}
	public void setN_name(String n_name) {
		this.n_name = n_name;
	}
	public String getN_nickName() {
		return n_nickName;
	}
	public void setN_nickName(String n_nickName) {
		this.n_nickName = n_nickName;
	}
	public String getN_birthyear() {
		return n_birthyear;
	}
	public void setN_birthyear(String n_birthyear) {
		this.n_birthyear = n_birthyear;
	}
	@Override
	public String toString() {
		return "NaverDto [n_number=" + n_number + ", n_birthday=" + n_birthday + ", n_email=" + n_email + ", n_gender="
				+ n_gender + ", n_name=" + n_name + ", n_nickName=" + n_nickName + ", n_birthyear=" + n_birthyear + "]";
	}
	
	
	
	
}
