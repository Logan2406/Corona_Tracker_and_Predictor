<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <title>Covid-19 T&P</title>
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


</style>

  </head>
  <body>
  
  <div class="container-fluid">
    <div class="row">
      <div class="col-6 mr-0" style="padding-left: 100px; padding-top: 50px;">
        <h1 class="display-4 text-white" style="text-shadow: 2px 2px 4px #000000;">Better View for checking the Corona Cases</h1>
        <h5 class="text-white">This website will give you a glance and graphical view of the corona affected people</h5>
        <div class="container-fluid m-0">
        <div class="row">
          <div class="col-5 mt-2  pl-0"> <a href="index"><button type="button" class="btn btn-success charts" style="font-size:30px; height:80px; width:220px;">World Data</button></a> </div>
          <div class="col-5 mt-2 pl-0"> <a href="india"><button type="button" class="btn btn-warning charts"  style="font-size:30px; height:80px; width:220px;">India Data</button></a></div>
        </div> 
        </div>
      </div>
      <div class="col-6 ml-0" style="padding-left: 100px;">
        <img src="photos/data_ana.png" width="80%" height="430px">
      </div>
    
  </div>
  <hr>
</div>
<br/>
<br/>
<div class="container-fluid">

  <center><h3 class="display-4 text-white" style="text-shadow: 2px 2px 4px #000000;">About Us</h3></center>
    <div class="container">
      <div class="row">
        <div class="col-12">
        
        <div class="container d-flex justify-content-center">
        <img src="photos/logo.png" class="charts" style="height:80px; width:300px;" >
       </div>
       <br/>
         <center><p class="text-white" style="text-shadow: 2px 2px 4px #000000;">This Website is made by us for the submisssion of our B.Tech Final Year Project. We all have equally worked 
              on this project with giving our full soul.
              <br/>This project is also dear to us since, through this project we have 
              learnt lots of things. 
          </p>
           </center>
          <br>
  
              <p class="mt-3 ml-5 text-white" style="text-shadow: 2px 2px 4px #000000;">There may be many motives of making of this webiste, but the two major motives which we are listing is below:
              
              </p>

              <ul class="ml-5 text-white" style="text-shadow: 2px 2px 4px #000000;">
               <li> We want to showcase our skills that we were learning. The Final year Project</li>
                

               <li> We want a platform to built so that the people can be aware of this Pandemic and get the results of whole  whole and country also.</li>
              </ul>
         
         </div>
      </div>

    </div>

<hr>
</div>

<div class="container-fluid">
  <center><h3 class="display-4 text-white" style="text-shadow: 2px 2px 4px #000000;">Technolgies Used</h3></center>
  <br/>
  <br/>

  <div class="row">
      <div class="col-6">
        <div class="container">
      <img src ="photos/work1.jpg" class="charts" height="500px" width="100%">
    </div>
      </div>

      <div class="col-6">
   <div class="accordion m-2 charts" id="accordionExample">
  <div class="card">
    <div class="card-header" id="headingOne">
      <h2 class="mb-0">
        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          Java
        </button>
      </h2>
    </div>

    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
      <div class="card-body">
       <div class="row">

            <div class="col-3">
              <img src="photos/java.png" class="pl-3" height="100px" width="55%">
            </div>
            <div class="col-9 mt-2">
                 <h6>Java</h6>
                 <p class="font-italic">The back end of this website is designed with the help of Java.</p>
          </div>  
        </div>
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingTwo">
      <h2 class="mb-0">
        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          HTML
        </button>
      </h2>
    </div>
    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
      <div class="card-body">
        <div class="row">

            <div class="col-3 mt-2">
              <img src="photos/html.png"height="100px" width="60%">
            </div>
            <div class="col-9 mt-4">
                 <h6>HTML</h6>
                  <p class="font-italic">The front end structure is designed with HTML5.</p>
          </div>  
        </div>
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingThree">
      <h2 class="mb-0">
        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          CSS
        </button>
      </h2>
    </div>
    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
      <div class="card-body">
        <div class="row">

            <div class="col-3 mt-2">
              <img src="photos/css.png" class="pl-3" height="100px" width="47%">
            </div>
            <div class="col-9 mt-4">
                 <h6>CSS</h6>
                 <p class="font-italic">The styling is done by CSS3. Placement, coloring and designing comes under styling.</p>
          </div>  
        </div>
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingFour">
      <h2 class="mb-0">
        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
          Javascript
        </button>
      </h2>
    </div>
    <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordionExample">
      <div class="card-body">
        <div class="row">

            <div class="col-3 mt-2">
              <img src="photos/js.png" class="pl-3" height="95px" width="43%">
            </div>
            <div class="col-9 mt-4">
                 <h6>Javascript</h6>
                 <p class="font-italic">The dynamic content and programming on the front part is done with the help of javascript.</p>
          </div>  
        </div>
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingFive">
      <h2 class="mb-0">
        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
          JSP
        </button>
      </h2>
    </div>
    <div id="collapseFive" class="collapse" aria-labelledby="headingFive" data-parent="#accordionExample">
      <div class="card-body">
        <div class="row">

            <div class="col-3 mt-2">
              <img src="photos/jsp.png" class="pl-1" height="85px" width="50%">
            </div>
            <div class="col-9 mt-4">
                 <h6>JSP</h6>
                 <p class="font-italic">JSP is used as java in HTML. It gives the functionality to embbed the java programming in the front end.</p>
          </div>  
        </div>
      </div>
    </div>
  </div>

