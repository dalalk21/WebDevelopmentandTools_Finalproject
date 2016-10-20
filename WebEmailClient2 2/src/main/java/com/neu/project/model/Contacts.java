package com.neu.project.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Contacts {
	@Id
	private int contact_Id;
	
	@ManyToOne
	@JoinColumn(name="userId")
	private User user;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getContact_Id() {
		return contact_Id;
	}

	public void setContact_Id(int contact_Id) {
		this.contact_Id = contact_Id;
	}

	
	
	

}
