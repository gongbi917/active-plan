package com.forone.activeplan.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "plan_item")
public class PlanItem implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Column(name = "title")
	private String title;
	
	@Column(name = "content")
	private String content;
	
	@Column(name = "scope")
	private String scope;
	
	@Column(name = "status")
	private String status;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "target_time")
	private Date targetTime;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "actual_time")
	private Date actualTime;
	
	@OneToOne
	private Notification notification;
	
	@ManyToOne
	private Tag tag;
	
	public PlanItem() {
	}
	
	public Date getActualTime() {
		return this.actualTime;
	}
	
	public void setActualTime(Date actualTime) {
		this.actualTime = actualTime;
	}
	
	public String getContent() {
		return this.content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getScope() {
		return this.scope;
	}
	
	public void setScope(String scope) {
		this.scope = scope;
	}
	
	public String getStatus() {
		return this.status;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}
	
	public Date getTargetTime() {
		return this.targetTime;
	}
	
	public void setTargetTime(Date targetTime) {
		this.targetTime = targetTime;
	}
	
	public String getTitle() {
		return this.title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public Notification getNotification() {
		return this.notification;
	}
	
	public void setNotification(Notification notification) {
		this.notification = notification;
	}
	
	public Tag getTag() {
		return this.tag;
	}
	
	public void setTag(Tag tag) {
		this.tag = tag;
	}
	
}