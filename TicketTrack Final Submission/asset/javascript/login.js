function validateLogin() {

    let username = document.getElementById('username').value.trim();
    let password = document.getElementById('password').value.trim();


    if (username === "" || password === "") {
        alert("Username and password are required.");
        return false;
    }

    let json = { username: username, password: password };
    let data = JSON.stringify(json);

    let xhttp = new XMLHttpRequest();
    xhttp.open('POST', '../controller/logincheck.php', true);
    xhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhttp.send('loginData=' + data);

    xhttp.onreadystatechange = function () {
        if (this.readyState === 4) {
            if (this.status === 200) {
                let response = JSON.parse(this.responseText);
                alert(response.message);

                if (response.success) {
                    if (response.usertype === 'traveller') {
                        window.location.href = "../view/Traveller_menu.php";
                    } else if (response.usertype === 'admin') {
                        window.location.href = "../view/Admin_menu.php";
                    } else if (response.usertype === 'operator') {
                        window.location.href = "../view/Operator_menu.php";
                    }
                }
            } else {
                alert("An error occurred. Status: " + this.status);
            }
        }
    };

    return false;
}


document.getElementById('revealPassword').addEventListener('click', function () {
    let passwordField = document.getElementById('password');
    if (passwordField.type === 'password') {
        passwordField.type = 'text';
        this.textContent = 'Hide';
    } else {
        passwordField.type = 'password';
        this.textContent = 'Show';
    }
});

