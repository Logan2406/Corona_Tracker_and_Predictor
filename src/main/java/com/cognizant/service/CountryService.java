package com.cognizant.service;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.StringReader;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Properties;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVRecord;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Service;

@Service
public class CountryService {
	private static String MonthlyConfirmedURL = "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_monthly_world/confirmed.csv";
	private static String MonthlyDeadURL ="https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_monthly_world/dead.csv";
	private static String MonthlyRecoveredURL="https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_monthly_world/recovered.csv";

	private static String CONFIRMED_DATA_URL ="https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv";
	private static String DEATH_DATA_URL = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv";
    private static String RECOVERED_DATA_URL = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_recovered_global.csv";
	
    private static String JSON_URL ="https://restcountries.eu/rest/v2/alpha/";
	
	
	public String getCode(String name) throws IOException
	{
		
		Properties prop = new Properties();
		
		FileInputStream ip= new FileInputStream("C:\\Users\\jyoti\\Documents\\workspace-spring-tool-suite-4-4.6.0.RELEASE\\testing\\src\\main\\webapp\\countrycode.properties");
		
		prop.load(ip);
		
		String code = prop.getProperty(name);
		
		return code;
	}
	
	public Object[] monthlyReport(String name) throws IOException, InterruptedException
	{
		HttpClient client = HttpClient.newHttpClient();
		
		
		
		//confirmed
		HttpRequest conrequest = HttpRequest.newBuilder()
        		.uri(URI.create(MonthlyConfirmedURL))
        		.build();
		
		 HttpResponse<String> httpResponse = client.send(conrequest, HttpResponse.BodyHandlers.ofString());
		 StringReader conCsvBodyReaer = new StringReader(httpResponse.body());
		 Iterable<CSVRecord> conrecords = CSVFormat.EXCEL.withFirstRecordAsHeader().parse(conCsvBodyReaer);
		 
		 String mon[] = {"Jan","Feb","Mar","Apr","May","Jun"};
		 
		 Integer count[] =new Integer[6];
		 for(int i=0;i<6;i++)
		 {
			 count[i]=0;
		 }
		 
		 for(CSVRecord record : conrecords)
		 { 
			 if(record.get(0).contentEquals(name))
			 {
				 count[0]=Integer.parseInt(record.get(1));
				 count[1]=Integer.parseInt(record.get(2));
				 count[2]=Integer.parseInt(record.get(3));
				 count[3]=Integer.parseInt(record.get(4));
				 count[4]=Integer.parseInt(record.get(5));
				 count[5]=Integer.parseInt(record.get(6));
			 }
		 }
		 
		 Map<String,Integer>confirmed = new LinkedHashMap<String,Integer>();
		 for(int i=0;i<mon.length;i++)
		 {
			 confirmed.put(mon[i], count[i]);
		 }
		 
		
		 //recovered
		 HttpRequest recrequest = HttpRequest.newBuilder()
	        		.uri(URI.create(MonthlyRecoveredURL))
	        		.build();
		 HttpResponse<String> httprecResponse = client.send(recrequest, HttpResponse.BodyHandlers.ofString());
		 StringReader recCsvBodyReaer = new StringReader(httprecResponse.body());
		 Iterable<CSVRecord> recrecords = CSVFormat.EXCEL.withFirstRecordAsHeader().parse(recCsvBodyReaer);
		 
		 for(int i=0;i<6;i++)
		 {
			 count[i]=0;
		 }
		 
		 for(CSVRecord record : recrecords)
		 { 
			 if(record.get(0).contentEquals(name))
			 {
				 count[0]=Integer.parseInt(record.get(1));
				 count[1]=Integer.parseInt(record.get(2));
				 count[2]=Integer.parseInt(record.get(3));
				 count[3]=Integer.parseInt(record.get(4));
				 count[4]=Integer.parseInt(record.get(5));
				 count[5]=Integer.parseInt(record.get(6));
			 }
		 }
		 
		 Map<String,Integer>recovered = new LinkedHashMap<String,Integer>();
		 for(int i=0;i<mon.length;i++)
		 {
			 recovered.put(mon[i], count[i]);
		 }
		 
		 //dead
		 HttpRequest deadrequest = HttpRequest.newBuilder()
		     		.uri(URI.create(MonthlyDeadURL))
		     		.build();
			 HttpResponse<String> httpdeadResponse = client.send(deadrequest, HttpResponse.BodyHandlers.ofString());
			 StringReader deadCsvBodyReaer = new StringReader(httpdeadResponse.body());
			 Iterable<CSVRecord> deadrecords = CSVFormat.EXCEL.withFirstRecordAsHeader().parse(deadCsvBodyReaer);
		 
		for(int i=0;i<6;i++)
		{
			count[i]=0;
		 }
	
	
		
		for(CSVRecord record : deadrecords)
		 { 
			 if(record.get(0).contentEquals(name))
			 {
				 count[0]=Integer.parseInt(record.get(1));
				 count[1]=Integer.parseInt(record.get(2));
				 count[2]=Integer.parseInt(record.get(3));
				 count[3]=Integer.parseInt(record.get(4));
				 count[4]=Integer.parseInt(record.get(5));
				 count[5]=Integer.parseInt(record.get(6));
			 }
		 }
	
		 Map<String,Integer>dead = new LinkedHashMap<String,Integer>();
		 for(int i=0;i<mon.length;i++)
		 {
			 dead.put(mon[i], count[i]);
		 }
	
		 Object ar[] = new Object[3];
		 ar[0]=confirmed;
		 ar[1]=dead;
		 ar[2]=recovered;
	
	
		 return ar;
	}
	
