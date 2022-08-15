<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">


<title>${name}</title>
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

<script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@0.6.1"></script>
<script>
         const nr_epochs=2048;  // higher=better but slower
         var tfinterface;
         const model = tf.sequential();
             
         function initTF() {
         

         // 1. TRAINING DATA - learn this 10x table
               const xs = tf.tensor2d([1,2,3,4,5,6,7,8], [8,1]);
               var y =[];
               
               <c:forEach items="${preconf}" var="conf">
   					y.push("${conf}");
   				</c:forEach>

                for(a=0;a<8;a++)
                {
                    console.log(y[a]);
                }
               const ys = tf.tensor2d(y, [8,1]);
         
         
         
         // 2. ML MODEL - linear regression model
               model.add(tf.layers.dense({units: 1, inputShape: [1]}));
               // Prep for training
               model.compile({loss: 'meanSquaredError', optimizer: 'sgd'});
               
               // train -- the higher the number the more accurate you'll get (but longer run time)
               tfinterface=model.fit(xs,ys,{epochs: nr_epochs});
               var s = formpredict(7);
         }
         
         // 3. WRAPPER AROUND PREDICT
         function predict(n) {
             
               return tfinterface.then(()=> { return model.predict(tf.tensor2d(n,[7,1])); });
         
         }
         
         // Helper for form
         function formpredict(v) {

            var x =[0,0,0,0,0,0,0];

            for (var i = 0; i<v;i++) {
            
              x[i] = 9+i;
           }

            predict(x).then(function(res) {
         //   alert(res.get([0]));

         
         	pred=[];
         	pred.push(Math.round(res.get([0])));
         	pred.push(Math.round(res.get([1])));
         	pred.push(Math.round(res.get([2])));
         	pred.push(Math.round(res.get([3])));
         	pred.push(Math.round(res.get([4])));
         	pred.push(Math.round(res.get([5])));
         	pred.push(Math.round(res.get([6])));
         	
			var pp=0;

            if( ${preconf[6]} > pred[0])
            {
				pp=${preconf[6]} + Math.round((${preconf[6]}-pred[0])/2);
				pred[0]=pp;

            }

			for(var qq =1;(pred[qq]<pred[qq-1]) &&(qq<7);qq++)
			{
				pp= pred[qq-1] + Math.round((pred[qq]-pred[qq])/2);
				pred[qq]=pp;
			}

            
			document.getElementById("one").innerHTML=pred[0];
			document.getElementById("two").innerHTML=pred[1];
			document.getElementById("three").innerHTML=pred[2];
			document.getElementById("four").innerHTML=pred[3];
			document.getElementById("five").innerHTML=pred[4];
			document.getElementById("six").innerHTML=pred[5];
			document.getElementById("seven").innerHTML=pred[6];



			var one = parseInt(document.getElementById("one").innerHTML);
			document.getElementById("one").innerHTML = one.toLocaleString();

			var two = parseInt(document.getElementById("two").innerHTML);
			document.getElementById("two").innerHTML = two.toLocaleString();

			var three = parseInt(document.getElementById("three").innerHTML);
			document.getElementById("three").innerHTML = three.toLocaleString();

			var four = parseInt(document.getElementById("four").innerHTML);
			document.getElementById("four").innerHTML = four.toLocaleString();

			var five = parseInt(document.getElementById("five").innerHTML);
			document.getElementById("five").innerHTML = five.toLocaleString();

			var six = parseInt(document.getElementById("six").innerHTML);
			document.getElementById("six").innerHTML = six.toLocaleString();

			var seven = parseInt(document.getElementById("seven").innerHTML);
			document.getElementById("seven").innerHTML = seven.toLocaleString();
			

			var datearr=[];
		      
		      for(var i =1;i<8;i++)
		      {
		          let toda = new Date();
		          toda.setDate(toda.getDate()+i);
		          datearr.push(toda);
		      }
			
            var chart = new CanvasJS.Chart("chartContainer", {
   animationEnabled: true,
   backgroundColor: "rgba(57,237,105,0.9)",  
   title:{
      text: "Predicting for next Seven Days"
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
      type: "spline",
      yValueFormatString: "#,### People",
		color:"#1c1f1d",
         indexLabelFontSize: 16,
      dataPoints: [
         { x:datearr[0], y:pred[0] },
         { x:datearr[1], y:pred[1] },
         { x:datearr[2], y:pred[2] },
         { x:datearr[3], y:pred[3] },
         { x:datearr[4], y:pred[4] },
         { x:datearr[5], y:pred[5] },
         { x:datearr[6], y:pred[6] }
      ]
   }]
});
chart.render();

document.getElementById("myspin").style.display = "none";


            });  
         }
         
            
      </script>
</head>

<!-- HTML -->

<body onLoad='initTF();'>
	<p>
	<div id='res'><center><h1>${name}</h1></center></div>
	</p>
	<div class="d-flex justify-content-center">
      <div class="spinner-border" id="myspin" style="width: 15rem; height: 15rem;" role="status">
            <span class="sr-only">Loading...</span>
      </div>
      </div>

	<div id="chartContainer" class="charts" style="height: 300px; width: 100%;"></div>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

	<div class="jumbotron jumbotron-fluid charts">
		<div class="container">
			<h1 class="display-4 text-white">Prediction Data</h1>
			<div class="row">
				<div class="col-3">
					<div class="card charts" style="width: 18rem;">
						<div class="card-body p-1">
							<h3 class="card-title">Day 1</h3>
							<h4 id="one"></h4>
						</div>
					</div>
				</div>
				<div class="col-3">
					<div class="card charts" style="width: 18rem;">
						<div class="card-body p-1">
							<h3 class="card-title">Day 2</h3>
							<h4 id="two"></h4>
						</div>
					</div>
				</div>
				<div class="col-3">
					<div class="card charts" style="width: 18rem;">
						<div class="card-body p-1">
							<h3 class="card-title">Day 3</h3>
							<h4 id="three"></h4>
						</div>
					</div>
				</div>
				<div class="col-3">
					<div class="card charts" style="width: 18rem;">
						<div class="card-body p-1">
							<h3 class="card-title">Day 4</h3>
							<h4 id="four"></h4>
						</div>
					</div>
				</div>
			</div>
			<div class="row mt-1">
				<div class="col-3 offset-2">
					<div class="card charts" style="width: 18rem;">
						<div class="card-body p-1">
							<h3 class="card-title">Day 5</h3>
							<h4  id="five"></h4>
						</div>
					</div>
				</div>
				<div class="col-3">
					<div class="card charts" style="width: 18rem;">
						<div class="card-body p-1">
							<h3 class="card-title">Day 6</h3>
							<h4  id="six"></h4>
						</div>
					</div>
				</div>
				<div class="col-3">
					<div class="card charts" style="width: 18rem;">
						<div class="card-body p-1">
							<h3 class="card-title">Day 7</h3>
							<h4  id="seven"></h4>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
		integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
		crossorigin="anonymous"></script>

</body>
</html>