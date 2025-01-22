<?php
    session_start();
    if(!isset($_COOKIE['status'])){
      header('location: ./login.html');  
     }
?>
<html>
<head>
    <title>search bus</title>
    <link rel="stylesheet"   href="../asset/css/styleSearchBus.css">

</head>
<body>

<!-- <form  onsubmit="return false;"> -->

<form method="post" action="../controller/searchBusCheck.php" onsubmit="return ValidateSearchRouteJavaScript()">      
            <fieldset>
             <legend>Search Bus</legend> 
             <p ><b><h4>Select Bus Route</h4></b></p>

     <!-- Pickup location -->
<input type="text" value="Enter Pickup location" placeholder="Enter Pickup location">
<!-- <select id="pickup-location-select" onsubmit="ajaxSearchBus()"> -->
<select id="pickup-location-select" name="Pickup_location">

    <option value="dhaka">dhaka</option>
    <option value="ctg">ctg</option>
    <option value="Cox Bazar">Cox Bazar</option>
    <option value="mym">mym</option>
    <option value="Sylhet">Sylhet</option>
</select>

<!-- Destination location -->
<input type="text" value="Enter Destination location" placeholder="Enter Destination location">
<!-- <select id="destination-location-select" onsubmit="ajaxSearchBus()"> -->
    <select id="destination-location-select" name="Destination_location">

    <option value="dhaka">dhaka</option>
    <option value="ctg">ctg</option>
    <option value="Cox Bazar">Cox Bazar</option>
    <option value="mym">mym</option>
    <option value="Sylhet">Sylhet</option>
</select>

<!-- Bus class -->
<!-- <select id="bus-class" onsubmit="ajaxSearchBus()"> -->
<select  id="bus-class" name="selectBusClass">
    <option value="Ac_Business">Ac-Business</option>
    <option value="Ac_Sleeper">Ac-Sleeper</option>
    <option value="Ac_Seater">Ac-Seater</option>
    <option value="Non-Ac">Non-Ac</option>
</select><br>
<span id="Selection_Error"></span>

                <br>
                <div align="left">
                <input type="submit" name="Submit" value="Proceed" >
                <!-- <button type="button" name="Submit" onclick="SearchRouteAjax()">Proceed</button> -->
                

                </div>
                <div align="right">
                    <a href="Traveller_menu.php">Back</a>
                </div>
                <!-- <div align="center">
                    <a href="searchBusList.php">go to bus list</a>
                </div> -->

            </fieldset>
        </form>
         <!-- Ajax requested result -->
        <!-- <div id="result"></div> -->
        <script src="../asset/javascript/validation.js"></script>

        <!-- jason  requsted result table -->
        <!-- <table id="resultPicup"></table>
        <table id="resultDestination"></table>
        <table id="resultBusClass"></table>
      -->



        
</body>
</html>