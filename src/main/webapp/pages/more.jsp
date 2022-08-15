<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

  <head>
    <!-- Required meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta charset="ISO-8859-1">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

    <title>${name}-More Graph</title>
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
    
    	</style>
   
    </head>
  
  <body>
 <center><h1 class="display-4 text-white">Some more graphs and details</h1></center>
    
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
		<br>
		<br>
		<div class="container">
			<center><h3 class="text-white">The Rate for people getting affected and recovered last 3 months</h3></center>
			<div class="row">
				<div class="col-4">
				<div class="card charts" style="width: 18rem;background-color: rgba(255,133,25,0.9);">
					<div class="card-body text-white">
						<h3 class="card-title text-white">Confirmed cases</h3>
						<h4 id="totconf">${confrate} per day</h4>

					</div>
				</div>
				</div>
				
				<div class="col-4">
				<div class="card charts" style="width: 18rem; background-color:rgba(242,41,41,0.9);">
					<div class="card-body text-white">
						<h3 class="card-title">Dead case</h3>
						<h4 id="totdead">${deadrate} per day</h4>
					</div>
				</div>
				</div>
				
				<div class="col-4">
				<div class="card charts" style="width: 18rem;  background-color: rgba(57,237,105,0.9);">
					<div class="card-body text-white">
						<h3 class="card-title">Recovery Cases</h3>
						<h4 id="totreco">${recorate} per day</h4>

					</div>
				</div>
				
				</div>
				
				
			</div>
		</div>

	</div>
    
    <hr class="my-4">
    <div class="jumbotron">
		<div class="row">
			<div class="col-12">
				<div id="chartnewContainer" class="charts"style="height: 700px; width: 100%;"></div>
			</div>

		</div>
