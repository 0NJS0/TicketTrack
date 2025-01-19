
function validateForm() {
    let question = document.getElementById('question').value.trim();
    let answer = document.getElementById('answer').value.trim();
    let type = document.querySelector('input[name="type"]:checked');
    let user_type = document.querySelector('input[name="user_type"]:checked');


    let errors = [];





    if (question === "") {
        errors.push("Question Field cannot be empty.");
    }

    if (answer === "") {
        errors.push("Answewr Field cannot be empty.");
    }

    if (type === "") {
        errors.push("Please Select Type of Question");
    }

    if (user_type === "") {
        errors.push("Select User Type");
    }





    if (errors.length > 0) {
        displayErrors(errors);
        return false;
    }


    
    let jsonData = {
        question: question,
        answer: answer,
        type: type.value,
        user_type: user_type.value
    };

    let xhttp = new XMLHttpRequest();
    let data= JSON.stringify(jsonData);
    xhttp.open('POST', '../controller/addFAQ.php', true);
    xhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhttp.send('signupData='+ data);

    xhttp.onreadystatechange = function () {
        if (this.readyState === 4) {
            let response = JSON.parse(this.responseText);
            if (this.status === 200 && response.success) {
                alert('FAQ Submitted successful!');
                location.reload(); 
            } else {
                alert(response.message || "An error occurred.");
            }
        }
    };

    return false;
}


function displayErrors(errors) {
    let errorMessages = errors.join("\n"); 
    alert(errorMessages); 
}
