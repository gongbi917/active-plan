package com.forone.activeplan.entity;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.OneToMany;

@Entity
public class Tag implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String name;
	
	private int scope;
	
	@OneToMany(mappedBy = "tag")
	private Set<PlanItem> planItems;
	
	public Tag() {
	}
	
	public String getName() {
		return this.name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public int getScope() {
		return this.scope;
	}
	
	public void setScope(int scope) {
		this.scope = scope;
	}
	
	public Set<PlanItem> getPlanItems() {
		return this.planItems;
	}
	
	public void setPlanItems(Set<PlanItem> planItems) {
		this.planItems = planItems;
	}
	
}