<hr class="my-4">		
		<div class="row">
			<div class="col-6">
				<div id="chartnewdeadContainer"class="charts" style="height: 700px; width: 100%;"></div>

			</div>

			<div class="col-6">

				<div id="chartnewrecoContainer"class="charts" style="height: 700px; width: 100%;"></div>
			</div>

		</div>
		<br>
		<br>
		<div class="container">
		<center><h3 class="text-white">The Latest Rate of people getting affected and recovered</h3></center>
			<div class="row">
				<div class="col-4">
				<div class="card charts" style="width: 18rem;background-color: rgba(255,133,25,0.9);">
					<div class="card-body text-white">
						<h3 class="card-title text-white">Confirmed cases</h3>
						<h4 id="totconf">${newconfrate} per day</h4>

					</div>
				</div>
				</div>
				
				<div class="col-4">
				<div class="card charts" style="width: 18rem; background-color:rgba(242,41,41,0.9);">
					<div class="card-body text-white">
						<h3 class="card-title">Dead cases</h3>
						<h4 id="totdead">${newdeadrate} per day</h4>
					</div>
				</div>
				</div>
				
				<div class="col-4">
				<div class="card charts" style="width: 18rem;  background-color: rgba(57,237,105,0.9);">
					<div class="card-body text-white">
						<h3 class="card-title">Recovery Cases</h3>
						<h4 id="totreco">${newrecorate} per day</h4>

					</div>
				</div>
				
				</div>
				
				
			</div>
		</div>

	</div>
    
    

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
  </body>
  
  
  <script>
  window.onload = function () {

	 var datearr=[];
      
      for(var i =${capacity};i>-1;i--)
      {
          let toda = new Date();
          toda.setDate(toda.getDate()-i-1);
          datearr.push(toda);
      } 
      
     var q=0;
     var w=0;
     var e=0;
     var r=0;
     var t=0;

	  
	  var chartconf = new CanvasJS.Chart("chartContainer", {
	  	animationEnabled: true, 
	  	theme:"dark1",
		backgroundColor: "rgba(255,133,25,0.9)", 
	  	title:{
	  		text: "Corona Confirmed Cases"
	  	},
	  	axisX: {
	        labelFormatter: function (e) {
	          return CanvasJS.formatDate( e.value, "DD MMM");
	        },
	      },
	  	axisY: {
	  		title: "People found Confirmed",

	  	},
	  	data: [{
	  		yValueFormatString: "#,### People",
	  		color:"#f5f0f0",
	  		type: "spline",
	  		dataPoints: [
	  			<c:forEach items="${conflist}" var="con">
				{ x:datearr[q++], y: <c:out value="${con}"/> },
			</c:forEach>
	  		]
	  	}]
	  });
	  chartconf.render();


	  var chartdead = new CanvasJS.Chart("chartdeadContainer", {
		  	animationEnabled: true,  
		  	theme:"dark1",
			backgroundColor: "rgba(242,41,41,0.9)",
		  	title:{
		  		text: "Dead Cases due to Corona"
		  	},
		  	axisY: {
		  		title: "People Died",

		  	},
		  	data: [{
		  		yValueFormatString: "#,### People",
		  		color:"#f5f0f0",
		  		type: "spline",
		  		dataPoints: [
		  			<c:forEach items="${deadlist}" var="con">
					{x:datearr[w++], y: <c:out value="${con}"/> },
				</c:forEach>
		  		]
		  	}]
		  });
		  chartdead.render();



		  var chartreco = new CanvasJS.Chart("chartrecoContainer", {
			  	animationEnabled: true,

				theme:"dark1",
				backgroundColor: "rgba(57,237,105,0.9)",  
			  	title:{
			  		text: "Corona Recovered Cases"
			  	},
			  	axisY: {
			  		title: "People Recovered",

			  	},
			  	data: [{
			  		yValueFormatString: "#,### People",
			  		type: "spline",
			  		color:"#f5f0f0",
			  		dataPoints: [
			  			<c:forEach items="${recolist}" var="con">
						{ x:datearr[e++],y: <c:out value="${con}"/> },
					</c:forEach>
			  		]
			  	}]
			  });
			  chartreco.render();



			  var chartnewconf = new CanvasJS.Chart("chartnewContainer", {
				  	animationEnabled: true,
				  	theme:"dark1",
					backgroundColor: "rgba(255,133,25,0.9)",   
				  	title:{
				  		text: "Corona Daily Confirmed Cases"
				  	},
				  	axisY: {
				  		title: "People Affected",

				  	},
				  	data: [{
				  		yValueFormatString: "#,### People",
				  		type: "spline",
				  		color:"#f5f0f0",
				  		dataPoints: [
				  			<c:forEach items="${newconflist}" var="con">
							{ x:datearr[r++], y: <c:out value="${con}"/> },
						</c:forEach>
				  		]
				  	}]
				  });
				  chartnewconf.render();



				  var chartnewdead = new CanvasJS.Chart("chartnewdeadContainer", {
					  	animationEnabled: true,  
					  	theme:"dark1",
						backgroundColor: "rgba(242,41,41,0.9)",
					  	title:{
					  		text: "Corona Daily Dead Cases"
					  	},
					  	axisY: {
					  		title: "People Died due to Corona",

					  	},
					  	data: [{
					  		yValueFormatString: "#,### People",
					  		color:"#f5f0f0",
					  		type: "spline",
					  		dataPoints: [
					  			<c:forEach items="${newdeadlist}" var="con">
								{x:datearr[t++], y: <c:out value="${con}"/> },
							</c:forEach>
					  		]
					  	}]
					  });
					  chartnewdead.render();



					  var chartnewreco = new CanvasJS.Chart("chartnewrecoContainer", {
						  	animationEnabled: true,  
						  	theme:"dark1",
							backgroundColor: "rgba(57,237,105,0.9)",  
						  	title:{
						  		text: "Corona Daily Recovered Cases"
						  	},
						  	axisY: {
						  		title: "People Recovered",

						  	},
						  	data: [{
						  		yValueFormatString: "#,### People",
						  		color:"#f5f0f0",
						  		type: "spline",
						  		dataPoints: [
						  			<c:forEach items="${newrecolist}" var="con">
									{x:datearr[t++], y: <c:out value="${con}"/> },
								</c:forEach>
						  		]
						  	}]
						  });
						  chartnewreco.render();
				  

	  }

  
  </script>
    
</html>