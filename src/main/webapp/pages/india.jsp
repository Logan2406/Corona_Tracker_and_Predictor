<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
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
<title>India</title>
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
.charts
{
margin: 0 auto;
  border: 1px solid #ccc;
 box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.5), 0 6px 20px 0 rgba(0, 0, 0, 0.5);
  border-radius: 3px/6px;        
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
  height:100px;
  background-color: black;
  color: white;
  text-align: center;
}

</style>
</head>
<body>
<!-- Navigation Bar Start -->
	<nav class="navbar navbar-expand-lg navbar-dark"
		style="background-color: black;">
		<a class="navbar-brand" href=""><img src="photos/logo.png"></a>
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
	<!-- Navigation Bar End -->
	<div class="jumbotron">
		<h1 class="display-2 text-white">
			<img src="https://www.countryflags.io/in/shiny/64.png"> INDIA
		</h1>
		<hr class="my-4">
		<div class="row">
			<div class="col-4">
				<div class="card charts" style="width: 18rem;background-color: rgba(255,133,25,0.9);">
					<div class="card-body text-white">
						<h3 class="card-title text-white">Confirmed Cases</h3>
						<h4 id="totconf">${indconf}</h4>

					</div>
				</div>
			</div>
			<div class="col-4">
				<div class="card charts" style="width: 18rem; background-color:rgba(242,41,41,0.9);">
					<div class="card-body text-white">
						<h3 class="card-title">Dead Cases</h3>
						<h4 id="totdead">${inddead}</h4>
					</div>
				</div>
			</div>

			<div class="col-4">
				<div class="card charts" style="width: 18rem;  background-color: rgba(57,237,105,0.9);">
					<div class="card-body text-white">
						<h3 class="card-title">Recovered Cases</h3>
						<h4 id="totreco">${indreco}</h4>

					</div>
				</div>
			</div>
		</div>
	</div>
	
<center><h2 class ="display-4 text-white  mb-2" style="text-shadow: 2px 2px 4px #000000;">State Details</h2></center>
	<div class="row m-1 mt-2">

		<div class="col-12" style="overflow-y: auto; max-height: 400px;">
			<div class="row">
				<c:forEach items="${states}" var="state">
					<div class="col-3">
						<div class="card charts text-white mb-3"
							style="max-width: 18rem; background-color:rgba(32,176,34,0.8)">
							<div class="card-header">
								<a href="state?name=${state.key}"><button type="button" class="btn btn-success" style="width:100%">
								<h4><c:out value="${state.key}" /></h4>
								</button></a>
							</div>
							<div class="card-body">
								<center><h6 class="card-title">Details</h6></center>
								<div class="card-text">
									<div class="float-left">Confirmed :</div>
									<div class="float-right"><c:out value="${state.value.confirmed}" /></div>
								</div>
								</br>
								<div class="card-text">
									<div class="float-left">Dead :</div>
									<div class="float-right"><c:out value="${state.value.dead}" /></div>
								</div>
								</br>
								<div class="card-text">
									<div class="float-left">Recovered :</div>
									<div class="float-right"><c:out value="${state.value.recovered}" /></div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

<div class="jumbotron">
		<center><h2 class="text-white">New Added cases<h2></center>
				<div class="row mb-0;">
				
			<div class="col-4">
				<div class="card charts p-3 mb-5 rounded float-left"
					style="width: 18rem; height: 150px; background-color: rgba(255,133,25,0.9);">
					<div class="card-body confirmed">
						<center><h3 class="text-white">Confirmed Cases</h3></center>
						<center><h3 id="newtotconf" class="text-white">${newconf}</h3></center>
					</div>
				</div>
			</div>
			<div class="col-4">
				<div class="card charts p-3 mb-5 rounded ml-auto mr-auto"
					style="width: 18rem; height: 150px; background-color:rgba(242,41,41,0.9);">
					<div class="card-body dead">
						<center><h3 class="text-white">Dead Cases</h3></center>
						<center><h3 id="newtotdead" class="text-white">${newdead}</h3></center>
					</div>
				</div>
			</div>
			<div class="col-4">
				<div class="card charts p-3 mb-5 rounded float-right"
					style="width: 18rem; height: 150px; background-color: rgba(57,237,105,0.9);">
					<div class="card-body recovered">
						<center><h3 class="text-white">Recovered Cases</h3></center>
						<center><h3 id="newtotreco" class="text-white">${newreco}</h3></center>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="jumbotron">
		<div class="row">
			<div class="col-12">
				<div id="chartContainer" class="charts"style="height: 700px; width: 100%;"></div>
			</div>

		</div>
				
		
<hr class="my-4">		
		<div class="row">
			<div class="col-6">
				<div id="chartdeadContainer"class="charts" style="height: 700px; width: 100%;"></div>

			</div>

			<div class="col-6">

				<div id="chartrecoContainer"class="charts" style="height: 700px; width: 100%;"></div>
			</div>

		</div>

	</div>

