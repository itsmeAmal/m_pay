package com.mobios.beet.model;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;

@Entity
@EntityListeners(AuditingEntityListener.class)
public class MerchantTypes {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private int count;
	private String merchant_category;
	
	//getters and setters
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getMerchant_category() {
		return merchant_category;
	}
	public void setMerchant_category(String merchant_category) {
		this.merchant_category = merchant_category;
	}
	
	
	
	//getters and setters
	
	
	
	
}
