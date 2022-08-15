package com.cognizant.service;

import java.io.IOException;
import java.io.StringReader;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVRecord;
import org.springframework.stereotype.Service;

import com.cognizant.model.Country;

@Service
public class TestService {

	private static String MonthlyConfirmedURL = "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_monthly_world/confirmed.csv";
	private static String MonthlyDeadURL ="https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_monthly_world/dead.csv";
	private static String MonthlyRecoveredURL="https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_monthly_world/recovered.csv";
	
	private static String CONFIRMED_DATA_URL ="https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv";
	private static String DEATH_DATA_URL = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv";
    private static String RECOVERED_DATA_URL = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_recovered_global.csv";
	
   
	
	//serving for month wise total data 	
	public Object[] monthlyWorldData() throws IOException, InterruptedException
	{
		HttpClient client = HttpClient.newHttpClient();
		 
		//Confirmed start
		
		HttpRequest conrequest = HttpRequest.newBuilder()
	        		.uri(URI.create(MonthlyConfirmedURL))
	        		.build();
		 HttpResponse<String> httpResponse = client.send(conrequest, HttpResponse.BodyHandlers.ofString());
		 StringReader conCsvBodyReaer = new StringReader(httpResponse.body());
		 Iterable<CSVRecord> conrecords = CSVFormat.EXCEL.withFirstRecordAsHeader().parse(conCsvBodyReaer);
		
		 
		 Integer total[] =new Integer[6];
		 
		 for(int i=0;i<6;i++)
		 {
			 total[i]=0;
		 }
		 
		 
		 for(CSVRecord record : conrecords)
		 { 
			 total[0] = total[0]+Integer.parseInt(record.get(1));
			 total[1]= total[1]+Integer.parseInt(record.get(2));
			 total[2] = total[2]+Integer.parseInt(record.get(3));
			 total[3]= total[3]+Integer.parseInt(record.get(4));
			 total[4] = total[4]+Integer.parseInt(record.get(5));
			 total[5] = total[5]+Integer.parseInt(record.get(6));
		 }
		
		
		 
		 Map<String,Integer>confirmed = new LinkedHashMap<String,Integer>();
		 String mon[] = {"Jan","Feb","Mar","Apr","May","Jun"};
		 
		
		 
		 
		 for(int i=0;i<mon.length;i++)
		 {
			 confirmed.put(mon[i], total[i]);
		 }
		//Confirmed End
		
		//Recovered Start
		
		HttpRequest recrequest = HttpRequest.newBuilder()
        		.uri(URI.create(MonthlyRecoveredURL))
        		.build();
	 HttpResponse<String> httprecResponse = client.send(recrequest, HttpResponse.BodyHandlers.ofString());
	 StringReader recCsvBodyReaer = new StringReader(httprecResponse.body());
	 Iterable<CSVRecord> recrecords = CSVFormat.EXCEL.withFirstRecordAsHeader().parse(recCsvBodyReaer);
	 
	 for(int i=0;i<6;i++)
	 {
		 total[i]=0;
	 }
	 for(CSVRecord record : recrecords)
	 { 
		 total[0] = total[0]+Integer.parseInt(record.get(1));
		 total[1]= total[1]+Integer.parseInt(record.get(2));
		 total[2] = total[2]+Integer.parseInt(record.get(3));
		 total[3]= total[3]+Integer.parseInt(record.get(4));
		 total[4] = total[4]+Integer.parseInt(record.get(5));
		 total[5] = total[5]+Integer.parseInt(record.get(6));
	 }
	
	 Map<String,Integer>recovered = new LinkedHashMap<String,Integer>();
	 
	 for(int i=0;i<mon.length;i++)
	 {
		 recovered.put(mon[i], total[i]);
	 }
	 
	 //Recovered End
	 
	 //Dead Start
	 HttpRequest deadrequest = HttpRequest.newBuilder()
     		.uri(URI.create(MonthlyDeadURL))
     		.build();
	 HttpResponse<String> httpdeadResponse = client.send(deadrequest, HttpResponse.BodyHandlers.ofString());
	 StringReader deadCsvBodyReaer = new StringReader(httpdeadResponse.body());
	 Iterable<CSVRecord> deadrecords = CSVFormat.EXCEL.withFirstRecordAsHeader().parse(deadCsvBodyReaer);
	 
	 for(int i=0;i<6;i++)
	 {
		 total[i]=0;
	 }
	 for(CSVRecord record : deadrecords)
	 { 
		 total[0] = total[0]+Integer.parseInt(record.get(1));
		 total[1]= total[1]+Integer.parseInt(record.get(2));
		 total[2] = total[2]+Integer.parseInt(record.get(3));
		 total[3]= total[3]+Integer.parseInt(record.get(4));
		 total[4] = total[4]+Integer.parseInt(record.get(5));
		 total[5] = total[5]+Integer.parseInt(record.get(6));
	 }
	
	 Map<String,Integer>dead = new LinkedHashMap<String,Integer>();
	 
	 for(int i=0;i<mon.length;i++)
	 {
		 dead.put(mon[i], total[i]);
	 }
	
	 //Dead End
	 
	 Object ar[] = new Object[3];
	 
	 ar[0] = dead;
	 ar[1] = recovered;
	 ar[2] = confirmed;
	 
	 
	return ar;
	}
	
	
	
	
	
	
	//Country Data
	
	
	
