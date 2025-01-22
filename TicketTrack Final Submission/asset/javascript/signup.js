
function validateForm() {
    let username = document.getElementById('username').value.trim();
    let fullname = document.getElementById('fullname').value.trim();
    let email = document.getElementById('email').value.trim();
    let phone = document.getElementById('phone').value.trim();
    let dob = document.getElementById('dob').value;
    let password = document.getElementById('password').value;
    let confirmPassword = document.getElementById('confirmPassword').value;
    let accountType = document.querySelector('input[name="type"]:checked');
    let securityQuestion = document.getElementById('security_question').value.trim();
    let securityAnswer = document.getElementById('security_answer').value.trim();

    let currentDate = new Date();
    let birthDate = new Date(dob);
    let age = currentDate.getFullYear() - birthDate.getFullYear();
    let monthDifference = currentDate.getMonth() - birthDate.getMonth();
    if (monthDifference < 0 || (monthDifference === 0 && currentDate.getDate() < birthDate.getDate())) {
        age--;
    }


    let errors = [];





    if (username === "") {
        errors.push("Username cannot be empty.");
    } else if (username.length < 2) {
        errors.push("Username must be at least 2 characters long.");
    } else {
        let firstChar = username.charAt(0);
        if (!(firstChar >= 'a' && firstChar <= 'z' || firstChar >= 'A' && firstChar <= 'Z')) {
            errors.push("The first character of the username must be a letter.");
        }

        for (let i = 0; i < username.length; i++) {
            let char = username.charAt(i);
            if (!(char >= 'a' && char <= 'z' || char >= 'A' && char <= 'Z')) {
                errors.push("Username can only contain letters.");
                break;
            }
        }
    }






    if (fullname === "") {
        errors.push("Fullname cannot be empty.");
    } else if (fullname.length < 3 || fullname.length > 100) {
        errors.push("Full name must be between 3 and 100 characters long.");
    }






    if (email === "") {
        errors.push("Email cannot be empty.");
    } else {
        let atFound = false;
        let dotFound = false;
        for (let i = 0; i < email.length; i++) {
            let char = email.charAt(i);
            if (char === '@') {
                if (atFound) {
                    errors.push("Invalid email format.");
                    break;
                }
                atFound = true;
            } else if (char === '.') {
                if (dotFound) {
                    errors.push("Invalid email format.");
                    break;
                }
                dotFound = true;
            }
        }
        if (!atFound || !dotFound) {
            errors.push("Invalid email format.");
        }
    }






    if (phone === "") {
        errors.push("Phone number cannot be empty.");
    } else if (phone.length !== 11) {
        errors.push("Phone number must be exactly 11 digits long.");
    } else {
        let validPrefixes = ['013', '014', '015', '016', '017', '018', '019'];
        let prefix = phone.substring(0, 3);
        if (!validPrefixes.includes(prefix)) {
            errors.push("Phone number must start with a valid Bangladeshi prefix.");
        }
    }






    if (dob === "") {
        errors.push("Date of birth cannot be empty.");
    } else if (age < 13) {
        errors.push("You must be at least 13 years old to register.");
    }

    if (password === "") {
        errors.push("Password cannot be empty.");
    } else if (password.length < 8) {
        errors.push("Password must be at least 8 characters long.");
    }






    let hasUppercase = false;
    let hasLowercase = false;
    let hasNumber = false;

    for (let i = 0; i < password.length; i++) {
        let char = password.charAt(i);

        if (char >= 'A' && char <= 'Z') {
            hasUppercase = true;
        } else if (char >= 'a' && char <= 'z') {
            hasLowercase = true;
        } else if (char >= '0' && char <= '9') {
            hasNumber = true;
        }
    }

    if (!hasUppercase || !hasLowercase || !hasNumber) {
        errors.push("Password must contain at least one uppercase letter, one lowercase letter, and one number.");
    }

    if (password !== confirmPassword) {
        errors.push("Passwords do not match.");
    }

    if (!accountType) {
        errors.push("Please select an account type.");
    }

    if (securityQuestion === "") {
        errors.push("Please select a security question.");
    }
    if (securityAnswer === "") {
        errors.push("Please provide an answer to the security question.");
    }



    if (errors.length > 0) {
        displayErrors(errors);
        return false;
    }

    let xhttp = new XMLHttpRequest();
    
    let jsonData = {
        username: username,
        fullname: fullname,
        email: email,
        phone: phone,
        dob: dob,
        password: password,
        type: accountType.value,
        security_question: securityQuestion,
        security_answer: securityAnswer,
    };


    let data= JSON.stringify(jsonData);
    xhttp.open('POST', '../controller/signupCheck.php', true);
    xhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhttp.send('signupData='+ data);

    xhttp.onreadystatechange = function () {
        if (this.readyState === 4) {
            let response = JSON.parse(this.responseText);
            if (this.status === 200 && response.success) {
                alert('Registration successful!');
                window.location.href = '../view/login.html';
            } else {
                alert(response.message);
            }
        }
    };

    return false;
}


function displayErrors(errors) {
    let errorMessages = errors.join("\n"); 
    alert(errorMessages); 
}

