/**
 * 
 */

// Regular expression for email 
function emailcheck1(email) {
    let atSymbol = email.indexOf("@");
    let dot = email.lastIndexOf('.');

    if (atSymbol < 1)
        return false;

    if (dot <= atSymbol + 3) {
        return false;
    }

    if (dot === email.length - 1)
        return false;
	if ( email.length > 100)
        return false;
    return true;

}

// Regular expression for name 
function nameCheck(str) {
    var regex = /^[a-zA-Z]+ [a-zA-Z]*$/;
    var regex1 = /^[a-zA-Z]*$/;
	
	if(str.length > 50){
		return false;
		}
		
    if (regex.test(str) || regex1.test(str)) {
        return true;
    }
    return false;
}

// Regular expression for location
function locationCheck(str) {
	
	if(str.length <= 500){
		return true;
		}
    return false;
}


// Check email format
function checkEmailFormat() {
    if (document.getElementById('email').value == "") {
        document.getElementById('erremail').innerHTML = "Email field should not be empty.";
        document.getElementById('erremail').style.display = "block";
    }
    else if (emailcheck1(document.getElementById('email').value) == false) {
        document.getElementById('erremail').innerHTML = "Enter valid email.";
        document.getElementById('erremail').style.display = "block";
    }
    else {
        document.getElementById('erremail').style.display = "none";
    }
}

// Check name format
function checkNameFormat() {
    if (document.getElementById('name').value == "") {
        document.getElementById('errname').innerHTML = "Name field should not empty.";
        flag = 1;
        document.getElementById('errname').style.display = "block";
    }
    else if (nameCheck(document.getElementById('name').value) == false) {
        document.getElementById('errname').innerHTML = "  Enter valid name";
        flag = 1;
        document.getElementById('errname').style.display = "block";
    }
    else {
        document.getElementById('errname').style.display = "none";
    }
}

// Check name format
function checkLocationFormat() {
    if (document.getElementById('location').value == "") {
        document.getElementById('errlocation').innerHTML = "Location field should not empty.";
        flag = 1;
        document.getElementById('errlocation').style.display = "block";
    }
    else if (locationCheck(document.getElementById('location').value) == false) {
        document.getElementById('errlocation').innerHTML = "Location should not be more than 500 characters";
        flag = 1;
        document.getElementById('errlocation').style.display = "block";
    }
    else {
        document.getElementById('errlocation').style.display = "none";
    }
}