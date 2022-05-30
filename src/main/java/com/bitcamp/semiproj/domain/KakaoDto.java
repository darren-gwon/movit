package com.bitcamp.semiproj.domain;

import java.util.Objects;

public class KakaoDto {
	private long k_number;
	private String k_name;
	private String k_email;
	
	public long getK_number() {
		return k_number;
	}
	public void setK_number(long k_number) {
		this.k_number = k_number;
	}
	public String getK_name() {
		return k_name;
	}
	public void setK_name(String k_name) {
		this.k_name = k_name;
	}
	public String getK_email() {
		return k_email;
	}
	public void setK_email(String k_email) {
		this.k_email = k_email;
	}
	@Override
	public int hashCode() {
		return Objects.hash(k_email, k_name, k_number);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		KakaoDto other = (KakaoDto) obj;
		return Objects.equals(k_email, other.k_email) && Objects.equals(k_name, other.k_name)
				&& k_number == other.k_number;
	}
	@Override
	public String toString() {
		return "KakaoDto [k_number=" + k_number + ", k_name=" + k_name + ", k_email=" + k_email + ", getK_number()="
				+ getK_number() + ", getK_name()=" + getK_name() + ", getK_email()=" + getK_email() + ", hashCode()="
				+ hashCode() + ", getClass()=" + getClass() + ", toString()=" + super.toString() + "]";
	}
	

	
	
}
