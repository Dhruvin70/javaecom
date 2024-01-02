/**
 * 
 */
function changeData(fieldId) {
	// Prompt the user to enter new data
	var currentData = document.getElementById(fieldId).innerText;
	if (fieldId === 'userEmail') {
		var newData = prompt("Enter a new email address:", currentData);
		if (!isValidEmail(newData)) {
			alert("Invalid email address. Please enter a valid email.");
			return;
		}
	} else {
		var newData = prompt("Enter new data:", currentData);
	}

	// Update the displayed data if new data is provided
	if (newData !== null && newData !== "") {
		document.getElementById(fieldId).innerText = newData;
	}
}

// Function to validate email address using a simple regular expression
function isValidEmail(email) {
	var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
	return emailRegex.test(email);
}
