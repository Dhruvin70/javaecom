 function showConfirmation(itemId) {
        // Use SweetAlert to display a confirmation dialog
        Swal.fire({
            title: 'Are you sure?',
            text: 'You won\'t be able to revert this!',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            cancelButtonColor: '#3085d6',
            confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
            if (result.isConfirmed) {
                // If user clicks 'Yes', call the delete function
                deleteFunction(itemId);
            } else {
                // If user clicks 'No', you can handle it here
                Swal.fire('Cancelled', 'Your operation is safe :)', 'info');
            }
        });
    }

    function deleteFunction(itemId) {
        // Use the Fetch API to make an AJAX request
        fetch('http://localhost:8080/jecomproject/deleteItem?id=' + itemId, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
                // Add any other headers as needed
            },
        })
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            // Handle the response from the server
            Swal.fire('Deleted!', data.message, 'success');
            // Reload the page after deletion
            location.reload();
        })
        .catch(error => {
            console.error('Error:', error);
            // Handle error, display an error message, etc.
        });																					
    }
    
    function redirectToAccount(path) {
    setTimeout(function() {
        window.location.href = path;
    }, 500);
}