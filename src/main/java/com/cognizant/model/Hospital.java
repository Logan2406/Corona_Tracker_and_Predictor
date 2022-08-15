package com.cognizant.model;

public class Hospital {
	private String name;
	private String address;
	private String locality;
	private String type;
	
	public Hospital()
	{
		super();
	}
	
	public Hospital(String name, String address, String locality, String type) {
		super();
		this.name = name;
		this.address = address;
		this.locality = locality;
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLocality() {
		return locality;
	}

	public void setLocality(String locality) {
		this.locality = locality;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "Hospital [name=" + name + ", address=" + address + ", locality=" + locality + ", type=" + type + "]";
	}
	
	
	
	
	
}
