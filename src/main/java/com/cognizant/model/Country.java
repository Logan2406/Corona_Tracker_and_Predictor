package com.cognizant.model;


public class Country {
	private String name;
	private Integer confirmed;
	private Integer dead;
	private Integer recovered;
	
	
	
	public Country(String name, Integer confirmed, Integer dead, Integer recovered) {
		super();
		this.name = name;
		this.confirmed = confirmed;
		this.dead = dead;
		this.recovered = recovered;
	}


	public Country(String name) {
		super();
		this.name = name;
	}
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getConfirmed() {
		return confirmed;
	}
	public void setConfirmed( Integer confirmed) {
		this.confirmed = confirmed;
	}
	public  Integer getDead() {
		return dead;
	}
	public void setDead( Integer dead) {
		this.dead = dead;
	}
	public Integer getRecovered() {
		return recovered;
	}
	public void setRecovered(Integer recovered) {
		this.recovered = recovered;
	}


	@Override
	public String toString() {
		return "Country [name=" + name + ", confirmed=" + confirmed + ", dead=" + dead + ", recovered ="+ recovered + "]";
	}
	
}
