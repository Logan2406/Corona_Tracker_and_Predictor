<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link rel="shortcut icon" type="image/png" href="photos/virus.png">
<style>

body {
	 background-image: url("photos/corona_img.jpg");
	background-repeat: no-repeat;
	background-size: cover;
	background-position:center;
	background-attachment:fixed;
	
}
.charts
{
margin: 0 auto;
  border: 1px solid #ccc;
 box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.5), 0 6px 20px 0 rgba(0, 0, 0, 0.5);
  border-radius: 3px/6px;        
}
.jumbotron {
    background: none;
}

.prediction
{

	color:#ffffff
}

.footer {

  position:relative;
  margin-bottom:0;
  left: 0;
  bottom: 0;
  width: 100%;
  height:85px;
  background-color: black;
  color: white;
  text-align: center;
}
</style>
<title>${name}</title>
</head>
<body>

	<c:set var="confper" value="${(confar[29]/totconf)*100}" />
	<c:set var="deadper" value="${(deadar[29]/totdead)*100}" />
	<c:set var="recoper" value="${(recoar[29]/totreco)*100}" />

<nav class="navbar navbar-expand-lg navbar-dark"
		style="background-color: black;">
		<a class="navbar-brand" href="/"><img src="photos/logo.png"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link" href="/index">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item active"><a class="nav-link" href="/india">India
				</a></li>
			</ul>
		</div>
	</nav>
	<div class="jumbotron">
		<h1 class="display-2 text-white">${name}</h1>
		<hr class="my-4">
		<div class="row">
			<div class="col-4">
				<div class="card charts" style="width: 18rem; background-color: rgba(255,133,25,0.9);">
					<div class="card-body text-white">
						<h3 class="card-title">Confirmed Case</h3>
						<h4 id="totconf">${confar[29]}</h4>
						<h5>
							<fmt:formatNumber type="number" maxFractionDigits="2"
								value="${confper}" />
							%
						</h5>
						<div class="progress">
							<div class="progress-bar bg-secondary" role="progressbar"
								style="width: ${confper}%" aria-valuenow="${confper}"
								aria-valuemin="0" aria-valuemax="100"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-4">
				<div class="card charts" style="width: 18rem; background-color:rgba(242,41,41,0.9);">
					<div class="card-body text-white">
						<h3 class="card-title">Death Reports</h3>
						<h4 id="totdead">${deadar[29]}</h4>
						<h5>
							<fmt:formatNumber type="number" maxFractionDigits="2"
								value="${deadper}" />
							%
						</h5>
						<div class="progress">
							<div class="progress-bar bg-secondary" role="progressbar"
								style="width: ${deadper}%" aria-valuenow="${deadper}"
								aria-valuemin="0" aria-valuemax="100"></div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-4">
				<div class="card charts" style="width: 18rem; background-color: rgba(57,237,105,0.9);">
					<div class="card-body text-white">
						<h3 class="card-title">People Recovered</h3>
						<h4 id="totreco">${recoar[29]}</h4>
						<h5>
							<fmt:formatNumber type="number" maxFractionDigits="2"
								value="${recoper}" />
							%
						</h5>
						<div class="progress">
							<div class="progress-bar bg-secondary" role="progressbar"
								style="width: ${recoper}%" aria-valuenow="${recoper}"
								aria-valuemin="0" aria-valuemax="100"></div>
						</div>
					</div>
				</div>
			</div>



		</div>

	</div>
	<div class="container-fluid pl-1 ml-1">
		<div class="row">
			<div class="col-6">
					<div class="container charts" style="background-color:rgba(237,64,64,0.7); height:500px">
						<br/>
						<br/>
						<center><h2 class="display-6 text-white">New Daily Affected People </h2></center>
						<br/>
						<h5 class="text-white">These figures are for the people who are affected and recovered on last day.</h5>
						<div class="row">
							<div class="col-4">
								<div class="card text-white charts mb-3"
									style="max-width: 18rem; background-color: rgba(255,133,25,0.9);">
									<div class="card-header">Confirmed Cases</div>
									<div class="card-body">
										<h3 class="card-title">${newconf}</h3>
									</div>
								</div>
							</div>

							<div class="col-4">
								<div class="card text-white charts mb-3"
									style="max-width: 18rem;background-color:rgba(242,41,41,0.9);">
									<div class="card-header">Dead Cases</div>
									<div class="card-body">
										<h3 class="card-title">${newdead}</h3>
									</div>
								</div>

							</div>


							<div class="col-4">
								<div class="card text-white charts mb-3"
									style="max-width: 18rem; background-color: rgba(57,237,105,0.9);">
									<div class="card-header">Recovered Cases</div>
									<div class="card-body">
										<h3 class="card-title">${newreco}</h3>
									</div>
								</div>


							</div>

						</div>
					</div>
			</div>

			<div class="col-6 pl-1">
			
				<div id="chartContainer"class="charts ml-0 pl-0" style="height: 500px; width: 100%;"></div>
			</div>

		</div>
	</div>

	<div class="jumbotron">
		<div id="totalMonthlyChart" class="charts" style="height: 400px; width: 100%;"></div>

	</div>
	
	<div class="text-center">
						<a href="/statemore?name=${name}"><button class="btn btn-info btn-lg charts" style="font-size:35px; height:150px; width:200px;" >More Graphs</button></a>
					</div>
	


	<div class="container">
		<div class="jumbotron">
		<h1 class="display-4 text-white" style="text-shadow: 2px 2px 4px #000000;"><center>Classification of Zones(District)<center></h1>
			<div class="row">
			<div class="text-center">
			</div>
				<div class="col-12">
					<div class="row">
						<div class="col-4">
							<div class="card text-white charts mb-3"
								style="max-width: 18rem;background-color:rgba(242,41,41,0.9);">
								<div class="card-header">Red Zones</div>
								<div class="card-body">
									<c:forEach items="${red}" var="r">
							${r}
							<br>
									</c:forEach>
								</div>
							</div>
						</div>

						<div class="col-4">
							<div class="card text-white charts mb-3"
								style="max-width: 18rem; background-color:rgba(255,133,25,0.9); ">
								<div class="card-header"><center>Orange Zones</div>
								<div class="card-body">
									<c:forEach items="${orange}" var="o">
							${o}
							<br>
									</c:forEach>
								</div>
							</div>

						</div>
						<div class="col-4">
							<div class="card text-white charts mb-3"
								style="max-width: 18rem; background-color: rgba(17,150,59,0.9);">
								<div class="card-header"><center>Green Zones</center></div>
								<div class="card-body">
									<c:forEach items="${green}" var="g">
							${g}
							<br>
									</c:forEach>
								</div>
							</div>

						</div>
					</div>


				</div>


			</div>
		</div>
	</div>

	<center><h2 class="display-4 text-white" style="text-shadow: 2px 2px 4px #000000;">Testing Centre Details</h2></center>
