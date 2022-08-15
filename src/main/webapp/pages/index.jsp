<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
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
  margin-top: 50px;;

  height: 80vh;
  border: 1px solid #ccc;
 box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.5), 0 6px 20px 0 rgba(0, 0, 0, 0.5);
  border-radius: 3px/6px;        
}

.prediction
{

	color:#ffffff
}

.rcorners {
  border-radius: 25px;
  border: 5px solid rgba(0, 0, 0, .4); 
  padding: 20px;
}

.confirmed {
	color: #ffffff;
}

.recovered {
	color: #ffffff;
}

.dead {
	color: #ffffff;
}

.header {
	
}

.jumbotron {
    background: none
}

.heading {
	color: #ffffff;
}


.subtext {
	color:#ffffff;
}

.country {
	overflow-y: auto;
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

.table
{
	background-color:#fafafa;
}

.main-content
{
	background-color:#fafafa;
}

.graph
{
	background-color:#ffffff;
}

</style>
<title>Covid-Track</title>
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
	<!-- Navigation Bar End -->

	<!-- Header Start -->
	<div class="jumbotron header">
		<center><h1 class="display-4 heading"style="text-shadow: 2px 2px 4px #000000;">Hello, world!</h1></center>
		<center><p class="lead subtext"style="text-shadow: 2px 2px 4px #000000;">You will get the information regarding the
		COVID-19 which is provided by the WHO.<br/>
		The Stats and reports regarding the people affected and cured is showin with the help of graph</p></center>
		<hr class="my-4">

		<div class="row mb-0;">
			<div class="col-4">
				<div class="card charts p-3 mb-5 rounded float-left"
					style="width: 18rem; height: 150px; background-color: rgba(255,133,25,0.9);">
					<div class="card-body confirmed">
						<center><h3>Total Confirmed</h3></center>
						<center><h3 id="totconf">${confirmed}</h3></center>
					</div>
				</div>
			</div>
			<div class="col-4">
				<div class="card charts p-3 mb-5 rounded ml-auto mr-auto"
					style="width: 18rem; height: 150px; background-color:rgba(242,41,41,0.9);">
					<div class="card-body dead">
						<center><h3>Total Death</h3></center>
						<center><h3 id="totdead">${dead}</h3></center>
					</div>
				</div>
			</div>
			<div class="col-4">
				<div class="card charts p-3 mb-5 rounded float-right"
					style="width: 18rem; height: 150px; background-color: rgba(57,237,105,0.9);">
					<div class="card-body recovered">
						<center><h3>Total Recovered</h3></center>
						<center><h3 id="totreco">${recovered}</h3></center>
					</div>
				</div>
			</div>
		</div>

	</div>
	<!-- Header End -->

	<!-- Main content Start -->

	<div class="container-fluid mt-3 p-3">

		<div class="row">
			
			<div class="col-4 ml-2 charts" style="background-color:rgba(135,46,49,0.7)">
				<center><h4 class="text-white">Country Details</h4></center>
				<input class="form-control" type="text" onkeyup="filter2()"
					placeholder="Search for country" id="searchTable" aria-label="Search">
				<div class="container-fluid p-0 m-0" style="overflow-y: auto; height: 380px;">
				<table class="table mt-3 pl-2" id="gettable" style="background:none;">
					<thead class="thead-dark">
					 
						<tr>
							<th scope="col">Country Name</th>
							<th scope="col">Info</th>
						</tr>
					</thead>
					
					<tbody class="text-white" >
						<c:forEach items="${countries}" var="coun">
						<tr>
							<td class="name font-weight-bold"><c:out value="${coun.name}"/></td>
							<td><a href="country?name=<c:out value="${coun.name}"/>"><button type="button" class="btn btn-success">Info</button></a></td>
						</tr>
						</c:forEach>
					</tbody>
					
				</table>
				</div>

			</div>
			<div class="col-7">
				<div id="chartContainer"class="charts ml-0 pl-0" style="height: 500px; width: 100%;"></div>
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
						<center><h3 id="newtotconf">${newconf}</h3></center>
					</div>
				</div>
			</div>
			<div class="col-4">
				<div class="card charts p-3 mb-5 rounded ml-auto mr-auto"
					style="width: 18rem; height: 150px; background-color:rgba(242,41,41,0.9);">
					<div class="card-body dead">
						<center><h3 class="text-white">Dead Cases</h3></center>
						<center><h3 id="newtotdead">${newdead}</h3></center>
					</div>
				</div>
			</div>
			<div class="col-4">
				<div class="card charts p-3 mb-5 rounded float-right"
					style="width: 18rem; height: 150px; background-color: rgba(57,237,105,0.9);">
					<div class="card-body recovered">
						<center><h3 class="text-white">Recovered Cases</h3></center>
						<center><h3 id="newtotreco">${newreco}</h3></center>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="jumbotron jumbotron-fluid">
		<div class="container">
			<center><h1 class="display-4 text-white"style="text-shadow: 2px 2px 4px #000000;">Some Stats</h1></center>
			<div class ="row">
				<div class="col-4 ">
				<div id="chartConfirmed" class="charts" style="height: 300px; width: 100%;"></div>
				
				</div>
				
				<div class="col-4">
				<div id="chartDead" class="charts" style="height: 300px; width: 100%;"></div>
				
				</div>
				
				<div class="col-4">
				<div id="chartReleased" class="charts" style="height: 300px; width: 100%;"></div>
				
				</div>
			</div>
		</div>
	</div>
	
	<div class="jumbotron p-2 jumbotron-fluid">
		<center><h3 class="display-4 mt-1 p-1 text-white"style="text-shadow: 2px 2px 4px #000000;">Graph for last 30 days</h3></center>
		<div id="totalMonthlyChart" class="charts" style="height: 400px; width: 100%;"></div>
	
	</div>
	<div class="text-center">
						<a href="/worldmore"><button class="btn btn-info btn-lg charts" style="font-size:35px; height:150px; width:200px;" >More Graphs</button></a>
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

	<!-- Main content End -->

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


//filtering countries
function filter2()
    {
      var input = document.getElementById('searchTable');
      var val = input.value.toUpperCase();
      var table = document.getElementById('gettable');
      var body = document.getElementsByTagName('tbody');
      var tr = body[0].getElementsByTagName('tr');

      for(var i =0;i<tr.length;i++)
      {
        var name = tr[i].getElementsByClassName("name");

        if(name[0].innerHTML.toUpperCase().indexOf(val) > -1)
        {
          tr[i].style.display="";
        }

        else
        {
          tr[i].style.display="none";
        }
      }
    }



//ENd

window.onload = function() {

	var month=["Jan","Feb","Mar","Apr","May","Jun"];
	var i=0;
	var j=0;
	var k=0;
	var countrylist=[];
	<c:forEach items="${pilist}" var="list">
		countrylist.push("${list.name}");
	</c:forEach>
	
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
				<c:forEach items="${wmdead}" var="rec">    
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
			<c:forEach items="${wmreco}" var="dead">     
			{ y: <c:out value="${dead.value}"/>,label: month[k++]},
			</c:forEach>
		]
	}
		]
	});
	chart.render();
	i=0;	
	var confirmed = new CanvasJS.Chart("chartConfirmed", {
		animationEnabled: true,
		theme:"dark1",
		backgroundColor: "rgba(33,32,31, 0.9)",
		title:{
			text: "Confirmed Details",
			horizontalAlign: "center"
		},
		data: [{
			type: "doughnut",
			startAngle: 60,
			//innerRadius: 60,
			indexLabelFontSize: 12,
			toolTipContent: "<b>{label}:</b> {y} (#percent%)",
			dataPoints: [

				<c:forEach items="${pilist}" var="confir">
				{ y: <c:out value="${confir.confirmed}"/>,label: countrylist[i++]},
				</c:forEach>
			]
		}]
	});
	confirmed.render();
	i=0;
	var dead = new CanvasJS.Chart("chartDead", {
		animationEnabled: true,
		theme:"dark1",
		backgroundColor: "rgba(33,32,31, 0.9)",
		title:{
			text: "Dead Details",
			horizontalAlign: "center"
		},
		data: [{
			type: "doughnut",
			startAngle: 60,
			//innerRadius: 60,
			indexLabelFontSize: 12,
			//indexLabel: "{label} - #percent%",
			toolTipContent: "<b>{label}:</b> {y} (#percent%)",
			dataPoints: [
				<c:forEach items="${pilist}" var="condead">
				{ y: <c:out value="${condead.dead}"/>,label: countrylist[i++]},
				</c:forEach>
			]
		}]
	});
	dead.render();
	i=0;
	var released = new CanvasJS.Chart("chartReleased", {
		animationEnabled: true,
		theme:"dark1",
		backgroundColor: "rgba(33,32,31, 0.9)",
		title:{
			text: "Recovered Details",
			horizontalAlign: "center"
		},
		data: [{
			type: "doughnut",
			startAngle: 60,
			//innerRadius: 60,
			indexLabelFontSize: 12,
			//indexLabel: "{label} - #percent%",
			toolTipContent: "<b>{label}:</b> {y} (#percent%)",
			dataPoints: [
				<c:forEach items="${pilist}" var="recov">
				{ y: <c:out value="${recov.recovered}"/>,label: countrylist[i++]},
				</c:forEach>
			]
		}]
	});
	released.render();
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
		theme:"dark1",
		backgroundColor: "rgba(48,93,133, 0.9)",
		title:{
			text: ""
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
			<c:forEach items="${monthConfirmed}" var="monthcon">
				{ x:datearr[q++],y: <c:out value="${monthcon}"/> },
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
			<c:forEach items="${monthDead}" var="monthdead">
				{ x:datearr[w++], y: <c:out value="${monthdead}"/>},
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
			<c:forEach items="${monthRecovered}" var="monthrec">
				{ x:datearr[v++], y: <c:out value="${monthrec}"/> },
			</c:forEach>
				
			]
		}

		]
	});
	monthWorldChart.render();
	
		
	function toggleDataSeries(e) {
		if (typeof (e.dataSeries.visible) === "undefined"
				|| e.dataSeries.visible) {
			e.dataSeries.visible = false;
		} else {
			e.dataSeries.visible = true;
		}
		chart.render();
	}
		

	}
</script>


</html>