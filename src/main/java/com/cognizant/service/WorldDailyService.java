package com.cognizant.service;

import java.io.IOException;
import java.io.StringReader;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVRecord;
import org.springframework.stereotype.Service;

@Service
public class WorldDailyService {

	private static String CONFIRMED_DATA_URL ="https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv";
	private static String DEATH_DATA_URL = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv";
    private static String RECOVERED_DATA_URL = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_recovered_global.csv";
	
    
    public Object[] worldData() throws IOException, InterruptedException
	{
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
        
        List<Integer> conlist =new ArrayList<Integer>();
        
        int x[] = new int[3];
        
        int flag=0;
        
        Iterable<CSVRecord> conrecords = CSVFormat.DEFAULT.withFirstRecordAsHeader().parse(conCsvBodyReaer);
        for (CSVRecord record : conrecords) 
        {	
       	 
           int i=14;	
            	if(flag==0)
            	{
            		x[0]= Integer.parseInt(record.get(13));
            		while(i < record.size())
            		{
            			conlist.add(Integer.parseInt(record.get(i)));
            			i++;
            		}
            		
            	flag=1;
            	}
            	
           else if(flag==1)
            {
           	 x[0] = x[0] + Integer.parseInt(record.get(13));
        
           	 int q=0;
           	 while(q<conlist.size())
           	 {
           		 conlist.set(q,conlist.get(q)+Integer.parseInt(record.get(q+14)));
           		 q++;
           	 }
           
            }
         
        }
        
        flag=0;
       
        StringReader deadCsvBodyReaer = new StringReader(httpdeadResponse.body());
        
        List<Integer> deadlist =new ArrayList<Integer>();
        
        Iterable<CSVRecord> deadrecords = CSVFormat.DEFAULT.withFirstRecordAsHeader().parse(deadCsvBodyReaer);

        for (CSVRecord record : deadrecords) 
        {	
           int i=14;

            	if(flag==0)
            	{
            		x[1]= Integer.parseInt(record.get(13));
            		while(i < record.size())
            		{
            			deadlist.add(Integer.parseInt(record.get(i)));
            			i++;
            		}
            		flag=1;
            	}
            	
            	 else if(flag==1)
                {
               	 x[1] = x[1] + Integer.parseInt(record.get(13));
            
               	 int q=0;
               	 while(q<conlist.size())
               	 {
               		 deadlist.set(q,deadlist.get(q)+Integer.parseInt(record.get(q+14)));
               		 q++;
               	 }
           
                }
           	
        }
     
        flag=0;
        
        
        StringReader recCsvBodyReaer = new StringReader(httprecResponse.body());
        
        List<Integer> reclist =new ArrayList<Integer>();
        
        
        Iterable<CSVRecord> recrecords = CSVFormat.DEFAULT.withFirstRecordAsHeader().parse(recCsvBodyReaer);
       
        for (CSVRecord record : recrecords) 
        {	
           int i=14;

            	if(flag==0)
            	{
            		x[2]= Integer.parseInt(record.get(13));
            		while(i < record.size())
            		{
            			reclist.add(Integer.parseInt(record.get(i)));
            			i++;
            		}
            		flag=1;
            	}
            	else if(flag==1)
               {
              	 x[2] = x[2] + Integer.parseInt(record.get(13));
           
              	 int q=0;
              	 while(q<conlist.size())
              	 {
              		 reclist.set(q,reclist.get(q)+Integer.parseInt(record.get(q+14)));
              		 q++;
              	 }
          
               }

          
        }
        
        
        
        List<Integer>dailyConList = new ArrayList<Integer>();
        List<Integer>dailyDeadlist = new ArrayList<Integer>();
        List<Integer>dailyRecList = new ArrayList<Integer>();
        
        int j=0;
        int k=j+1;
        
       while(k<conlist.size())
       {
       	dailyConList.add(conlist.get(k) - conlist.get(j));
       	dailyDeadlist.add(deadlist.get(k) - deadlist.get(j));
       	dailyRecList.add(reclist.get(k) - reclist.get(j));
       	
       	j++;
       	k=j+1;
       }
        
       dailyConList.add(0, conlist.get(0)-x[0]);
       dailyDeadlist.add(0, deadlist.get(0)-x[1]);
       dailyRecList.add(0, reclist.get(0)-x[2]);
		
		Object ob[] = new Object[6];
		ob[0]=conlist;
		ob[1]=deadlist;
		ob[2]=reclist;
		ob[3]=dailyConList;
		ob[4]=dailyDeadlist;
		ob[5]=dailyRecList;
		return ob;
		
	}
    
    
    
    
    
