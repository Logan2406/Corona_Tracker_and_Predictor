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
public class IndiaDailyService {

	private String ConfirmedURL="https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/india_state_confirmed.csv";
	private String DeadURL="https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/india_state_dead.csv";
	private String RecoveredURL="https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/india_state_recovered.csv";
	
	public Object[] moreState(String name) throws IOException, InterruptedException
	{
		List<Integer> conflist = new ArrayList<Integer>();
		List<Integer> deadlist = new ArrayList<Integer>();
		List<Integer> recolist = new ArrayList<Integer>();
		
		HttpClient client = HttpClient.newHttpClient();
		
		HttpRequest conrequest = HttpRequest.newBuilder()
        		.uri(URI.create(ConfirmedURL))
        		.build();
		HttpResponse<String> httpResponse = client.send(conrequest, HttpResponse.BodyHandlers.ofString());
		StringReader conCsvBodyReaer = new StringReader(httpResponse.body());
		
		Iterable<CSVRecord> conrecords = CSVFormat.EXCEL.withFirstRecordAsHeader().parse(conCsvBodyReaer);
		
		
		for(CSVRecord record :conrecords)
		{
			if(name.contentEquals(record.get("State")))
			{
				for(int i=3;i<record.size();i++)
				{
					conflist.add(Integer.parseInt(record.get(i)));
				}
				
			}
		
		}
		
		
		HttpRequest deadrequest = HttpRequest.newBuilder()
        		.uri(URI.create(DeadURL))
        		.build();
		HttpResponse<String> httpdeadResponse = client.send(deadrequest, HttpResponse.BodyHandlers.ofString());
		StringReader deadCsvBodyReaer = new StringReader(httpdeadResponse.body());
		
		Iterable<CSVRecord> deadrecords = CSVFormat.EXCEL.withFirstRecordAsHeader().parse(deadCsvBodyReaer);
	
		for(CSVRecord record :deadrecords)
		{
			if(name.contentEquals(record.get("State")))
			{
				for(int i=3;i<record.size();i++)
				{
					deadlist.add(Integer.parseInt(record.get(i)));
				}
				
			}
		
		}
		
		HttpRequest recorequest = HttpRequest.newBuilder()
        		.uri(URI.create(RecoveredURL))
        		.build();
		HttpResponse<String> httprecoResponse = client.send(recorequest, HttpResponse.BodyHandlers.ofString());
		StringReader recoCsvBodyReaer = new StringReader(httprecoResponse.body());
		
		Iterable<CSVRecord> recorecords = CSVFormat.EXCEL.withFirstRecordAsHeader().parse(recoCsvBodyReaer);
	
		for(CSVRecord record :recorecords)
		{
			if(name.contentEquals(record.get("State")))
			{
				for(int i=3;i<record.size();i++)
				{
					recolist.add(Integer.parseInt(record.get(i)));
				}
				
			}
		
		}
		
		
		List<Integer>dailyConList = new ArrayList<Integer>();
        List<Integer>dailyDeadlist = new ArrayList<Integer>();
        List<Integer>dailyRecList = new ArrayList<Integer>();
		
        int j=0;
        int k=j+1;
        
        while(k<conflist.size())
        {
        	dailyConList.add(conflist.get(k) - conflist.get(j));
        	dailyDeadlist.add(deadlist.get(k) - deadlist.get(j));
        	dailyRecList.add(recolist.get(k) - recolist.get(j));
        	
        	j++;
        	k=j+1;
        }
		
        dailyConList.add(0, conflist.get(0)-conflist.get(0));
        dailyDeadlist.add(0, deadlist.get(0)-deadlist.get(0));
        dailyRecList.add(0, recolist.get(0)-recolist.get(0));
	
        Object ob[] = new Object[6];
		ob[0]=conflist;
		ob[1]=deadlist;
		ob[2]=recolist;
		ob[3]=dailyConList;
		ob[4]=dailyDeadlist;
		ob[5]=dailyRecList;
		
		return ob;
	
	}
	
}
