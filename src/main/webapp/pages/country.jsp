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

.jumbotron {
    background: none;
}

.first-content
{
	background-color:#ffffff;
}

.prediction
{

	color:#ffffff
}

.country-card >.card-header,.card-body,.card-footer
{
background: none;
}

.charts
{
margin: 0 auto;
  border: 1px solid #ccc;
 box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.5), 0 6px 20px 0 rgba(0, 0, 0, 0.5);
  border-radius: 3px/6px;        
}

.footer {

  position:relative;
  margin-bottom:0;
  left: 0;
  bottom: 0;
  width: 100%;
  height:100px;
  background-color: black;
  color: white;
  text-align: center;
}

</style>
<title>${Country_Name}</title>
</head>
<body>
<!-- Navigation Bar Start -->
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

	<c:set var="confper" value="${(confirmed/totconf)*100}" />
	<c:set var="deadper" value="${(dead/totdead)*100}" />
	<c:set var="recoper" value="${(recovered/totreco)*100}" />


	<div class="jumbotron">
		<h1 class="display-2" style="color:#ffffff; text-shadow: 2px 2px 4px #000000;">
			<img src="https://www.countryflags.io/${code}/shiny/64.png">
			${Country_Name}
		</h1>
		<hr class="my-4">
		<div class="row">
			<div class="col-4">
				<div class="card charts" style="width: 18rem; background-color: rgba(255,133,25,0.9);">
					<div class="card-body text-white">
						<h3 class="card-title">Confirmed Case</h3>
						<h4 id="totconf">${confirmed}</h4>
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
						<h4 id="totdead">${dead}</h4>
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
						<h4 id="totreco">${recovered}</h4>
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
	<div class="container-fluid">
	<div class="row">
		<div class="col-6">
				<div class="container charts" style="background-color:rgba(237,64,64,0.7); height:460px">
					<br/>
					<br/>
					<center><h2 class="display-4 text-white">Daily Updated Records</h2></center>
					<br/>
					<h5 class="text-white">These figures are for the people who are affected and recovered on last day.</h5>
					<br>
					<div class="row">
						<div class="col-4">
							<div class="card text-white mb-3 charts"
								style="max-width: 18rem; background-color: rgba(255,133,25,0.9);">
								<div class="card-header"><small>Confirmed Cases</small></div>
								<div class="card-body">
									<h3 class="card-title" id="totnewconf">${newconf}</h3>
								</div>
							</div>
						</div>

						<div class="col-4">
							<div class="card text-white mb-3 charts"
								style="max-width: 18rem; background-color:rgba(242,41,41,0.9);">
								<div class="card-header"><small>Dead Cases</small></div>
								<div class="card-body">
									<h3 class="card-title" id="totnewdead">${newdead}</h3>
								</div>
							</div>

						</div>


						<div class="col-4">
							<div class="card text-white mb-3 charts"
								style="max-width: 18rem; background-color: rgba(57,237,105,0.9);">
								<div class="card-header"><small>Recovered Cases</small></div>
								<div class="card-body">
									<h3 class="card-title" id="totnewreco">${newreco}</h3>
								</div>
							</div>


						</div>

					</div>
				</div>
		</div>

		<div class="col-6 pl-3">
			<div id="chartContainer" class="charts" style="height: 460px; width: 100%;"></div>
		</div>

	</div>
</div>
<div class="container-fluid mt-3 p-3" >
	<div class="row">
		<div class="col-5">
			
			<div class="card country-card border-success mb-3 charts" style="width:100%; background-color: rgba(17,102,39,0.9);">
				<div class="card-header text-white border-success"><center><h3>${Country_Name}</h3></center></div>
				<div class="card-body">
					<h4 class="card-title text-white"><center>Details</center></h4>
					<center><p class="card-text text-white">Capital :   ${capital }</p></center>
					<center><p class="card-text text-white">Area :    ${area} sq km</p></center>
					<center><p class="card-text text-white">Population :   ${population}</p></center>
				</div>
				<div class="card-footer border-success">
					<center><p class="card-text text-white">Percentage of Confirmed People :   ${confperpop}%</p></center>
					<center><p class="card-text text-white">Confirmed Case per sq km :  ${confperarea}</p></center>
					<center><p class="card-text text-white">Rate of People getting affected :   ${rateconf} per day</p></center>
					<center><p class="card-text text-white">Rate of People Dying :   ${ratedead} per day</p></center>
					<center><p class="card-text text-white">Rate of Recovery :    ${ratereco} per day</p></center>
				</div>
			</div>
		</div>

		<div class="col-7">
			<img src="photos/country/${code}.jpg" class="charts" style="height: 365px; width: 100%;">

		</div>


	</div>
