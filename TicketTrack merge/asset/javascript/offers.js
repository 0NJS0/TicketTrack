function validateOffer() {
    let title = document.getElementById("title").value.trim();
    let description = document.getElementById("description").value.trim();
    let startDate = document.getElementById("startdate").value;
    let endDate = document.getElementById("enddate").value;
    let amount = document.getElementById("amount").value;


    if (!title || !description || !startDate || !endDate || !amount) {
        alert("All fields are required.");
        return false;
    }

    if (new Date(startDate) > new Date(endDate)) {
        alert("Start Date cannot be later than End Date.");
        return false;
    }

    if (amount <= 0) {
        alert("Discount Amount must be a positive number.");
        return false;
    }

    let formData = {
        title: title,
        description: description,
        start_date: startDate,
        end_date: endDate,
        amount: amount
    };

    let xhttp = new XMLHttpRequest();
    let data= JSON.stringify(formData);
    xhttp.open("POST", "../controller/offercheck.php", true);
    xhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhttp.send("formData="+data);
    xhttp.onreadystatechange = function () {
        if (xhttp.readyState === 4 && xhttp.status === 200) {
            let response = JSON.parse(this.responseText);
            if (response.success) {
                alert("Offer added successfully!");
                location.reload(); 
            } else {
                alert("Error: " + response.message);
            }
        }
    };

    return false;
}