<div class="col-12" style="overflow-y: auto; max-height: 400px; ">
	<div class="list-group charts" style= "background-color:rgba(17,150,59,0.9);">
	<c:forEach items="${hospitals}" var="hosp">
		<div class="list-group-item list-group-item-action charts mb-2" style="background:none;">
			<div class="d-flex w-100 justify-content-between">
				<h5 class="mb-1 text-white">${hosp.name}</h5>
			</div>
			<p class="mb-1 text-white">${hosp.address}
			</p> 
			
			<div class="container">
				<div class="row">
						<div class="col-2 ml-0">
							<p class="text-white">${hosp.locality}</p>
						</div>
						<div class="col-3">
							<p class="text-white">${hosp.type}</p>
						</div>
				</div>
			</div>
			<hr>
		</div>
		
	</c:forEach>
	</div>
</div>
<br>

		<div class="jumbotron prediction">
			<h1 class="display-4"style="text-shadow: 2px 2px 4px #000000;"><center>Prediction Model<center></h1>
			<center><p class="lead"style="text-shadow: 2px 2px 4px #000000;">This prediction model is based on the previous data and the 
			rate of the data that keeps on changing.<br/> It won't be accurate but will give 
			an overview for the audience about the near future in accordance with the 
			present.</p></center>
			<hr class="my-4">
			<center><p style="text-shadow: 2px 2px 4px #000000;">To predict the data for next seven days, Click the button below </p></center>
					<div class="text-center">
						<a href="/prediction"><button class="btn btn-warning btn-lg charts" style="font-size:60px; height:110px; width:280px;" >Predict</button></a>
					</div>
			
		</div>
