package com.cognizant.service;

import java.io.IOException;
import java.io.StringReader;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVRecord;
import org.springframework.stereotype.Service;

import com.cognizant.model.Country;

@Service
public class WorldApiService {

	private static String CONFIRMED_DATA_URL ="https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv";
	private static String DEATH_DATA_URL = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv";
    private static String RECOVERED_DATA_URL = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_recovered_global.csv";
	
    
    private  List<Country> list = new LinkedList<Country>();
    
    private Integer total_con =0;
    private Integer total_dead =0;
    private Integer total_rec =0;
    
    
    
    public WorldApiService() throws IOException, InterruptedException
	{
    	Map<String,Integer> confirmed = new HashMap<String,Integer>();
		Map<String,Integer> dead = new HashMap<String,Integer>();
		Map<String,Integer> recovered = new HashMap<String,Integer>();
		
            
        HttpClient client = HttpClient.newHttpClient();
        
        HttpRequest conrequest = HttpRequest.newBuilder()
        		.uri(URI.create(CONFIRMED_DATA_URL))
        		.build();
        
        HttpRequest deadrequest = HttpRequest.newBuilder()
        		.uri(URI.create(DEATH_DATA_URL))
        		.build();
        
        HttpRequest recrequest = HttpRequest.newBuilder()
        		.uri(URI.create(RECOVERED_DATA_URL))
        		.build();
        
        
        HttpResponse<String> httpconResponse = client.send(conrequest, HttpResponse.BodyHandlers.ofString());
        
        HttpResponse<String> httpdeadResponse = client.send(deadrequest, HttpResponse.BodyHandlers.ofString());
        
        HttpResponse<String> httprecResponse = client.send(recrequest, HttpResponse.BodyHandlers.ofString());
        
        StringReader conCsvBodyReaer = new StringReader(httpconResponse.body());
        Iterable<CSVRecord> conrecords = CSVFormat.DEFAULT.withFirstRecordAsHeader().parse(conCsvBodyReaer);
        
        for (CSVRecord record : conrecords) 
        {	
            String country = record.get("Country/Region");
            int latest = Integer.parseInt(record.get(record.size()-1));
           
            if(confirmed.containsKey(country))
            {
            	int x = confirmed.get(country);
            	x = x + latest;
            	confirmed.put(country, x);
            }
            else
            {
            	confirmed.put(country, latest);
            }
          
        }
        
        
       TreeMap<String,Integer> tm = new TreeMap<String,Integer>(confirmed);
       
       StringReader deadCsvBodyReaer = new StringReader(httpdeadResponse.body());
       
       Iterable<CSVRecord> deadrecords = CSVFormat.DEFAULT.withFirstRecordAsHeader().parse(deadCsvBodyReaer);
       
       for (CSVRecord record : deadrecords) 
       {	
       	String country = record.get("Country/Region");
           int latest = Integer.parseInt(record.get(record.size()-1));
          
           if(dead.containsKey(country))
           {
           	int x = dead.get(country);
           	x = x + latest;
           	dead.put(country, x);
           }
           else
           {
           	dead.put(country, latest);
           }
      
       }
       TreeMap<String,Integer> dm = new TreeMap<String,Integer>(dead);
       
       StringReader recCsvBodyReaer = new StringReader(httprecResponse.body());
       Iterable<CSVRecord> recrecords = CSVFormat.DEFAULT.withFirstRecordAsHeader().parse(recCsvBodyReaer);
       for (CSVRecord record : recrecords) 
       {	
       	String country = record.get("Country/Region");
           int latest = Integer.parseInt(record.get(record.size()-1));
          
           if(recovered.containsKey(country))
           {
           	int x = recovered.get(country);
           	x = x + latest;
           	recovered.put(country, x);
           }
           else
           {
           	recovered.put(country, latest);
           }
           
       }
       
       TreeMap<String,Integer> rm = new TreeMap<String,Integer>(recovered);
       
       for(String name:rm.keySet())
       {
       	list.add(new Country(name,tm.get(name),dm.get(name),rm.get(name)));
       }
       
       for(Country c:list)
       {
       	total_con += c.getConfirmed();
       	total_dead += c.getDead();
       	total_rec += c.getRecovered();
       	
       }
       
		 
		 
	}
	
    
    public Object[] getWorldData()
    {
    	Object[] ob = {total_con,total_dead,total_rec};
    	return ob;
    }
    
	public List<Country> getAllCountryData()
	{
		return list;
		
	}
	
	
	public Country getCountry(String name)
	{
		Country x = null;
		for(Country c:list)
		{
			if (c.getName().contentEquals(name))
			{
				return c;
			}
		}
		return x;
	}
	
	
	
}
