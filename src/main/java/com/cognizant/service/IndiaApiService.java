package com.cognizant.service;

import java.io.IOException;
import java.io.StringReader;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.LinkedHashMap;
import java.util.Map;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVRecord;
import org.springframework.stereotype.Service;

import com.cognizant.model.State;

@Service
public class IndiaApiService {
	
	private String ConfirmedURL="https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/india_state_confirmed.csv";
	private String DeadURL="https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/india_state_dead.csv";
	private String RecoveredURL="https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/india_state_recovered.csv";
	
	
	private Integer total_conf=0;
	private Integer total_dead=0;
	private Integer total_reco=0;
	
	private Map<String,State> states = new LinkedHashMap<String,State>();
	
	public IndiaApiService() throws IOException, InterruptedException
	{
		HttpClient client = HttpClient.newHttpClient();
		
		HttpRequest conrequest = HttpRequest.newBuilder()
        		.uri(URI.create(ConfirmedURL))
        		.build();
		HttpResponse<String> httpResponse = client.send(conrequest, HttpResponse.BodyHandlers.ofString());
		StringReader conCsvBodyReaer = new StringReader(httpResponse.body());
		
		Iterable<CSVRecord> conrecords = CSVFormat.EXCEL.withFirstRecordAsHeader().parse(conCsvBodyReaer);
		
		for(CSVRecord record :conrecords)
		{
			
			State s = new State();
			s.setName(record.get("State"));
			s.setConfirmed(Integer.parseInt(record.get(record.size()-1)));
			states.put(record.get("State"),s);
			
		}
		
		
		HttpRequest deadrequest = HttpRequest.newBuilder()
        		.uri(URI.create(DeadURL))
        		.build();
		HttpResponse<String> httpdeadResponse = client.send(deadrequest, HttpResponse.BodyHandlers.ofString());
		StringReader deadCsvBodyReaer = new StringReader(httpdeadResponse.body());
		Iterable<CSVRecord> deadrecords = CSVFormat.EXCEL.withFirstRecordAsHeader().parse(deadCsvBodyReaer);
		
		for(CSVRecord record :deadrecords)
		{
			State s = states.get(record.get("State"));
			s.setDead(Integer.parseInt(record.get(record.size()-1)));
			states.put(record.get("State"),s);
		}
		
		HttpRequest recoveredrequest = HttpRequest.newBuilder()
        		.uri(URI.create(RecoveredURL))
        		.build();
		HttpResponse<String> httprecoveredResponse = client.send(recoveredrequest, HttpResponse.BodyHandlers.ofString());
		StringReader recoveredCsvBodyReaer = new StringReader(httprecoveredResponse.body());
		Iterable<CSVRecord> recoveredrecords = CSVFormat.EXCEL.withFirstRecordAsHeader().parse(recoveredCsvBodyReaer);
		
		for(CSVRecord record :recoveredrecords)
		{
			State s = states.get(record.get("State"));
			s.setRecovered(Integer.parseInt(record.get(record.size()-1)));
			states.put(record.get("State"),s);
			
		}
		for(Map.Entry<String, State> entry :states.entrySet())
		{
			total_conf = total_conf + entry.getValue().getConfirmed();
			total_dead = total_dead + entry.getValue().getDead();
			total_reco = total_reco + entry.getValue().getRecovered();
		}
	}
	
	public Object[] getIndiaData()
	{
		Object[] ob = {total_conf,total_dead,total_reco};
		
		return ob;
	}
	
	public Map<String,State> getAllStates()
	{
		return states;
	}
	
	public State getStateData(String name)
	{
		State s = null;
		s = states.get(name);
		return s;
	}
	
	

}