<br/>
<div class="footer">
<br/>
  <div class="float-left"><img src="photos/logo.png" style="height:50px; width:180px ; padding-left:20px;" ></div>
  <div class="float-right"><h6 class="text-white" style="font-size: 20px; padding-right:30px;"> &copy; 2020 COVID19T&P</h6></div>
</div>
		<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
			integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
			crossorigin="anonymous"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
			integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
			crossorigin="anonymous"></script>
		<script
			src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
			integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
			crossorigin="anonymous"></script>
		<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
<script>


window.onload = function() {

	var ccc = parseInt(document.getElementById("totconf").innerHTML);
	document.getElementById("totconf").innerHTML = ccc.toLocaleString();

	var ddd = parseInt(document.getElementById("totdead").innerHTML);
	document.getElementById("totdead").innerHTML = ddd.toLocaleString();

	var rrr = parseInt(document.getElementById("totreco").innerHTML);
	document.getElementById("totreco").innerHTML = rrr.toLocaleString();
	

	var month=["Jan","Feb","Mar","Apr","May","Jun"];
	var q=0;
	var w=0;
	var e=0;

	var chart = new CanvasJS.Chart("chartContainer", {
		animationEnabled: true,
		theme: "dark1", // "light1", "light2", "dark1", "dark2"
		backgroundColor: "rgba(122, 191, 175, 0.9)",
		title:{
			text: "Month Wise Report"
		},
		axisY: {
			title: "Number of People"
		},
		data: [{
			yValueFormatString: "#,##,### People",        
			type: "column",  
			showInLegend: true, 
			legendMarkerColor: "",
			legendText: "Confirmed",
			dataPoints: [ 
				
				<c:forEach items="${wmconf}" var="con">   
				{ y: <c:out value="${con.value}" />, label: month[q++]},
				</c:forEach>
			]
		},
	          {        
			yValueFormatString: "#,##,### People",  
			type: "column",  
			showInLegend: true, 
			legendMarkerColor: "",
			legendText: "Dead",
			dataPoints: [  
				<c:forEach items="${wmdead}" var="rec">    
				{ y: <c:out value="${rec.value}"/>,label: month[w++]},
				</c:forEach>
			]
		},

        {       
		yValueFormatString: "#,##,### People",   
		type: "column",  
		showInLegend: true, 
		legendMarkerColor: "",
		legendText: "Recovered",
		dataPoints: [ 
			<c:forEach items="${wmreco}" var="dead">     
			{ y: <c:out value="${dead.value}"/>,label: month[e++]},
			</c:forEach>
		]
	}
		]
	});
	chart.render();

	
	var datearr=[];
	for(var i =29;i>-1;i--)
    {
        let toda = new Date();
        toda.setDate(toda.getDate()-i-1);
        datearr.push(toda);
    }
    var v=0;
	var w=0;
	var q=0;
	
	var monthWorldChart = new CanvasJS.Chart("totalMonthlyChart", {
		animationEnabled: true,
		theme: "dark2",
		backgroundColor: "rgba(48,93,133, 0.9)",
		title:{
			text: "People Affected"
		},
		axisY:{
			includeZero: false
		},
		data: [{ 
			yValueFormatString: "#,##,### People",        
			type: "line",
			color:"rgb(245, 171, 34)",
			showInLegend: true,
			name: "Confirmed",
	      	indexLabelFontSize: 16,
			dataPoints: [
			<c:forEach items="${confar}" var="monthcon">
				{  x:datearr[q++], y: <c:out value="${monthcon}"/> },
			</c:forEach>
			]
		},
		{   yValueFormatString: "#,##,### People",     
			type: "line",
			color:"rgb(245, 76, 34)",
			showInLegend: true,
			name: "Dead",
	      	indexLabelFontSize: 16,
			dataPoints: [
			<c:forEach items="${deadar}" var="monthdead">
				{  x:datearr[w++], y: <c:out value="${monthdead}"/>},
			</c:forEach>
				
			]
		},
		{   yValueFormatString: "#,##,### People", 
			type: "line",
			color:"rgb(28, 235, 45)",
			showInLegend: true,
			name: "Recovered",
	      	indexLabelFontSize: 16,
			dataPoints: [
			<c:forEach items="${recoar}" var="monthrec">
				{ x:datearr[v++], y: <c:out value="${monthrec}"/> },
			</c:forEach>
				
			]
		}

		]
	});
	monthWorldChart.render();
}
</script>
</html>