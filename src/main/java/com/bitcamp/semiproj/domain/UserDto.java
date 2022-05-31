package com.bitcamp.semiproj.domain;

import java.sql.Timestamp;

public class UserDto {
	
	private int seq;
	private String user_id;
	private String password;
	private String name;
	private String nickname;
	private String email;
	private String phone;
	private String gender;
	private String birthday;
	private String key;
	private String sns_type;
	private String sns_email;
	private String sns_name;
	private Timestamp register_date;
	private Timestamp modified_date;
	
	public String getSns_type() {
		return sns_type;
	}
	public void setSns_type(String sns_type) {
		this.sns_type = sns_type;
	}
	public String getSns_email() {
		return sns_email;
	}
	public void setSns_email(String sns_email) {
		this.sns_email = sns_email;
	}
	public String getSns_name() {
		return sns_name;
	}
	public void setSns_name(String sns_name) {
		this.sns_name = sns_name;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}

	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public Timestamp getRegister_date() {
		return register_date;
	}
	public void setRegister_date(Timestamp register_date) {
		this.register_date = register_date;
	}
	public Timestamp getModified_date() {
		return modified_date;
	}
	public void setModified_date(Timestamp modified_date) {
		this.modified_date = modified_date;
	}
	@Override
	public String toString() {
		return "UserDto [seq=" + seq + ", user_id=" + user_id + ", password=" + password + ", name=" + name
				+ ", nickname=" + nickname + ", email=" + email + ", phone=" + phone + ", gender=" + gender
				+ ", birthday=" + birthday + ", key=" + key + ", sns_type=" + sns_type + ", sns_email=" + sns_email
				+ ", sns_name=" + sns_name + ", register_date=" + register_date + ", modified_date=" + modified_date
				+ ", getSns_type()=" + getSns_type() + ", getSns_email()=" + getSns_email() + ", getSns_name()="
				+ getSns_name() + ", getKey()=" + getKey() + ", getSeq()=" + getSeq() + ", getUser_id()=" + getUser_id()
				+ ", getPassword()=" + getPassword() + ", getName()=" + getName() + ", getNickname()=" + getNickname()
				+ ", getEmail()=" + getEmail() + ", getPhone()=" + getPhone() + ", getGender()=" + getGender()
				+ ", getBirthday()=" + getBirthday() + ", getRegister_date()=" + getRegister_date()
				+ ", getModified_date()=" + getModified_date() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
}
