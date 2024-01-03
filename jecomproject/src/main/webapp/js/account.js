/**
 * 
 */
function changeData(fieldId, userId) {
	// Prompt the user to enter new data
	var currentData = document.getElementById(fieldId).innerText;
	if (fieldId === 'email') {
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
		updateDatabase(fieldId, newData, userId);

	}
}

function updateDatabase(fieldId, newData, userId) {
	// Use XMLHttpRequest or fetch API to make an AJAX call
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "/jecomproject/editUserProfile", true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr.onreadystatechange = function() {
		 if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                console.log("Database updated successfully");

                // Reload the page after a successful update
                location.reload();
            } else {
                console.error("Failed to update database");
            }
        }
	};

	// Send data to the server
	var data = "fieldId=" + fieldId +
           "&newData=" + newData +
           "&uid=" + userId;
	xhr.send(data);
}

// Function to validate email address using a simple regular expression
function isValidEmail(email) {
	var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
	return emailRegex.test(email);
}