<div class="jumbotron">
		<div id="totalMonthlyChart" class="charts" style="height: 400px; width: 100%;"></div>

	</div>
	
	<div class="text-center">
						<a href="/countrymore?name=India"><button class="btn btn-info btn-lg charts" style="font-size:35px; height:150px; width:200px;" >More Graphs</button></a>
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

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
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

window.onload = function () {

	var ccc = parseInt(document.getElementById("totconf").innerHTML);
	document.getElementById("totconf").innerHTML = ccc.toLocaleString();

	var ddd = parseInt(document.getElementById("totdead").innerHTML);
	document.getElementById("totdead").innerHTML = ddd.toLocaleString();

	var rrr = parseInt(document.getElementById("totreco").innerHTML);
	document.getElementById("totreco").innerHTML = rrr.toLocaleString();

	var newccc = parseInt(document.getElementById("newtotconf").innerHTML);
	document.getElementById("newtotconf").innerHTML = newccc.toLocaleString();

	var newddd = parseInt(document.getElementById("newtotdead").innerHTML);
	document.getElementById("newtotdead").innerHTML = newddd.toLocaleString();

	var newrrr = parseInt(document.getElementById("newtotreco").innerHTML);
	document.getElementById("newtotreco").innerHTML = newrrr.toLocaleString();

	
	var ac=[];
	
	<c:forEach items="${conflist}" var="data">
		ac.push("${data.name}"); 
	</c:forEach>
	var ad=[];
	
	<c:forEach items="${deadlist}" var="data">
		ad.push("${data.name}"); 
	</c:forEach>

	var ar=[];
	<c:forEach items="${recolist}" var="data">
		ar.push("${data.name}"); 
	</c:forEach>

	var i=0;

	var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	theme:"dark1",
	backgroundColor: "rgba(255,133,25,0.9)",
	title:{
		text:"Corona Confirmed per State"
	},
	axisX:{
		interval: 1,
		labelFontSize: 15
	},
	axisY2:{
		labelFontSize: 18,
		interlacedColor: "rgba(1,77,101,.2)",
		gridColor: "rgba(1,77,101,.1)",
		title: "Number of people affected",
			
	},
	data: [{
		yValueFormatString: "#,##,### People",
		color:"#18a118", 
		type: "bar",
		name: "companies",
		axisYType: "secondary",
		dataPoints: [
			<c:forEach items="${conflist}" var="conf">
			{ y:${conf.confirmed}, label:ac[i++]},
			</c:forEach>
		]
	}]
});
chart.render();

i=0;
var deadchart = new CanvasJS.Chart("chartdeadContainer", {
	animationEnabled: true,
	theme:"dark1",
	backgroundColor: "rgba(242,41,41,0.9)",
	title:{
		text:"Corona Dead per State"
	},
	axisX:{
		interval: 1,
		labelFontSize: 15
	},
	axisY2:{
		labelFontSize: 18,
		interlacedColor: "rgba(1,77,101,.2)",
		gridColor: "rgba(1,77,101,.1)",
		title: "Number of people Dead",
			
	},
	data: [{
		yValueFormatString: "#,##,### People",
		color:"#199ac2", 
		type: "bar",
		name: "companies",
		axisYType: "secondary",
		dataPoints: [
			<c:forEach items="${deadlist}" var="conf">
			{ y:${conf.dead}, label:ad[i++]},
			</c:forEach>
		]
	}]
});
deadchart.render();

i=0;
var recochart = new CanvasJS.Chart("chartrecoContainer", {
	animationEnabled: true,
	theme:"dark1",
	backgroundColor: "rgba(17,150,59,0.9)",
	title:{
		text:"Corona Recovered per State"
	},
	axisX:{
		interval: 1,
		labelFontSize: 15
	},
	axisY2:{
		labelFontSize: 18,
		interlacedColor: "rgba(1,77,101,.2)",
		gridColor: "rgba(1,77,101,.1)",
		title: "Number of people Recovered",
			
	},
	data: [{
		yValueFormatString: "#,##,### People",
		color:"#199ac2", 
		type: "bar",
		name: "companies",
		axisYType: "secondary",
		dataPoints: [
			<c:forEach items="${recolist}" var="conf">
			{ y:${conf.recovered}, label:ar[i++]},
			</c:forEach>
		]
	}]
});
recochart.render();


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
		<c:forEach items="${monthlyconf}" var="monthcon">
			{  x:datearr[q++], y: <c:out value="${monthcon}"/> },
		</c:forEach>
		]
	},
	{  
		yValueFormatString: "#,##,### People",       
		type: "line",
		color:"rgb(245, 76, 34)",
		showInLegend: true,
		name: "Dead",
      	indexLabelFontSize: 16,
		dataPoints: [
		<c:forEach items="${monthlydead}" var="monthdead">
			{ x:datearr[w++], y: <c:out value="${monthdead}"/>},
		</c:forEach>
			
		]
	},
	{        
		yValueFormatString: "#,##,### People", 
		type: "line",
		color:"rgb(28, 235, 45)",
		showInLegend: true,
		name: "Recovered",
      	indexLabelFontSize: 16,
		dataPoints: [
		<c:forEach items="${monthlyreco}" var="monthrec">
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