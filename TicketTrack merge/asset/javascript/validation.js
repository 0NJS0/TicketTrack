function validateFeedbackFormJavaScript() {
    let isValid = true;

     
    document.getElementById("suggestionError").innerText ="";

    const suggestion = document.getElementById("suggestion").value; 
    const rate_service = document.getElementById("rates").value; 
    const like_service = document.getElementById("likes").value; 

    if (rate_service==like_service)
        {
        document.getElementById("suggestionError").innerText = " Suggestion  is required.";
        document.getElementById("suggestionError").style.color = " red";
        isValid = false;
        }





    if (structuredClone(suggestion)<2)
    {
    document.getElementById("suggestionError").innerText = " Suggestion  is required.";
    document.getElementById("suggestionError").style.color = " red";
    isValid = false;
    }

     
    return isValid;


    }


    //.................................................


    function validateFeedbackFormAjax() {
         if (!validateFeedbackFormJavaScript() ) return;
 

        const suggestion = document.getElementById("suggestion").value; 
        const rate_service = document.getElementById("rates").value; 
        const like_service = document.getElementById("likes").value; 






 
        const xhttp = new XMLHttpRequest();
        xhttp.open("POST", "../controller/feedbackCheck.php", true);
        xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhttp.onreadystatechange = function() {
            if (this.readyState === 4 && this.status === 200) {
                document.getElementById("result").innerText = this.responseText;
            }
        };
        
        xhttp.send("suggestion=" + suggestion + "&rate="+rate_service + "&like="+like_service +"&Submit=true");
    }








//......................................................................


    function validateRefundFormJavaScript() 
    {
        let isValid2 = true;


        document.getElementById("amountError").innerText = "";
       // const suggestion = document.getElementById("suggestion").value; 

        const amount = document.getElementById("amount").value;
        //const amountNumber=parseFloat(amount);
        if(amount=== "")
        {

            document.getElementById("amountError").innerText = "amount is required.";
            document.getElementById("amountError").style.color = "red";
            isValid2 = false;
        }



     
             
      return isValid2;


    }

    function validateRefundFormAjax() {
        if (! validateRefundFormJavaScript()) return;
 
  
        const amount = document.getElementById("amount").value;

 
        const xhttp = new XMLHttpRequest();
        xhttp.open("POST", "../controller/refundPolicyCheck.php", true);
        xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhttp.onreadystatechange = function() {
            if (this.readyState === 4 && this.status === 200) {
                document.getElementById("result").innerText = this.responseText;
            }
        };
        
        xhttp.send("amount=" + amount +  "&Submit=true");
    }


  
   


    function ValidateSearchRouteJavaScript() {
        let isValid = true;
    
         
        document.getElementById("Selection_Error").innerText ="";
    
        const pickupLocation = document.getElementById("pickup-location-select").value;
        const destinationLocation = document.getElementById("destination-location-select").value;
    
        if (pickupLocation==destinationLocation)
            {
            document.getElementById("Selection_Error").innerText = " Search Different";
            document.getElementById("Selection_Error").style.color = " red";
            isValid = false;
            }
    

    

    
         
        return isValid;
    
    
        }

    function SearchRouteAjax() {

       if(! ValidateSearchRouteJavaScript())return;
        // Retrieve values from the form
        const pickupLocation = document.getElementById("pickup-location-select").value;
        const destinationLocation = document.getElementById("destination-location-select").value;
        const busClass = document.getElementById("bus-class").value;


    
        // Create an XMLHttpRequest object
        const xhttp = new XMLHttpRequest();
        xhttp.open("POST", "../controller/searchBusCheck.php", true);
        xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    
        // Handle server response
        xhttp.onreadystatechange = function() {
            if (this.readyState === 4 && this.status === 200) {
                document.getElementById("result").innerText = this.responseText;
            }
        };
    
        // Send data in the format key=value&key=value
        xhttp.send("Pickup_location=" + pickupLocation +"&Destination_location=" + destinationLocation +"&selectBusClass=" + busClass +"&Submit=true");
    }
    
   