import React, { useState } from 'react';
import { BrowserRouter as Route,BrowserRouter } from 'react-router-dom';
import Home from './/Home';
import Login from './/Login';
import Signup from './/Signup';
import StudentDashboard from './/StudentDashboard';
import TeacherDashboard from './/TeacherDashboard';

function App() {
  const [loggedIn, setLoggedIn] = useState(false);
  const [user, setUser] = useState(null);

  // Function to handle login
  const handleLogin = (username, password, role) => {
    // Perform login logic here, e.g., make an API call to the backend

    // Simulating a successful login for demonstration purposes
    if (role === 'student') {
      // Perform student login logic
      // ...
      const studentUser = {
        username,
        role: 'student',
        // other student user data
      };
      setLoggedIn(true);
      setUser(studentUser);
    } else if (role === 'teacher') {
      // Perform teacher login logic
      // ...
      const teacherUser = {
        username,
        role: 'teacher',
        // other teacher user data
      };
      setLoggedIn(true);
      setUser(teacherUser);
    } else {
      // Handle login failure, e.g., show an error message
      console.log('Invalid role');
    }
  };

  // Function to handle signup
  const handleSignup = (username, password, role) => {
    // Perform signup logic here, e.g., make an API call to the backend

    // Simulating a successful signup for demonstration purposes
    if (role === 'student') {
      // Perform student signup logic
      // ...
      const studentUser = {
        username,
        role: 'student',
        // other student user data
      };
      setLoggedIn(true);
      setUser(studentUser);
    } else if (role === 'teacher') {
      // Perform teacher signup logic
      // ...
      const teacherUser = {
        username,
        role: 'teacher',
        // other teacher user data
      };
      setLoggedIn(true);
      setUser(teacherUser);
    } else {
      // Handle signup failure, e.g., show an error message
      console.log('Invalid role');
    }
  };

  // Function to handle logout
  const handleLogout = () => {
    // Perform logout logic here
    setLoggedIn(false);
    setUser(null);
  };

  return (
      <div className="App">
        <BrowserRouter>
          <Route exact path="/" component={Home} />
          <Route path="/login"><Login handleLogin={handleLogin} /></Route>
          <Route path="/signup"><Signup handleSignup={handleSignup} /></Route>
          <Route path="/student">
            {loggedIn && user?.role === 'student' ? (
              <StudentDashboard handleLogout={handleLogout} user={user} />
            ) : (
              <Login handleLogin={handleLogin} />
            )}
          </Route>
          <Route path="/teacher">
            {loggedIn && user?.role === 'teacher' ? (
              <TeacherDashboard handleLogout={handleLogout} user={user} />
            ) : (
              <Login handleLogin={handleLogin} />
            )}
          </Route>
        </BrowserRouter>
      </div>
  );
}

export default App;