</div>

	<div class="jumbotron p-2 jumbotron-fluid">
		<center><h1 class="text-white"style="text-shadow: 2px 2px 4px #000000;">Graph for Last 30 Days</h1></center>
		<div id="monthlyChart" class="charts" style="height: 400px; width: 100%;"></div>

	</div>
	
	<div class="text-center">
						<a href="/countrymore?name=${Country_Name}"><button class="btn btn-info btn-lg charts" style="font-size:35px; height:150px; width:200px;" >More Graphs</button></a>
					</div>
	
<div class="jumbotron prediction">
			<h1 class="display-4"style="text-shadow: 2px 2px 4px #000000;"><center>Prediction Model<center></h1>
			<center><p class="lead"style="text-shadow: 2px 2px 4px #000000;">This prediction model is based on the previous data and the 
			rate of the data that keeps on changing.<br/> It won't be accurate but will give 
			an overview for the audience about the near future in accordance with the 
			present.</p></center>
			<hr class="my-4">
			<center><p style="text-shadow: 2px 2px 4px #000000;">To predict the data for next seven days, Click the button below </p></center>
					<div class="text-center">
						<a href="/prediction" target="_blank"><button class="btn btn-warning btn-lg charts" style="font-size:60px; height:110px; width:280px;" >Predict</button></a>
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

var ccc = parseInt(document.getElementById("totconf").innerHTML);
document.getElementById("totconf").innerHTML = ccc.toLocaleString();

var ddd = parseInt(document.getElementById("totdead").innerHTML);
document.getElementById("totdead").innerHTML = ddd.toLocaleString();

var rrr = parseInt(document.getElementById("totreco").innerHTML);
document.getElementById("totreco").innerHTML = rrr.toLocaleString();

var ncc = parseInt(document.getElementById("totnewconf").innerHTML);
document.getElementById("totnewconf").innerHTML = ncc.toLocaleString();

var ndd = parseInt(document.getElementById("totnewdead").innerHTML);
document.getElementById("totnewdead").innerHTML = ndd.toLocaleString();

var nrr = parseInt(document.getElementById("totnewreco").innerHTML);
document.getElementById("totnewreco").innerHTML = nrr.toLocaleString();





window.onload = function() 
{
	var month=["Jan","Feb","Mar","Apr","May","Jun"];
	var i=0;
	var j=0;
	var k=0;

	var chart = new CanvasJS.Chart("chartContainer", {
		animationEnabled: true,
		theme: "dark1", // "light1", "light2", "dark1", "dark2"
		backgroundColor: "rgba(122, 191, 175, 0.7)",
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
				
				<c:forEach items="${counconf}" var="con">   
				{ y: <c:out value="${con.value}" />, label: month[i++]},
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
				<c:forEach items="${coundead}" var="rec">    
				{ y: <c:out value="${rec.value}"/>,label: month[j++]},
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
			<c:forEach items="${counreco}" var="dead">     
			{ y: <c:out value="${dead.value}"/>,label: month[k++]},
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
	var monthWorldChart = new CanvasJS.Chart("monthlyChart", {
		animationEnabled: true,
		theme: "dark1",
		backgroundColor: "rgba(48,93,133, 0.7)",
		title:{
			text: "People Affected"
		},
		axisX: {
		      labelFormatter: function (e) {
		        return CanvasJS.formatDate( e.value, "DD MMM");
		      },
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
			<c:forEach items="${lastConf}" var="monthcon">
				{ x:datearr[q++], y: <c:out value="${monthcon}"/> },
			</c:forEach>
			]
		},
		{   yValueFormatString: "#,##,### People", 
			type: "line",
			showInLegend: true,
			color:"rgb(245, 76, 34)",
			name: "Dead",
	      	indexLabelFontSize: 16,
			dataPoints: [
			<c:forEach items="${lastDead}" var="monthdead">
				{ x:datearr[v++], y: <c:out value="${monthdead}"/>},
			</c:forEach>
				
			]
		},
		{   
			yValueFormatString: "#,##,### People",      
			type: "line",
			showInLegend: true,
			color:"rgb(28, 235, 45)",
			name: "Recovered",
	      	indexLabelFontSize: 16,
			dataPoints: [
			<c:forEach items="${lastReco}" var="monthrec">
				{ x:datearr[w++], y: <c:out value="${monthrec}"/> },
			</c:forEach>
				
			]
		}

		]
	});
	monthWorldChart.render();

	


}
</script>
</html>