	public Object[] countryAll() throws IOException, InterruptedException
	{
		Map<String,Integer> confirmed = new HashMap<String,Integer>();
		Map<String,Integer> dead = new HashMap<String,Integer>();
		Map<String,Integer> recovered = new HashMap<String,Integer>();
		
		List<Country> list = new LinkedList<Country>();
    	
            
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
       
        Integer confirmedArray[] = new Integer[30];
        Integer deadArray[] = new Integer[30];
        Integer recoveredArray[] = new Integer[30];
        for(int i=0;i<30;i++)
        {
     	   confirmedArray[i]=0;
     	   deadArray[i]=0;
     	   recoveredArray[i]=0;
        }
        
        
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
            for(int j =0;j<30;j++)
            {
            	confirmedArray[j] += Integer.parseInt(record.get(record.size()-30+j));
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
            for(int j =0;j<30;j++)
            {
            	deadArray[j] += Integer.parseInt(record.get(record.size()-30+j));
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
            for(int j =0;j<30;j++)
            {
            	recoveredArray[j] += Integer.parseInt(record.get(record.size()-30+j));
            }  
            
        }
        
        TreeMap<String,Integer> rm = new TreeMap<String,Integer>(recovered);
        
 
    
        
        Integer total_con =0;
        Integer total_dead =0;
        Integer total_rec =0;
        
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
         
     // list.sort((Country c1, Country c2 )->c1.getConfirmed()-c2.getConfirmed());
      
     /* for(Country c : list)
      {
    	  System.out.println(c);
      }*/
        
   
       
      Object worldData[] = new Object[10];
      worldData[0] = list;
      worldData[1] = total_con;
      worldData[2] = total_dead;
      worldData[3] = total_rec;
      worldData[4] = confirmedArray;
      worldData[5] = deadArray;
      worldData[6] =recoveredArray;
      worldData[7]= tm;
      worldData[8] = dm;
      worldData[9] =rm;
      return worldData;
      
	}
	
	public List<Country> getPiDetails(List<Country> li)
	{
		List<Country>list = new LinkedList<Country>(li);
		
		list.sort((Country c1, Country c2 )->c1.getConfirmed()-c2.getConfirmed());
		
		List<Country> newList = new LinkedList<Country>();
		
		int j=list.size()-1;
		for(int i=j;i>j-8;i--)
		{
			Country c = list.get(i);
			newList.add(c);
			
		}
		Integer con = 0;
		Integer ded = 0;
		Integer rec = 0;
		
		for(int i=j-8;i>=0;i--)
		{
			Country c = list.get(i);
			if(c.getName().contentEquals("India"))
			{
				newList.add(c);
			}
			else
			{
				con=con+c.getConfirmed();
				ded=ded+c.getDead();
				rec=rec+c.getRecovered();
			}
			
		}
		Country co = new Country("Others",con,ded,rec);
		newList.add(co);
		return newList;
	}
	
}
