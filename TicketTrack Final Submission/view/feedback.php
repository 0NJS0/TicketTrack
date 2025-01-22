<?php
    session_start();
    if(!isset($_COOKIE['status'])){
      header('location: ./login.html');  
     }
?>

<html>
<head>
    <title>Feedback</title>
    <link rel="stylesheet" href="../asset/css/styleFeedback.css">

</head>
<body>
<form  onsubmit="return false;">
             <fieldset>
             <legend>FEEDBACK</legend> 


            <p>Share Your Experience</p>
            <select id="rates" onsubmit="ajaxFeedback()" >
            <option   value="Excellent">Excellent </option>
            <option  value="Good">Good </option>
            <option  value="Average">Average </option>
            <option  value="Not Good">Not Good </option>
            <option  value="Worst">Worst </option>
            </select>
            <!-- <span id="ratesError"></span> -->





            
            <p>What did you like about our ride?</p>
            <select id="likes" onsubmit="ajaxFeedback()">
            <option value="Driver">Driver</option>
            <option  value="Bus">Bus</option>
            <option  value="Ride">Ride</option>
            <option value="Other">Other</option>
           </select>

            <span id="likesError"></span>

            
                <p>Suggession to improve</p>
             <textarea cols="40" rows="8" name="suggestion" id="suggestion" value="" onsubmit="ajaxFeedback()">  </textarea>   <span id="suggestionError"></span>        <!--comment box--> 
                <div align = "center">

                 
                <button type="button" name="Submit" onclick="validateFeedbackFormAjax() ">Submit</button>

                </div>
                
                </div>
                <div align="right">
                    <a href="Traveller_menu.php">Back</a>
                </div>


            </fieldset>

        </form>
        <!-- Ajax requested result -->
        <div id="result"></div>

        <script src="../asset/javascript/validation.js"></script>
        <!-- jason  requsted result table -->
        <table id="resultRates"></table>
        <table id="resultLikes"></table>
        <table id="resultSuggession"></table>
            
       

</body>

</html>