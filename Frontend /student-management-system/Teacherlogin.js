// JavaScript code for teacher login/signup

// Get the teacher login form element
const teacherLoginForm = document.getElementById('teacher-login-form');

// Add event listener to the teacher login form submit event
teacherLoginForm.addEventListener('submit', (event) => {
  event.preventDefault(); // Prevent the form from submitting

  // Get the input values
  const username = document.getElementById('teacher-username').value;
  const password = document.getElementById('teacher-password').value;

  // Perform any necessary validation or processing here

  // Send the login request to the server
  // You can use fetch or any other AJAX library
  fetch('/teacher-login', {
    method: 'POST',
    body: JSON.stringify({ username, password }),
    headers: {
      'Content-Type': 'application/json'
    }
  })
    .then((response) => {
      if (response.ok) {
        // Login successful, redirect to the teacher dashboard
        window.location.href = '/teacher-dashboard';
      } else {
        // Login failed, display error message
        alert('Invalid username or password. Please try again.');
      }
    })
    .catch((error) => {
      console.error('An error occurred during teacher login:', error);
    });
});

// Get the teacher signup form element
const teacherSignupForm = document.getElementById('teacher-signup-form');

// Add event listener to the teacher signup form submit event
teacherSignupForm.addEventListener('submit', (event) => {
  event.preventDefault(); // Prevent the form from submitting

  // Get the input values
  const username = document.getElementById('teacher-username').value;
  const password = document.getElementById('teacher-password').value;
  const email = document.getElementById('teacher-email').value;

  // Perform any necessary validation or processing here

  // Send the signup request to the server
  // You can use fetch or any other AJAX library
  fetch('/teacher-signup', {
    method: 'POST',
    body: JSON.stringify({ username, password, email }),
    headers: {
      'Content-Type': 'application/json'
    }
  })
    .then((response) => {
      if (response.ok) {
        // Signup successful, redirect to the teacher dashboard
        window.location.href = '/teacher-dashboard';
      } else {
        // Signup failed, display error message
        alert('Signup failed. Please try again.');
      }
    })
    .catch((error) => {
      console.error('An error occurred during teacher signup:', error);
    });
});