	public Object[] lastThirtyDays(String name) throws IOException, InterruptedException
	{
		 
		
		
		
		 Integer confirmedArray[] = new Integer[30];
	     Integer deadArray[] = new Integer[30];
	     Integer recoveredArray[] = new Integer[30];
	     
	     
	     for(int i=0;i<30;i++)
	        {
	     	   confirmedArray[i]=0;
	     	   deadArray[i]=0;
	     	   recoveredArray[i]=0;
	        }
	     
	     
	     
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
	            
	            if(country.contentEquals(name))
	            {
	            	
	            	for(int j =0;j<30;j++)
	                {
	                	confirmedArray[j] += Integer.parseInt(record.get(record.size()-30+j));
	                }   
	            	
	            		
	            	}
	          }
	        
	        StringReader deadCsvBodyReaer = new StringReader(httpdeadResponse.body());
	        
	        Iterable<CSVRecord> deadrecords = CSVFormat.DEFAULT.withFirstRecordAsHeader().parse(deadCsvBodyReaer);
	        
	        for (CSVRecord record : deadrecords) 
	        {	
	        	String country = record.get("Country/Region");
	        	if(country.contentEquals(name))
	            {
	            	
	            	for(int j =0;j<30;j++)
	                {
	            		deadArray[j] += Integer.parseInt(record.get(record.size()-30+j));
	                }   
	            	
	            		
	            }
	            
	            
	        }
	        
	        StringReader recCsvBodyReaer = new StringReader(httprecResponse.body());
	        Iterable<CSVRecord> recrecords = CSVFormat.DEFAULT.withFirstRecordAsHeader().parse(recCsvBodyReaer);
	        for (CSVRecord record : recrecords) 
	        {	
	        	String country = record.get("Country/Region");
	        	if(country.contentEquals(name))
	            {
	            	
	            	for(int j =0;j<30;j++)
	                {
	            		recoveredArray[j] += Integer.parseInt(record.get(record.size()-30+j));
	                }   
	            	
	            		
	            }
	            
	        }
	            
	        
	       Object thirty[] = new Object[3];
	       thirty[0]= confirmedArray;
	       thirty[1]= deadArray;
	       thirty[2]=recoveredArray;
	       
	       return thirty;
	     
		
	}
	
	public Object[]  getData(String name) throws IOException 
	{
		Properties prop = new Properties();
		
		FileInputStream ip= new FileInputStream("C:\\Users\\jyoti\\Documents\\workspace-spring-tool-suite-4-4.6.0.RELEASE\\testing\\src\\main\\webapp\\countrydata.properties");
		
		prop.load(ip);
		
		String data = prop.getProperty(name);
		
		String arr[] = data.split(",");
		
		Long popu = Long.parseLong(arr[0]);
		Long area = Long.parseLong(arr[1]);
		String capital= arr[2];
		
		
		Object[] object = new Object[3];
		
		object[0]=popu;
		object[1]=area;
		object[2]=capital;
		return object;
		  
	}
	
	
	
	
}	
