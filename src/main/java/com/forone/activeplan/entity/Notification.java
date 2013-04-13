package com.forone.activeplan.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Notification implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "reminder_time")
	private Date reminderTime;
	
	@Lob()
	@Column(name = "reminder_way")
	private String reminderWay;
	
	public Notification() {
	}
	
	public Date getReminderTime() {
		return this.reminderTime;
	}
	
	public void setReminderTime(Date reminderTime) {
		this.reminderTime = reminderTime;
	}
	
	public String getReminderWay() {
		return this.reminderWay;
	}
	
	public void setReminderWay(String reminderWay) {
		this.reminderWay = reminderWay;
	}
}