</div>
      </div>

  </div>

  <hr class="my-4">
  <div class="row">

      <div class="col-6">

       <div class="accordion m-2 charts" id="accordiontwoExample">
  <div class="card">
    <div class="card-header" id="headingSix">
      <h2 class="mb-0">
        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseSix" aria-expanded="true" aria-controls="collapseSix">
          Tensorflow.js
        </button>
      </h2>
    </div>

    <div id="collapseSix" class="collapse show" aria-labelledby="headingSix" data-parent="#accordiontwoExample">
      <div class="card-body">
       <div class="row">

            <div class="col-3 mt-2">
              <img src="photos/ts.png" class="pl-1" height="100px" width="60%">
            </div>
            <div class="col-9 mt-4">
                 <h6>Tensorflow.js</h6>
                 <p class="font-italic">The styling is done by CSS3. Placement, coloring and designing comes under styling.</p>
          </div>  
        </div>
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingSeven">
      <h2 class="mb-0">
        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven">
         Spring Boot
        </button>
      </h2>
    </div>
    <div id="collapseSeven" class="collapse" aria-labelledby="headingSeven" data-parent="#accordiontwoExample">
      <div class="card-body">
        <div class="row">

            <div class="col-3">
              <img src="photos/spring.png" class="pl-2" height="90px" width="60%">
            </div>
            <div class="col-9 mt-2">
                 <h6>Spring Boot</h6>
                 <p class="font-italic">The back end of this website is designed with the help of Java.</p>
          </div>  
        </div>
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingEight">
      <h2 class="mb-0">
        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseEight" aria-expanded="false" aria-controls="collapseEight">
          Canvas.js
        </button>
      </h2>
    </div>
    <div id="collapseEight" class="collapse" aria-labelledby="headingEight" data-parent="#accordiontwoExample">
      <div class="card-body">
        <div class="row">

            <div class="col-3 mt-2">
              <img src="photos/canvas.png"height="100px" width="60%">
            </div>
            <div class="col-9 mt-4">
                 <h6>Canvas.js</h6>
                  <p class="font-italic">The front end structure is designed with HTML5.</p>
          </div>  
        </div>
      </div>
    </div>
  </div>
</div>
      </div>
       <div class="col-6">
       <img src ="photos/workplace.jpg" class="charts" height="380px" width="100%">
      </div>


  </div>


<div class="container-fluid">
<hr>
  <center><h3 class="display-4 text-white" style="text-shadow: 2px 2px 4px #000000;">Services</h3></center>
   
     
          <br>
        <center><h5 class="text-white">Here are the services that we are providing</h5></center>
        <br>
  
 <div class="container-fluid d-flex justify-content-center">
      <div class="row ">

        <div class="col-4">
         <div class="card charts" style="width: 18rem;">
  <img src="photos/data_ana.jpg" height ="220px" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Data Analysis</h5>
    <p class="card-text">In our Website you wil see the data is being analysed and visualization of data is also there
                      with showing the data in diiferent types of graphs and charts.</p>
  
  </div>
</div>
        </div>

        <div class="col-4">

          <div class="card charts" style="width: 18rem;">
  <img src="photos/data-sci.jpg" height ="220px"class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Data Prediction</h5>
    <p class="card-text">There is a facility of predicting the confirmed cases for all the Countries, and States of India. It helps in analysing how the pandemic is going to affect next.</p>
  
  </div>
</div>
        </div>

        <div class="col-4">

          <div class="card charts" style="width: 18rem;">
  <img src="photos/resapi.jpg" height ="220px" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Rest Api Services</h5>
    <p class="card-text">Since in many website and sources the data are not providing in correct manner. We are providing them after filtering and then preocessing.</p>
  
  </div>
</div>
        </div>



      </div>

      </div>

    </div>
<br>
    <hr>
<div class="container-fluid">
 <center><h3 class="display-4 text-white" style="text-shadow: 2px 2px 4px #000000;">Team</h3></center>
  <div class="row">
    
      <div class="col-12">
        <br><center><h4 class="text-white">We are the people behind this website</h4></center>
      <br>
    </div>
  </div>

