package com.cognizant.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.cognizant.model.Country;
import com.cognizant.model.State;
import com.cognizant.service.IndiaApiService;
import com.cognizant.service.WorldApiService;

@RestController
public class ApiController {
	
	@Autowired
	WorldApiService worldApiService;
	
	@Autowired
	IndiaApiService indiaApiService;

	@GetMapping(value="world")
	public Object[] getWorldData()
	{
		return worldApiService.getWorldData();
	}
	
	@GetMapping(value="countries")
	public List<Country> getAllCountries()
	{
		return worldApiService.getAllCountryData();
	}
	
	@GetMapping(value="country/{name}")
	public Country getCountryData(@PathVariable String name )
	{
		Country c = worldApiService.getCountry(name);
		
		if(c!=null)
		{
			return c;
		}
		return null;
	}
	
	@GetMapping(value="getAllStates")
	public Map<String,State> getAllStates()
	{
		return indiaApiService.getAllStates();
	}
	
	@GetMapping(value="indiaData/{name}")
	public State getStateData(@PathVariable String name)
	{
		return indiaApiService.getStateData(name);
	}
	
	@GetMapping(value="indiaData")
	public Object[] getIndiaData()
	{
		return indiaApiService.getIndiaData();
	}
	
}
