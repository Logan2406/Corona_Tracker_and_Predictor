package com.cognizant.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cognizant.model.Country;
import com.cognizant.model.Hospital;
import com.cognizant.model.State;
import com.cognizant.service.CountryService;
import com.cognizant.service.IndiaDailyService;
import com.cognizant.service.IndiaService;
import com.cognizant.service.StateService;
import com.cognizant.service.TestService;
import com.cognizant.service.WorldDailyService;

@Controller
public class StController {
	private SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
	
	private Map<String,Integer> confirmedTree;
	private Map<String,Integer> deadTree;
	private Map<String,Integer> recoveredTree;
	
	private Integer totalConfirmed=0;
	private Integer totalDead=0;
	private Integer totalRecovered=0;
	
	
	private Integer indiaconf =0;
	private Integer indiadead =0;
	private Integer indiareco =0;
	
	private Integer[] predictconf = new Integer[8];
	private Integer[] predictdead = new Integer[8];
	private Integer[] predictreco = new Integer[8];
	
	
	@Autowired
	TestService testService;
	
	@Autowired 
	CountryService countryService;
	
	@Autowired
	IndiaService indiaService;
	
	@Autowired
	StateService stateService;
	
	@Autowired
	WorldDailyService worldDailyService;
	
	@Autowired
	IndiaDailyService indiaDailyService;
	
	
	@RequestMapping("")
	public ModelAndView home()
	{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("home");
		
		return mv;
	}
	
	
	
	
	@RequestMapping(value="index")
	public ModelAndView index() throws ParseException
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		
		Object ar []=null;
		try 
		{
			ar= testService.monthlyWorldData();
		} 
		catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Map<String,Integer> arconf = (Map<String, Integer>) ar[2];
		Map<String,Integer> ardead= (Map<String, Integer>) ar[0];
		Map<String,Integer> arreco = (Map<String, Integer>) ar[1];
		
		mv.addObject("wmconf",arconf);
		mv.addObject("wmreco",arreco);
		mv.addObject("wmdead",ardead);
		
		
		Object[] wo = null;
		try 
		{
			wo = testService.countryAll();
		} 
		catch (IOException | InterruptedException e) 
		{
			e.printStackTrace();
		}
		
		totalConfirmed = (Integer) wo[1]; 
		totalDead = (Integer) wo[2];
		totalRecovered = (Integer) wo[3];
		List<Country> countries = (List<Country>) wo[0];
		
		Integer confirmedArray[] = (Integer[]) wo[4];
		Integer deadArray[] =(Integer[]) wo[5];
		Integer recoveredArray[] =(Integer[]) wo[6];
		
		
		mv.addObject("newconf", confirmedArray[29]-confirmedArray[28]);
		mv.addObject("newdead", deadArray[29]-deadArray[28]);
		mv.addObject("newreco", recoveredArray[29]-recoveredArray[28]);
		
		mv.addObject("countries",countries);
		mv.addObject("confirmed",totalConfirmed);
		mv.addObject("dead",totalDead);
		mv.addObject("recovered",totalRecovered);
		
		mv.addObject("monthConfirmed",confirmedArray);
		mv.addObject("monthDead",deadArray);
		mv.addObject("monthRecovered",recoveredArray);
		
		
		List<Country> newList = testService.getPiDetails(countries);
		mv.addObject("pilist",newList);
		
		
		confirmedTree = (TreeMap<String,Integer>) wo[7];
		deadTree = (TreeMap<String,Integer>) wo[8];
		recoveredTree = (TreeMap<String,Integer>) wo[9];
		
