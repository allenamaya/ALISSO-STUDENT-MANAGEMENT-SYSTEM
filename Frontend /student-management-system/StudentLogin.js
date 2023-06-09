// JavaScript code for student login/signup

// Get the student login form element
const studentLoginForm = document.getElementById('student-login-form');

// Add event listener to the student login form submit event
studentLoginForm.addEventListener('submit', (event) => {
  event.preventDefault(); // Prevent the form from submitting

  // Get the input values
  const username = document.getElementById('student-username').value;
  const password = document.getElementById('student-password').value;

  // Perform any necessary validation or processing here

  // Send the login request to the server
  // You can use fetch or any other AJAX library
  fetch('/student-login', {
    method: 'POST',
    body: JSON.stringify({ username, password }),
    headers: {
      'Content-Type': 'application/json'
    }
  })
    .then((response) => {
      if (response.ok) {
        // Login successful, redirect to the student dashboard
        window.location.href = '/student-dashboard';
      } else {
        // Login failed, display error message
        alert('Invalid username or password. Please try again.');
      }
    })
    .catch((error) => {
      console.error('An error occurred during student login:', error);
    });
});

// Get the student signup form element
const studentSignupForm = document.getElementById('student-signup-form');

// Add event listener to the student signup form submit event
studentSignupForm.addEventListener('submit', (event) => {
  event.preventDefault(); // Prevent the form from submitting

  // Get the input values
  const username = document.getElementById('student-username').value;
  const password = document.getElementById('student-password').value;
  const email = document.getElementById('student-email').value;

  // Perform any necessary validation or processing here

  // Send the signup request to the server
  // You can use fetch or any other AJAX library
  fetch('/student-signup', {
    method: 'POST',
    body: JSON.stringify({ username, password, email }),
    headers: {
      'Content-Type': 'application/json'
    }
  })
    .then((response) => {
      if (response.ok) {
        // Signup successful, redirect to the student dashboard
        window.location.href = '/student-dashboard';
      } else {
        // Signup failed, display error message
        alert('Signup failed. Please try again.');
      }
    })
    .catch((error) => {
      console.error('An error occurred during student signup:', error);
    });
});
