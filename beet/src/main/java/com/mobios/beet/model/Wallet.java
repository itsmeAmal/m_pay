package com.mobios.beet.model;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;

@Entity
@Table(name="wallet")
@EntityListeners(AuditingEntityListener.class)

@NamedQuery(name = "Wallet.getWalletId", query = "select w.id from Wallet w where w.accNo=?1")

public class Wallet {


		@Id
		private int id;
		
		@Column(name = "acc_no")
		private String accNo;
		
		@Column(name = "amount")
		private String amount;

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public String getAccNo() {
			return accNo;
		}

		public void setAccNo(String accNo) {
			this.accNo = accNo;
		}

		public String getAmount() {
			return amount;
		}

		public void setAmount(String amount) {
			this.amount = amount;
		}

		
		

		
		
		
	}

	