		for(int i=0;i<8;i++)
		{
			predictconf[i]=confirmedArray[30-8+i];
		}
		
		
		return mv;	
		
	
	}
	
	@RequestMapping(value="country")
	public ModelAndView show(@RequestParam("name") String name)
	{
		ModelAndView mv = new ModelAndView();
		mv.addObject("Country_Name", name);		
		mv.setViewName("country");
		Integer confirmed = (Integer) confirmedTree.get(name);
		Integer dead = (Integer) deadTree.get(name);
		Integer recovered = (Integer) recoveredTree.get(name);
		
		//System.out.println(confirmed);
		//System.out.println(dead);
		//System.out.println(recovered);
		String code="";
		try 
		{
			code = countryService.getCode(name);
		} 
		catch (IOException e) 
		{
			
			e.printStackTrace();
		}
		
		mv.addObject("confirmed", confirmed);
		mv.addObject("dead", dead);
		mv.addObject("recovered", recovered);
		mv.addObject("totconf", totalConfirmed);
		mv.addObject("totdead", totalDead);
		mv.addObject("totreco", totalRecovered);
		mv.addObject("code",code);
		
		Object[] monthly=null;
		try 
		{
			monthly = countryService.monthlyReport(name);
		} 
		catch (IOException | InterruptedException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		Map<String,Integer> arconf = (Map<String, Integer>) monthly[0];
		Map<String,Integer> ardead= (Map<String, Integer>) monthly[1];
		Map<String,Integer> arreco = (Map<String, Integer>) monthly[2];
		
		mv.addObject("counconf",arconf);
		mv.addObject("coundead", ardead);
		mv.addObject("counreco", arreco);
		
		
		Object[] thirty = null;
		
		try 
		{
			thirty = countryService.lastThirtyDays(name);
		} 
		catch (IOException | InterruptedException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Integer[] lastConf = (Integer[]) thirty[0];
		Integer[] lastDead = (Integer[]) thirty[1];
		Integer[] lastReco = (Integer[]) thirty[2];
		
		Integer confadd = lastConf[29]-lastConf[28];
		Integer deadadd = lastDead[29]-lastDead[28];
		Integer recoadd = lastReco[29]-lastReco[28];
		
		mv.addObject("newconf", confadd);
		mv.addObject("newdead", deadadd);
		mv.addObject("newreco", recoadd);
		
		mv.addObject("lastConf",lastConf);
		mv.addObject("lastDead", lastDead);
		mv.addObject("lastReco", lastReco);
		
		Object data[]=null;
		try 
		{
			data = countryService.getData(name);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		Long population = (Long)data[0];
		Long area = (Long)data[1];
		String capital = (String)data[2];
		
		
		
		Double rateconf = (lastConf[29]-lastConf[0])/30.0;
		Double ratedead = (lastDead[29]-lastDead[0])/30.0;
		Double ratereco = (lastReco[29]-lastReco[0])/30.0;
		
		Double confperpop =  ((double)confirmed*100)/population;
		Double confperarea =  ((double)confirmed/area);
					
		mv.addObject("population", population);
		mv.addObject("area", area);
		mv.addObject("capital", capital);
		
		mv.addObject("rateconf",String.format("%.2f",rateconf));
		mv.addObject("ratedead",String.format("%.2f",ratedead));
		mv.addObject("ratereco",String.format("%.2f",ratereco));
		
		mv.addObject("confperpop",String.format("%.2f",confperpop));
		mv.addObject("confperarea",String.format("%.2f",confperarea));
		
		
		for(int i=0;i<8;i++)
		{
			predictconf[i]=lastConf[30-8+i];
		}
		
		
		return mv;
		
		
	}
	
	@RequestMapping(value="india")
	public ModelAndView showIndia()
	{
		
		ModelAndView mv = new ModelAndView();
		Object ob[] = new Object[5];
		Map<String,State> states=null;
		try 
		{
			ob = indiaService.returnData();
		} 
		catch (IOException | InterruptedException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		states=(Map<String, State>) ob[0];
		Integer tot[] = (Integer[]) ob[1];
		
		
		indiaconf =tot[0];
		indiadead =tot[1];
		indiareco =tot[2];
		Integer monthlyconf[]=(Integer[]) ob[2];
		Integer monthlydead[]=(Integer[]) ob[3];
		Integer monthlyreco[]=(Integer[]) ob[4];
		
		
		mv.addObject("newconf", monthlyconf[29]-monthlyconf[28]);
		mv.addObject("newdead", monthlydead[29]-monthlydead[28]);
		mv.addObject("newreco", monthlyreco[29]-monthlyreco[28]);
		
		mv.addObject("indconf", tot[0]);
		mv.addObject("inddead", tot[1]);
		mv.addObject("indreco", tot[2]);
		mv.addObject("states", states);
		mv.addObject("monthlyconf", monthlyconf);
		mv.addObject("monthlydead", monthlydead);
		mv.addObject("monthlyreco", monthlyreco);
		
		
		Object sortOb[] = indiaService.sortState(states);
		mv.addObject("conflist", sortOb[0]);
		mv.addObject("deadlist", sortOb[1]);
		mv.addObject("recolist", sortOb[2]);
		
		for(int i=0;i<8;i++)
		{
			predictconf[i]=monthlyconf[30-8+i];
		}
		
		return mv;
	}
	
	
	@RequestMapping(value="state")
	public ModelAndView showIndia(@RequestParam("name") String name)
	{
		ModelAndView mv = new ModelAndView();
		mv.addObject("name", name);
		Object ob[] = null;
		
		try 
		{
			ob= stateService.stateData(name);
		} 
		catch (IOException | InterruptedException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		Integer[] confar = (Integer[]) ob[0];
		Integer[] deadar = (Integer[]) ob[1];
		Integer[] recoar = (Integer[]) ob[2];
		
		mv.addObject("confar", confar);
		mv.addObject("deadar", deadar);
		mv.addObject("recoar", recoar);
		
		
		Object [] oob = null;
		
		try 
		{
			oob = stateService.stateMonthly(name);
		} 
		catch (IOException | InterruptedException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Map<String,Integer> arconf = (Map<String, Integer>) oob[0];
		Map<String,Integer> ardead= (Map<String, Integer>) oob[1];
		Map<String,Integer> arreco = (Map<String, Integer>) oob[2];
		
		for(Entry<String, Integer> e :arconf.entrySet())
		{
			System.out.println(e.getKey() + " " +e.getValue());
		}
		
		
		mv.addObject("wmconf",arconf);
		mv.addObject("wmreco",arreco);
		mv.addObject("wmdead",ardead);
		
		for(int i=0;i<8;i++)
		{
			predictconf[i] = confar[22+i];
			predictdead[i]= deadar[22+i];
			predictreco[i] = recoar[22+i];
		}
		
		mv.addObject("newconf", confar[29]-confar[28]);
		mv.addObject("newdead", deadar[29]-deadar[28]);
		mv.addObject("newreco", recoar[29]-recoar[28]);
		
		List<String> red = (List<String>) ob[3];
		List<String> orange =(List<String>) ob[4];
		List<String> green =(List<String>) ob[5];
		
		List<Hospital> hosplist = (List<Hospital>) ob[6];
		
		
		for(Hospital h: hosplist)
		{
			System.out.println(h);
		}
		mv.addObject("red", red);
		mv.addObject("orange", orange);
		mv.addObject("green", green);
		mv.addObject("hospitals",hosplist);
		
		mv.addObject("totconf",indiaconf);
		mv.addObject("totdead",indiadead);
		mv.addObject("totreco",indiareco);
		
		mv.setViewName("state");
		return mv;
	}
	
	
	@RequestMapping(value="/prediction")
	public ModelAndView predict(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		String name = request.getParameter("name");
		mv.addObject("name", name);
		mv.setViewName("prediction");
		
		System.out.println("*--------*");
		for(int i=0;i<8;i++)
		{
			System.out.println(predictconf[i]+" "+predictdead[i]+" "+predictreco[i]);
		}
		
		mv.addObject("preconf",predictconf);
		mv.addObject("predead",predictdead);
		mv.addObject("prereco",predictreco);
		
		return mv;
		
	}
	
	@RequestMapping(value="worldmore")
	public ModelAndView worldmore()
	{
		ModelAndView mv = new ModelAndView();
		
		Object ob[] =null;
		try {
			
			ob = worldDailyService.worldData();
		} 
		catch (IOException | InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		List<Integer> conflist = (List<Integer>) ob[0];
		List<Integer> deadlist = (List<Integer>) ob[1];
		List<Integer> recolist = (List<Integer>) ob[2];
		List<Integer> newconflist = (List<Integer>) ob[3];
		List<Integer> newdeadlist = (List<Integer>) ob[4];
		List<Integer> newrecolist = (List<Integer>) ob[5];
		
		Integer confrate =  (conflist.get(conflist.size()-1) - conflist.get(conflist.size()-61))/60;
		Integer deadrate =  (deadlist.get(deadlist.size()-1) - deadlist.get(deadlist.size()-61))/60;
		Integer recorate =  (recolist.get(recolist.size()-1) - recolist.get(recolist.size()-61))/60;
		
		
		int total[]= new int[3];
		total[0] =0;
		total[1] =0;
		total[2] =0;
		
		for(int k=1;k<8;k++)
		{
			total[0] =total[0] + newconflist.get(newconflist.size()-k) ;
			total[1] =total[1] +newdeadlist.get(newdeadlist.size()-k) ;
			total[2] =total[2] + newrecolist.get(newrecolist.size()-k);
			
		}
		
		int newconfrate = total[0]/7;
		int newdeadrate = total[1]/7;
		int newrecorate = total[2]/7;
		
		mv.addObject("conflist", conflist);
		mv.addObject("deadlist", deadlist);
		mv.addObject("recolist", recolist);
		mv.addObject("newconflist", newconflist);
		mv.addObject("newdeadlist", newdeadlist);
		mv.addObject("newrecolist", newrecolist);
		
		mv.addObject("confrate", confrate);
		mv.addObject("deadrate", deadrate);
		mv.addObject("recorate", recorate);
		
		mv.addObject("newconfrate", newconfrate);
		mv.addObject("newdeadrate", newdeadrate);
		mv.addObject("newrecorate", newrecorate);
		mv.addObject("capacity", conflist.size()-1);
		
		mv.setViewName("more");
	    return mv;
	
	}
	
	@RequestMapping(value="countrymore")
	public ModelAndView worldmore(@RequestParam("name") String name)
	{
		ModelAndView mv = new ModelAndView();
		
		Object ob[] =null;
		try {
			
			ob = worldDailyService.countryData(name);
		} 
		catch (IOException | InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		List<Integer> conflist = (List<Integer>) ob[0];
		List<Integer> deadlist = (List<Integer>) ob[1];
		List<Integer> recolist = (List<Integer>) ob[2];
		List<Integer> newconflist = (List<Integer>) ob[3];
		List<Integer> newdeadlist = (List<Integer>) ob[4];
		List<Integer> newrecolist = (List<Integer>) ob[5];
		
		mv.addObject("conflist", conflist);
		mv.addObject("deadlist", deadlist);
		mv.addObject("recolist", recolist);
		mv.addObject("newconflist", newconflist);
		mv.addObject("newdeadlist", newdeadlist);
		mv.addObject("newrecolist", newrecolist);
		mv.addObject("capacity", conflist.size()-1);
		mv.addObject("name", name);
		
		Integer confrate =  (conflist.get(conflist.size()-1) - conflist.get(conflist.size()-61))/60;
		Integer deadrate =  (deadlist.get(deadlist.size()-1) - deadlist.get(deadlist.size()-61))/60;
		Integer recorate =  (recolist.get(recolist.size()-1) - recolist.get(recolist.size()-61))/60;
		
		
		
		int total[]= new int[3];
		total[0] =0;
		total[1] =0;
		total[2] =0;
		
		for(int k=1;k<8;k++)
		{
			total[0] =total[0] + newconflist.get(newconflist.size()-k) ;
			total[1] =total[1] +newdeadlist.get(newdeadlist.size()-k) ;
			total[2] =total[2] + newrecolist.get(newrecolist.size()-k);
			
		}
		int newconfrate = total[0]/7;
		int newdeadrate = total[1]/7;
		int newrecorate = total[2]/7;
		
		mv.addObject("confrate", confrate);
		mv.addObject("deadrate", deadrate);
		mv.addObject("recorate", recorate);
		
		mv.addObject("newconfrate", newconfrate);
		mv.addObject("newdeadrate", newdeadrate);
		mv.addObject("newrecorate", newrecorate);
		
		
		mv.setViewName("more");
	    return mv;
	
	}
	
	@RequestMapping("statemore")
	public ModelAndView statemore(@RequestParam("name") String name)
	{
		ModelAndView mv = new ModelAndView();
	
		Object ob[] =null;
		
		try 
		{
			
			ob = indiaDailyService.moreState(name);
		} 
		catch (IOException | InterruptedException e) 
		{
			
			e.printStackTrace();
		}
		
		List<Integer> conflist = (List<Integer>) ob[0];
		List<Integer> deadlist = (List<Integer>) ob[1];
		List<Integer> recolist = (List<Integer>) ob[2];
		List<Integer> newconflist = (List<Integer>) ob[3];
		List<Integer> newdeadlist = (List<Integer>) ob[4];
		List<Integer> newrecolist = (List<Integer>) ob[5];
		
		mv.addObject("conflist", conflist);
		mv.addObject("deadlist", deadlist);
		mv.addObject("recolist", recolist);
		mv.addObject("newconflist", newconflist);
		mv.addObject("newdeadlist", newdeadlist);
		mv.addObject("newrecolist", newrecolist);
		mv.addObject("capacity", conflist.size()-1);
		mv.addObject("name", name);
		
		Integer confrate =  (conflist.get(conflist.size()-1) - conflist.get(conflist.size()-61))/60;
		Integer deadrate =  (deadlist.get(deadlist.size()-1) - deadlist.get(deadlist.size()-61))/60;
		Integer recorate =  (recolist.get(recolist.size()-1) - recolist.get(recolist.size()-61))/60;
		
		
		
		int total[]= new int[3];
		total[0] =0;
		total[1] =0;
		total[2] =0;
		
		for(int k=1;k<8;k++)
		{
			total[0] =total[0] + newconflist.get(newconflist.size()-k) ;
			total[1] =total[1] +newdeadlist.get(newdeadlist.size()-k) ;
			total[2] =total[2] + newrecolist.get(newrecolist.size()-k);
			
		}
		int newconfrate = total[0]/7;
		int newdeadrate = total[1]/7;
		int newrecorate = total[2]/7;
		
		mv.addObject("confrate", confrate);
		mv.addObject("deadrate", deadrate);
		mv.addObject("recorate", recorate);
		
		mv.addObject("newconfrate", newconfrate);
		mv.addObject("newdeadrate", newdeadrate);
		mv.addObject("newrecorate", newrecorate);
		
		
		
		mv.setViewName("more");
		return mv;
		
	}

}


