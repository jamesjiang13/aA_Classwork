// greeting is presentional component

import { Link } from 'react-router-dom';
import React from 'react';

const Greeting = ({ currentUser, logOut }) => {
  if (currentUser) {
    return (
      <div>
        <h3> Welcome {currentUser.username} ! </h3> 
        <button onClick={ logOut }>Log Out</button>
      </div>
    )
  } else {
    return (
      <div>
        <Link to="/signup"> Sign Up </Link>
        <Link to="/login"> Log In </Link>
      </div>
    )
  }
}

export default Greeting;

//container surrounds presentaional ocmponent
//container's job is to pass info to presentaiontal componet