<div class="container d-flex ">
  <div class="row">

   
    <div class="col-6">
      <div class="container charts" style="background-color: rgba(3,29,71,0.9);">
        <div class="row">
            <div class="p-0 pl-1 pt-1 pb-1 col-5">
              <img src="photos/jp.jpg" height="150px" width="80%" class="rounded-circle" alt="Cinque Terre">
            </div>
            <div class="pl-5 pt-2 col-7 text-white">
              <h5>Jyoti Pravo Pal</h5>
              <p>Developed Back-End</p>
              <hr>
              <p>B.Tech CSE<br/>
              Final Year BPPIMT
              </p>
            </div>
        </div>
      </div>
  </div>

  <div class="col-6">
   <div class="container charts" style="background-color: rgba(3,29,71,0.9);">
        <div class="row">
            <div class="p-0 pl-1 pt-1 pb-1 col-5">
              <img src="photos/bs.jpg" height="150px" width="80%" class="rounded-circle" alt="Cinque Terre">
            </div>
            <div class="pl-5 pt-2 col-7 text-white">
              <h5>Basundhara Saha</h5>
              <p>Designed Front-End</p>
              <hr>
             <p>B.Tech CSE<br/>
              Final Year BPPIMT
              </p>
            </div>
        </div>
      </div>

  </div>
</div>
</div>
<br>
<br>

<div class="container">
<div class="row">

    
    <div class="col-6">
<div class="container charts" style="background-color: rgba(3,29,71,0.9);">
        <div class="row">
            <div class="p-0 pt-1 pl-1 pb-1 col-5">
              <img src="photos/ak.jpg" height="150px" width="80%" class="rounded-circle" alt="Cinque Terre">
            </div>
            <div class="pl-5 pt-2 col-7 text-white">
              <h5>Anindya Kishore Roy</h5>
              <p>Data Collection and Filtering</p>
              <hr>
              <p>B.Tech CSE<br/>
              Final Year BPPIMT
              </p>

            </div>
        </div>
      </div>  </div>

  <div class="col-6">
    <div class="container charts" style="background-color: rgba(3,29,71,0.9);">
        <div class="row">
            <div class="p-0 pt-1 pl-1 pb-1 col-5">
              <img src="photos/dp.jpg" height="150px" width="75%" class="rounded-circle" alt="Cinque Terre">
            </div>
            <div class="pl-5 pt-2 col-7 text-white">
              <h5>Dipika Paul</h5>
              <p>Data Collection and Filtering</p>
              <hr>
              <p>B.Tech CSE<br/>
              Final Year BPPIMT
              </p>
            </div>
        </div>
      </div>
  </div>
</div>
</div>
</div>
<br>
<hr>
<div class="container-fluid">
 <center><h3 class="display-4 text-white" style="text-shadow: 2px 2px 4px #000000;">FAQs</h3></center>
 <div class="accordion m-2 charts" id="accordionthreeExample">
  <div class="card">
    <div class="card-header" id="headingOneone">
      <h2 class="mb-0">
        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOneone" aria-expanded="true" aria-controls="collapseOneone">
          What is Corono Virus ?
        </button>
      </h2>
    </div>

    <div id="collapseOneone" class="collapse show" aria-labelledby="headingOneone" data-parent="#accordionthreeExample">
      <div class="card-body">
       <div class="row">

            <div class="col-12">
              <p>Corona viruses are a large family of viruses which may cause illness
in animals or humans. In humans, several coronaviruses are known
to cause respiratory infections ranging from the common cold to more
severe diseases such as Middle East Respiratory Syndrome (MERS)
and Severe Acute Respiratory Syndrome (SARS). The most recently
discovered coronavirus causes coronavirus disease COVID-19. </p>
            </div>
        </div>
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingTwotwo">
      <h2 class="mb-0">
        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseTwotwo" aria-expanded="false" aria-controls="collapseTwotwo">
          What is COVID 19 ?
        </button>
      </h2>
    </div>

    <div id="collapseTwotwo" class="collapse" aria-labelledby="headingTwotwo" data-parent="#accordionthreeExample">
      <div class="card-body">
       <div class="row">

            <div class="col-12">
              <p>COVID-19 is the infectious disease caused by the most recently
