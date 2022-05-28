package com.bitcamp.semiproj.domain;

import java.sql.Timestamp;
import java.util.Date;

public class KakaoPayApprovalDto {
    private String aid, tid, cid, sid;
    private String partner_order_id, partner_user_id, payment_method_type;
    private AmountDto amount;
    private CardInfoDto card_info;
    private String item_name, item_code, payload;
    private Timestamp created_at, approved_at;
    private Integer quantity;
    
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public String getPartner_order_id() {
		return partner_order_id;
	}
	public void setPartner_order_id(String partner_order_id) {
		this.partner_order_id = partner_order_id;
	}
	public String getPartner_user_id() {
		return partner_user_id;
	}
	public void setPartner_user_id(String partner_user_id) {
		this.partner_user_id = partner_user_id;
	}
	public String getPayment_method_type() {
		return payment_method_type;
	}
	public void setPayment_method_type(String payment_method_type) {
		this.payment_method_type = payment_method_type;
	}
	public AmountDto getAmount() {
		return amount;
	}
	public void setAmount(AmountDto amount) {
		this.amount = amount;
	}
	public CardInfoDto getCard_info() {
		return card_info;
	}
	public void setCard_info(CardInfoDto card_info) {
		this.card_info = card_info;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getItem_code() {
		return item_code;
	}
	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}
	public String getPayload() {
		return payload;
	}
	public void setPayload(String payload) {
		this.payload = payload;
	}
	public Timestamp getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Timestamp created_at) {
		this.created_at = created_at;
	}
	public Timestamp getApproved_at() {
		return approved_at;
	}
	public void setApproved_at(Timestamp approved_at) {
		this.approved_at = approved_at;
	}

	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	@Override
	public String toString() {
		return "KakaoPayApprovalDTO [aid=" + aid + ", tid=" + tid + ", cid=" + cid + ", sid=" + sid
				+ ", partner_order_id=" + partner_order_id + ", partner_user_id=" + partner_user_id
				+ ", payment_method_type=" + payment_method_type + ", amount=" + amount + ", card_info=" + card_info
				+ ", item_name=" + item_name + ", item_code=" + item_code + ", payload=" + payload + ", created_at="
				+ created_at + ", approved_at=" + approved_at + ", quantity=" + quantity + ", getAid()=" + getAid()
				+ ", getTid()=" + getTid() + ", getCid()=" + getCid() + ", getSid()=" + getSid()
				+ ", getPartner_order_id()=" + getPartner_order_id() + ", getPartner_user_id()=" + getPartner_user_id()
				+ ", getPayment_method_type()=" + getPayment_method_type() + ", getAmount()=" + getAmount()
				+ ", getCard_info()=" + getCard_info() + ", getItem_name()=" + getItem_name() + ", getItem_code()="
				+ getItem_code() + ", getPayload()=" + getPayload() + ", getCreated_at()=" + getCreated_at()
				+ ", getApproved_at()=" + getApproved_at() + ", getQuantity()=" + getQuantity() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
    
    
}
