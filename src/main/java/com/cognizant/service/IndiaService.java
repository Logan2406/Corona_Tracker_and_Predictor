 package com.cognizant.service;

import java.io.IOException;
import java.io.StringReader;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVRecord;
import org.springframework.stereotype.Service;

import com.cognizant.model.State;

@Service
public class IndiaService {
	
	private String ConfirmedURL="https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/india_state_confirmed.csv";
	private String DeadURL="https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/india_state_dead.csv";
	private String RecoveredURL="https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/india_state_recovered.csv";

	
	public Object[] returnData() throws IOException, InterruptedException
	{
		
		
		Integer monthlyconf[] = new Integer[30];
		Integer monthlydead[] = new Integer[30];
		Integer monthlyreco[] = new Integer[30];
		
		for(int i =0;i<30;i++)
		{
			monthlyconf[i]=0;
			monthlydead[i]=0;
			monthlyreco[i]=0;
		}
		
		Map<String,State> states = new LinkedHashMap<String,State>();
		Integer details[] = new Integer[3];
		
		HttpClient client = HttpClient.newHttpClient();
		
		HttpRequest conrequest = HttpRequest.newBuilder()
        		.uri(URI.create(ConfirmedURL))
        		.build();
		HttpResponse<String> httpResponse = client.send(conrequest, HttpResponse.BodyHandlers.ofString());
		StringReader conCsvBodyReaer = new StringReader(httpResponse.body());
		
		Iterable<CSVRecord> conrecords = CSVFormat.EXCEL.withFirstRecordAsHeader().parse(conCsvBodyReaer);
		
		int temp=0;
		for(CSVRecord record :conrecords)
		{
			
			State s = new State();
			s.setName(record.get("State"));
			s.setConfirmed(Integer.parseInt(record.get(record.size()-1)));
			states.put(record.get("State"),s);
			temp=temp+s.getConfirmed();
			for(int j=0;j<30;j++)
			{
				monthlyconf[j]=monthlyconf[j]+Integer.parseInt(record.get(record.size()-30+j));
			}
			
		}
		details[0] = temp;
		
		
		HttpRequest deadrequest = HttpRequest.newBuilder()
        		.uri(URI.create(DeadURL))
        		.build();
		HttpResponse<String> httpdeadResponse = client.send(deadrequest, HttpResponse.BodyHandlers.ofString());
		StringReader deadCsvBodyReaer = new StringReader(httpdeadResponse.body());
		Iterable<CSVRecord> deadrecords = CSVFormat.EXCEL.withFirstRecordAsHeader().parse(deadCsvBodyReaer);
		
		temp=0;
		for(CSVRecord record :deadrecords)
		{
			State s = states.get(record.get("State"));
			s.setDead(Integer.parseInt(record.get(record.size()-1)));
			states.put(record.get("State"),s);
			temp= temp+s.getDead();
			for(int j=0;j<30;j++)
			{
				monthlydead[j]=monthlydead[j]+Integer.parseInt(record.get(record.size()-30+j));
			}
		}
		details[1]=temp;
		
		HttpRequest recoveredrequest = HttpRequest.newBuilder()
        		.uri(URI.create(RecoveredURL))
        		.build();
		HttpResponse<String> httprecoveredResponse = client.send(recoveredrequest, HttpResponse.BodyHandlers.ofString());
		StringReader recoveredCsvBodyReaer = new StringReader(httprecoveredResponse.body());
		Iterable<CSVRecord> recoveredrecords = CSVFormat.EXCEL.withFirstRecordAsHeader().parse(recoveredCsvBodyReaer);
		
		temp=0;
		for(CSVRecord record :recoveredrecords)
		{
			State s = states.get(record.get("State"));
			s.setRecovered(Integer.parseInt(record.get(record.size()-1)));
			states.put(record.get("State"),s);
			temp=temp+s.getRecovered();
			for(int j=0;j<30;j++)
			{
				monthlyreco[j]=monthlyreco[j]+Integer.parseInt(record.get(record.size()-30+j));
			}
		}
		
		details[2]=temp;
		
		Object ob[] = new Object[5];
		ob[0]=states;
		ob[1]=details;
		ob[2]=monthlyconf;
		ob[3]=monthlydead;
		ob[4]=monthlyreco;
		return ob;
	}
	
	
	public Object[] sortState(Map<String,State> states)
	{
		
		List<State> templist = new LinkedList<>();
		List<State> conflist = new LinkedList<>(); 
		List<State> deadlist = new LinkedList<>(); 
		List<State> recolist = new LinkedList<>(); 
		
		for(Map.Entry<String, State> entry :states.entrySet())
		{
			conflist.add(entry.getValue());
			deadlist.add(entry.getValue());
			recolist.add(entry.getValue());
		}
		
		Collections.sort(conflist,(a,b)-> a.getConfirmed()-b.getConfirmed());
		
		Collections.sort(deadlist,(a,b)-> a.getDead()-b.getDead());
		
		Collections.sort(recolist,(a,b)-> a.getRecovered()-b.getRecovered());
		
		
		Object ob[] = new Object[3];
		ob[0]=conflist;
		ob[1]=deadlist;
		ob[2]=recolist;
		
		
		
		/*for(State s:conflist)
		{
			System.out.println(s.getName()+" "+s.getConfirmed());
		}
		
		System.out.println("---------------------------");
		for(State s:deadlist)
		{
			System.out.println(s.getName()+" "+s.getDead());
		}
		System.out.println("---------------------------");
		for(State s:recolist)
		{
			System.out.println(s.getName()+" "+s.getRecovered());
		}
		*/
		return ob;
	}
	
	
	
}