discovered corona virus. This new virus and disease were unknown
before the outbreak began in Wuhan, China, in December 2019. </p>
            </div>
        </div>
      </div>
    </div>
  </div>
    <div class="card">
    <div class="card-header" id="headingThreethree">
      <h2 class="mb-0">
        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseThreethree" aria-expanded="false" aria-controls="collapseThreethree">
          What are the symptoms of COVID 19 ?
        </button>
      </h2>
    </div>

    <div id="collapseThreethree" class="collapse" aria-labelledby="headingThreethree" data-parent="#accordionthreeExample">
      <div class="card-body">
       <div class="row">

            <div class="col-12">
              <p>People with COVID-19 have had a wide range of symptoms reported – ranging from mild symptoms to severe illness. Symptoms may appear 2-14 days after exposure to the virus. People with these symptoms may have COVID-19:</p>
              <ul>
                  <li>Fever or chills</li>
                  <li>Cough</li>
                  <li>Shortness of breath or difficulty breathing</li>
                  <li>Fatigue</li>
                  <li>Muscle or body aches</li>
                  <li>Headache</li>
                  <li>New loss of taste or smell</li>
                  <li>Sore throat</li>
                  <li>Congestion or runny nose</li>
                  <li>Nausea or vomiting</li>
                  <li>Diarrhea</li>


              </ul>
            </div>
        </div>
      </div>
    </div>

  </div>
<div class="card">
    <div class="card-header" id="headingFourfour">
      <h2 class="mb-0">
        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseFourfour" aria-expanded="false" aria-controls="collapseFourfour">
          What are the preventions for COVID-19 ?
        </button>
      </h2>
    </div>

    <div id="collapseFourfour" class="collapse" aria-labelledby="headingFourfour" data-parent="#accordionthreeExample">
      <div class="card-body">
       <div class="row">

            <div class="col-12">
              <h4>Wash your hands often</h4>
              <ul>
                  <li>
                    Wash your hands often with soap and water for at least 20 seconds especially after you have been in a public place, or after blowing your nose, coughing, or sneezing.
                  </li>
                  <li>
                    If soap and water are not readily available, use a hand sanitizer that contains at least 60% alcohol. Cover all surfaces of your hands and rub them together until they feel dry.
                  </li>
                  <li>
                    Avoid touching your eyes, nose, and mouth with unwashed hands.
                  </li>
              </ul>

              <h4>Avoid close contact</h4>
              <ul>
                  <li>
                  Avoid close contact with people who are sick, even inside your home. If possible, maintain 6 feet between the person who is sick and other household members.
                  </li>
                  <li>
                    Put distance between yourself and other people outside of your home.
                  </li>
              </ul>
              <h4>Cover your mouth and nose with a cloth face cover when around others</h4>
              <h4>Cover coughs and sneezes</h4>
              <ul>
                <li>
                If you are around others and do not have on your cloth face covering, remember to always cover your mouth and nose with a tissue when you cough or sneeze or use the inside of your elbow and do not spit.</li>
                <li>Throw used tissues in the trash.</li>
                <li>
                Immediately wash your hands with soap and water for at least 20 seconds. If soap and water are not readily available, clean your hands with a hand sanitizer that contains at least 60% alcohol.
              </li>
              </ul>
              <h4>Clean and disinfect</h4>
              <ul>
                <li>Clean AND disinfect frequently touched surfaces daily. This includes tables, doorknobs, light switches, countertops, handles, desks, phones, keyboards, toilets, faucets, and sinks.</li>
                <li>If surfaces are dirty, clean them. Use detergent or soap and water prior to disinfection.</li>
                <li>Then, use a household disinfectant. Most common EPA-registered household disinfectantsexternal icon will work.</li>
              </ul>
              <h4>Monitor Your Health</h4>
              <ul>
                <li>Be alert for symptoms. Watch for fever, cough, shortness of breath, or other symptoms of COVID-19.</li>
                <li>Take your temperature if symptoms develop.</li>
              </ul>
            </div>
        </div>
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingFivefive">
      <h2 class="mb-0">
        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseFivefive" aria-expanded="false" aria-controls="collapseFivefive">
          The APIs we providing
        </button>
      </h2>
    </div>

    <div id="collapseFivefive" class="collapse" aria-labelledby="headingFivefive" data-parent="#accordionthreeExample">
      <div class="card-body">
       <div class="row">

            <div class="col-12">
              <h5>Getting World Total Confirmed, Dead and Recovered Cases</h5>
              <p><i>localhost:8083/world</i></p>
                <br/>
              <h5>Getting All the countries Confirmed, Dead and Recovered Cases</h5>
              <p><i>localhost:8083/countries</i></p>
            
            <br>
            <h5>Getting Country wise Confirmed, Dead and Recovered Cases</h5>
              <p><i>localhost:8083/country/{county_name}</i></p>
              <br>
              <h5>Getting India's Total Confirmed, Dead and Recovered Cases</h5>
              <p><i>localhost:8083/indiaData</i></p>
              <br>
              <h5>Getting All the States Confirmed, Dead and Recovered Cases</h5>
              <p><i>localhost:8083/getAllStates</i></p>
              <br/>
               <h5>Getting State wise Confirmed, Dead and Recovered Cases</h5>
              <p><i>localhost:8083/indiaData/{state_name}</i></p>
              <br/>

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
  </body>
</html>