    public Object[] countryData(String name) throws IOException, InterruptedException
    {
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
        
        List<Integer> conlist =new ArrayList<Integer>();
        
        int x[] = new int[3];
        
        int flag=0;
        
        Iterable<CSVRecord> conrecords = CSVFormat.DEFAULT.withFirstRecordAsHeader().parse(conCsvBodyReaer);
        for (CSVRecord record : conrecords) 
        {	
       	 
           String coun = record.get("Country/Region");
            
            if(coun.contentEquals(name))
            { int i=14;
            	
            	
            	if(flag==0)
            	{
            	
            		x[0]= Integer.parseInt(record.get(13));
            		while(i < record.size())
            		{
            			conlist.add(Integer.parseInt(record.get(i)));
            			i++;
            		}
            		
            	flag=1;
            	}
            	
           else if(flag==1)
            {
           	 x[0] = x[0] + Integer.parseInt(record.get(13));
        
           	 int q=0;
           	 while(q<conlist.size())
           	 {
           		 conlist.set(q,conlist.get(q)+Integer.parseInt(record.get(q+14)));
           		 q++;
           	 }
           
            }
            	
         
            }
          
        }
        
        flag=0;
       
        StringReader deadCsvBodyReaer = new StringReader(httpdeadResponse.body());
        
        List<Integer> deadlist =new ArrayList<Integer>();
        
        Iterable<CSVRecord> deadrecords = CSVFormat.DEFAULT.withFirstRecordAsHeader().parse(deadCsvBodyReaer);

        for (CSVRecord record : deadrecords) 
        {	
           String coun = record.get("Country/Region");
            
            if(coun.contentEquals(name))
            { int i=14;
        
            	

            	
            	if(flag==0)
            	{
            		x[1]= Integer.parseInt(record.get(13));
            		while(i < record.size())
            		{
            			deadlist.add(Integer.parseInt(record.get(i)));
            			i++;
            		}
            		flag=1;
            	}
            	
            	 else if(flag==1)
                {
               	 x[1] = x[1] + Integer.parseInt(record.get(13));
            
               	 int q=0;
               	 while(q<conlist.size())
               	 {
               		 deadlist.set(q,deadlist.get(q)+Integer.parseInt(record.get(q+14)));
               		 q++;
               	 }
           
                }
           	 
            }
          
        }
     
        flag=0;
        
        
        StringReader recCsvBodyReaer = new StringReader(httprecResponse.body());
        
        List<Integer> reclist =new ArrayList<Integer>();
        
        
        Iterable<CSVRecord> recrecords = CSVFormat.DEFAULT.withFirstRecordAsHeader().parse(recCsvBodyReaer);
        String country = null;
        for (CSVRecord record : recrecords) 
        {	
           String coun = record.get("Country/Region");
            
            if(coun.contentEquals(name))
            { int i=14;

            	if(flag==0)
            	{
            		x[2]= Integer.parseInt(record.get(13));
            		while(i < record.size())
            		{
            			reclist.add(Integer.parseInt(record.get(i)));
            			i++;
            		}
            		flag=1;
            	}
            	else if(flag==1)
               {
              	 x[2] = x[2] + Integer.parseInt(record.get(13));
           
              	 int q=0;
              	 while(q<conlist.size())
              	 {
              		 reclist.set(q,reclist.get(q)+Integer.parseInt(record.get(q+14)));
              		 q++;
              	 }
          
               }
            }
          
        }
        
        
        
        List<Integer>dailyConList = new ArrayList<Integer>();
        List<Integer>dailyDeadlist = new ArrayList<Integer>();
        List<Integer>dailyRecList = new ArrayList<Integer>();
        
        int j=0;
        int k=j+1;
        
       while(k<conlist.size())
       {
       	dailyConList.add(conlist.get(k) - conlist.get(j));
       	dailyDeadlist.add(deadlist.get(k) - deadlist.get(j));
       	dailyRecList.add(reclist.get(k) - reclist.get(j));
       	
       	j++;
       	k=j+1;
       }
        
       dailyConList.add(0, conlist.get(0)-x[0]);
       dailyDeadlist.add(0, deadlist.get(0)-x[1]);
       dailyRecList.add(0, reclist.get(0)-x[2]);
       
       Object ob[] = new Object[6];
		ob[0]=conlist;
		ob[1]=deadlist;
		ob[2]=reclist;
		ob[3]=dailyConList;
		ob[4]=dailyDeadlist;
		ob[5]=dailyRecList;
		
		return ob;
    }
    
    
    
}
