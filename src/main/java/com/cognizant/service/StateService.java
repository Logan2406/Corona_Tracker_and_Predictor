package com.cognizant.service;

import java.io.IOException;
import java.io.StringReader;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVRecord;
import org.springframework.stereotype.Service;

import com.cognizant.model.Hospital;


@Service
public class StateService {

	Map<String, String> mymap = new HashMap<String, String>() {
		{
			put("Andaman and Nicobar Islands", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/Covid_zone_state/Andaman%26Nicobar.csv");
			put("Andhra Pradesh", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/Covid_zone_state/AndhraPradesh.csv");
			put("Arunachal Pradesh", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/Covid_zone_state/ArunachalPradesh.csv");
			put("Assam", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/Covid_zone_state/Assam.csv");
			put("Bihar", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/Covid_zone_state/Bihar.csv");
			put("Chandigarh", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/Covid_zone_state/Chandigarh.csv");
			put("Chhattisgarh", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/Covid_zone_state/Chhattisgarh.csv");
			put("Delhi", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/Covid_zone_state/Delhi.csv");
			put("Goa", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/Covid_zone_state/Goa.csv");
			put("Gujarat", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/Covid_zone_state/Gujarat.csv");
			put("Haryana", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/Covid_zone_state/Haryana.csv");
			put("Himachal Pradesh", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/Covid_zone_state/Himachal%20Pradesh.csv");
			put("Jammu and Kashmir", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/Covid_zone_state/Jammu%20%26%20Kashmir.csv");
			put("Jharkhand", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/Covid_zone_state/Jharkhand.csv");
			put("Karnataka", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/Covid_zone_state/Karnataka.csv");
			put("Kerala", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/Covid_zone_state/Kerala.csv");
			put("Ladakh", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/Covid_zone_state/Laddakh.csv");
			put("Madhya Pradesh", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/Covid_zone_state/Madhya%20Pradesh.csv");
			put("Maharashtra", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/Covid_zone_state/Maharashtra.csv");
			put("Manipur", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/Covid_zone_state/Manipur.csv");
			put("Meghalaya", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/Covid_zone_state/Meghalaya.csv");
			put("Mizoram", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/Covid_zone_state/Mizoram.csv");
			put("Nagaland","https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/Covid_zone_state/Nagaland.csv");
			put("Odisha", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/Covid_zone_state/Odisha.csv");
			put("Puducherry", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/Covid_zone_state/Puducherry.csv");
			put("Punjab", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/Covid_zone_state/Punjab.csv");
			put("Rajasthan", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/Covid_zone_state/Rajasthan.csv");
			put("Sikkim","https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/Covid_zone_state/Sikkim.csv");
			put("Tamil Nadu", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/Covid_zone_state/Tamil%20Nadu.csv");
			put("Telengana", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/Covid_zone_state/Telengana.csv");
			put("Tripura", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/Covid_zone_state/Tripura.csv");
			put("Uttarakhand", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/Covid_zone_state/Uttarakhand.csv");
			put("Uttar Pradesh", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/Covid_zone_state/Uttar%20Pradesh.csv");
			put("West Bengal", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/Covid_zone_state/West%20Bengal.csv");
			
		}
	};
	
	
	
	Map<String,String> hospmap = new HashMap<String,String>(){
			{
		
				put("Andaman and Nicobar Islands", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/covid_hospital_state/AndamanHosp.csv");
				put("Andhra Pradesh", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/covid_hospital_state/AndhraHosp.csv");
				put("Arunachal Pradesh", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/covid_hospital_state/ArunachalHosp.csv");
				put("Assam", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/covid_hospital_state/AssamHosp.csv");
				put("Bihar", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/covid_hospital_state/BiharHosp.csv");
				put("Chandigarh", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/covid_hospital_state/ChandigarhHosp.csv");
				put("Chhattisgarh", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/covid_hospital_state/ChhatisgarhHosp.csv");
				put("Delhi", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/covid_hospital_state/DelhiHosp.csv");
				put("Goa", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/covid_hospital_state/GoaHosp.csv");
				put("Gujarat", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/covid_hospital_state/GujaratHosp.csv");
				put("Haryana", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/covid_hospital_state/HaryanaHosp.csv");
				put("Himachal Pradesh", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/covid_hospital_state/HimachalHosp.csv");
				put("Jammu and Kashmir", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/covid_hospital_state/JammuHosp.csv");
				put("Jharkhand", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/covid_hospital_state/JhharkhandHosp.csv");
				put("Karnataka", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/covid_hospital_state/KarnatakaHosp.csv");
				put("Kerala", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/covid_hospital_state/KeralaHosp.csv");
				put("Ladakh", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/covid_hospital_state/LadakhHosp.csv");
				put("Madhya Pradesh", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/covid_hospital_state/MadhyaPradeshHosp.csv");
				put("Maharashtra", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/covid_hospital_state/MaharastraHosp.csv");
				put("Manipur", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/covid_hospital_state/ManipurHosp.csv");
				put("Meghalaya", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/covid_hospital_state/MeghalayaHosp.csv");
				put("Mizoram", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/covid_hospital_state/MizoramHosp.csv");
				//put("Nagaland","https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/Covid_zone_state/Nagaland.csv");
				put("Odisha", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/covid_hospital_state/OdishaHosp.csv");
				put("Puducherry", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/covid_hospital_state/PuducherryHosp.csv");
				put("Punjab", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/covid_hospital_state/PunjabHosp.csv");
				put("Rajasthan", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/covid_hospital_state/RajasthanHosp.csv");
				put("Sikkim","https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/covid_hospital_state/SikkimHosp.csv");
				put("Tamil Nadu","https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/covid_hospital_state/TamilnaduHosp.csv");
				put("Telengana", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/covid_hospital_state/TelenganaHosp.csv");
				put("Tripura", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/covid_hospital_state/TripuraHosp.csv");
				put("Uttarakhand", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/covid_hospital_state/UttarakhandHosp.csv");
				put("Uttar Pradesh", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/covid_hospital_state/UttarPradeshHosp.csv");
				put("West Bengal", "https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/covid_hospital_state/WestBengalHosp.csv");
		
		
			}
	
	};
	
	
	
	
	
	
	
	
	
	
	
	private String ConfirmedURL="https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/india_state_confirmed.csv";
	private String DeadURL="https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/india_state_dead.csv";
	private String RecoveredURL="https://raw.githubusercontent.com/Basundhara1203/India_covid_data/master/covid_india/india_state_recovered.csv";
	
	
	
	public Object[] stateData(String name) throws IOException, InterruptedException
	{
		
		Integer confirmedArray[] =new Integer[30];
		Integer deadArray[] = new Integer[30];
		Integer recoveredArray[] = new Integer[30];
		
		Integer contwo[] = new Integer[2];
		Integer deadtwo[] = new Integer[2];
		Integer rectwo[] = new Integer[2];
		
		HttpClient client = HttpClient.newHttpClient();
		
		HttpRequest conrequest = HttpRequest.newBuilder()
        		.uri(URI.create(ConfirmedURL))
        		.build();
		HttpResponse<String> httpResponse = client.send(conrequest, HttpResponse.BodyHandlers.ofString());
		StringReader conCsvBodyReaer = new StringReader(httpResponse.body());
		
		Iterable<CSVRecord> conrecords = CSVFormat.EXCEL.withFirstRecordAsHeader().parse(conCsvBodyReaer);
		
		for(CSVRecord records: conrecords)
		{
			if(name.contentEquals(records.get("State")))
			{
				for(int i=0;i<30;i++)
				{
					confirmedArray[i] = Integer.parseInt(records.get(records.size()+i-30));
				}
				
			}
		}
	
	
		HttpRequest recoveredrequest = HttpRequest.newBuilder()
        		.uri(URI.create(RecoveredURL))
        		.build();
		HttpResponse<String> httprecoveredResponse = client.send(recoveredrequest, HttpResponse.BodyHandlers.ofString());
		StringReader recoveredCsvBodyReaer = new StringReader(httprecoveredResponse.body());
		Iterable<CSVRecord> recoveredrecords = CSVFormat.EXCEL.withFirstRecordAsHeader().parse(recoveredCsvBodyReaer);
		
		for(CSVRecord records: recoveredrecords)
		{
			if(name.contentEquals(records.get("State")))
			{
				for(int i=0;i<30;i++)
				{
					recoveredArray[i] = Integer.parseInt(records.get(records.size()+i-30));
				}
				
			}
		}
		
		HttpRequest deadrequest = HttpRequest.newBuilder()
        		.uri(URI.create(DeadURL))
        		.build();
		HttpResponse<String> httpdeadResponse = client.send(deadrequest, HttpResponse.BodyHandlers.ofString());
		StringReader deadCsvBodyReaer = new StringReader(httpdeadResponse.body());
		Iterable<CSVRecord> deadrecords = CSVFormat.EXCEL.withFirstRecordAsHeader().parse(deadCsvBodyReaer);
		
		for(CSVRecord records: deadrecords)
		{
			if(name.contentEquals(records.get("State")))
			{
				for(int i=0;i<30;i++)
				{
					deadArray[i] = Integer.parseInt(records.get(records.size()+i-30));
				}
				
			}
		}
	
		List<String> red = new ArrayList<String>(); 
		List<String> orange = new ArrayList<String>(); 
		List<String> green = new ArrayList<String>(); 
		
		
		if(name.contentEquals("Dadra Nagar Haveli"))
		{
			green.add("Dadra");
			green.add("Silvassa");
		}
		
		else
		{
		
		
		String zone = mymap.get(name);
		HttpRequest zonerequest = HttpRequest.newBuilder()
        		.uri(URI.create(zone))
        		.build();
		
		HttpResponse<String> zoneResponse = client.send(zonerequest, HttpResponse.BodyHandlers.ofString());
		StringReader zoneCsvBodyReaer = new StringReader(zoneResponse.body());
		Iterable<CSVRecord> zonerecords = CSVFormat.EXCEL.withFirstRecordAsHeader().parse(zoneCsvBodyReaer);
		
		
		
		for(CSVRecord records:zonerecords)
		{
			if(records.get("Zone").contentEquals("Red"))
			{
				red.add(records.get(0));
			}
			if(records.get("Zone").contentEquals("Orange"))
			{
				orange.add(records.get(0));
			}
			if(records.get("Zone").contentEquals("Green"))
			{
				green.add(records.get(0));
			}
		}
		
		}
		
		
	
		Object[] ob = new Object[10];
		
		ob[0] = confirmedArray;
		ob[1] = deadArray;
		ob[2] = recoveredArray;
		
		ob[3] = red;
		ob[4] = orange;
		ob[5] = green;
		
		
		
		
		System.out.println(name);
		
		for(int i=0;i<30;i++)
		{
			System.out.println(confirmedArray[i] + " "+ deadArray[i]+" "+recoveredArray[i]);
		}
		
		System.out.println("----------Green----------");
		green.stream().forEach((i)->System.out.println(i));
		
		System.out.println("---------Red------------");
		red.stream().forEach((i)->System.out.println(i));
		
		
		System.out.println("---------Orange-----------");
		orange.stream().forEach((i)->System.out.println(i));
		
		List<Hospital> hosplist = hospdetails(name);
	
		ob[6] = hosplist;
		return ob;
	
	}
	
	
	public List<Hospital> hospdetails(String name) throws IOException, InterruptedException
	{
		List<Hospital> hosplist = new ArrayList<Hospital>();
		
		if(name.contentEquals("Dadra Nagar Haveli"))
		{
			hosplist.add(new Hospital("Vardhaman Hospital","Naroli Road,Dadra Nagar Haveli","Silvassa","Private Testing Centre"));
		}
		
		else if(name.contentEquals("Nagaland"))
		{
			hosplist.add(new Hospital() ); 
		}
		
		else
		{
		
		String hosp = hospmap.get(name);
		
		HttpClient client = HttpClient.newHttpClient();
		HttpRequest hosprequest = HttpRequest.newBuilder()
        		.uri(URI.create(hosp))
        		.build();
		
		HttpResponse<String> hospResponse = client.send(hosprequest, HttpResponse.BodyHandlers.ofString());
		StringReader hospCsvBodyReaer = new StringReader(hospResponse.body());
		Iterable<CSVRecord> hosprecords = CSVFormat.EXCEL.withFirstRecordAsHeader().parse(hospCsvBodyReaer);
		
		
	
		for(CSVRecord records:hosprecords)
		{
			try 
			{
				hosplist.add(new Hospital(records.get(0),records.get(1),records.get(2),records.get(3)));
			
			}
			catch(Exception e)
			{
		
			}
			
		}
		}
		
		return hosplist;
		
	}
	
	public Object[] stateMonthly(String name) throws IOException, InterruptedException
	{
		String[] mon = {"Jan","Feb","Mar","Apr","May","Jun"};
		Integer total[] = new Integer[6];
		
		
		for(int i =0;i<6;i++)
		{
			total[i]=0;
		}
		
		Map<String,Integer> confmon = new LinkedHashMap<String,Integer>();
		Map<String,Integer> deadmon = new LinkedHashMap<String,Integer>();
		Map<String,Integer> recomon = new LinkedHashMap<String,Integer>();
		
		HttpClient client = HttpClient.newHttpClient();
		
		HttpRequest conrequest = HttpRequest.newBuilder()
        		.uri(URI.create(ConfirmedURL))
        		.build();
		HttpResponse<String> httpResponse = client.send(conrequest, HttpResponse.BodyHandlers.ofString());
		StringReader conCsvBodyReaer = new StringReader(httpResponse.body());
		
		Iterable<CSVRecord> conrecords = CSVFormat.EXCEL.withFirstRecordAsHeader().parse(conCsvBodyReaer);
		
		for(CSVRecord record: conrecords)
		{
			if(record.get("State").contentEquals(name))
			{
				total[0] = Integer.parseInt(record.get("01-02-20"));
				total[1] = Integer.parseInt(record.get("01-03-20"));
				total[2] = Integer.parseInt(record.get("01-04-20"));
				total[3] = Integer.parseInt(record.get("01-05-20"));
				total[4] = Integer.parseInt(record.get("01-06-20"));
				total[5] = Integer.parseInt(record.get("01-07-20"));
			}
		}
		
		for(int i =0;i<mon.length;i++)
		{
			
			confmon.put(mon[i], total[i]);
		}
		
		HttpRequest deadrequest = HttpRequest.newBuilder()
        		.uri(URI.create(DeadURL))
        		.build();
		HttpResponse<String> httpdeadResponse = client.send(deadrequest, HttpResponse.BodyHandlers.ofString());
		StringReader deadCsvBodyReaer = new StringReader(httpdeadResponse.body());
		
		Iterable<CSVRecord> deadrecords = CSVFormat.EXCEL.withFirstRecordAsHeader().parse(deadCsvBodyReaer);
		
		for(int i =0;i<5;i++)
		{
			total[i]=0;
		}
		
		for(CSVRecord record: deadrecords)
		{
			if(record.get("State").contentEquals(name))
			{
				total[0] = Integer.parseInt(record.get("01-02-20"));
				total[1] = Integer.parseInt(record.get("01-03-20"));
				total[2] = Integer.parseInt(record.get("01-04-20"));
				total[3] = Integer.parseInt(record.get("01-05-20"));
				total[4] = Integer.parseInt(record.get("01-06-20"));
				total[5] = Integer.parseInt(record.get("01-07-20"));
					
			}
		}
		
		for(int i =0;i<mon.length;i++)
		{
			
			deadmon.put(mon[i], total[i]);
		}
		
		HttpRequest recorequest = HttpRequest.newBuilder()
        		.uri(URI.create(RecoveredURL))
        		.build();
		HttpResponse<String> httprecoResponse = client.send(recorequest, HttpResponse.BodyHandlers.ofString());
		StringReader recoCsvBodyReaer = new StringReader(httprecoResponse.body());
		
		Iterable<CSVRecord> recorecords = CSVFormat.EXCEL.withFirstRecordAsHeader().parse(recoCsvBodyReaer);
		
		for(int i =0;i<5;i++)
		{
			total[i]=0;
		}
		
		for(CSVRecord record: recorecords)
		{
			if(record.get("State").contentEquals(name))
			{
					total[0] = Integer.parseInt(record.get("01-02-20"));
					total[1] = Integer.parseInt(record.get("01-03-20"));
					total[2] = Integer.parseInt(record.get("01-04-20"));
					total[3] = Integer.parseInt(record.get("01-05-20"));
					total[4] = Integer.parseInt(record.get("01-06-20"));
					total[5] = Integer.parseInt(record.get("01-07-20"));
					
			}
		}
		for(int i =0;i<mon.length;i++)
		{
			
			recomon.put(mon[i], total[i]);
		}
		
		Object[] ob = new Object[3];
		ob[0] = confmon;
		ob[1] = deadmon;
		ob[2] = recomon;
		
		return ob;
	}
	
}
