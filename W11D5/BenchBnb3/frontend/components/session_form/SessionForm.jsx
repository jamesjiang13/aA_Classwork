import React from 'react';
import { Link } from 'react-router-dom';

class SessionForm extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      username: "",
      password: ""
    }
    this.handleSubmit = this.handleSubmit.bind(this);
    // this.updatePassword = this.updatePassword.bind(this);
    // this.updateUsername = this.updateUsername.bind(this);
  }
  handleSubmit(e) {
    e.preventDefault();
    const user = Object.assign({}, this.state);
    this.props.processForm(user);
  }

  // updateUsername(e) {
  //   this.setState({
  //     username: e.currentTarget.value 
  //   })
  // }

  // updatePassword(e) {
  //   this.setState({
  //     password: e.currentTarget.value
  //   })
  // }

  update(field) {
    return (e) => {
      this.setState({
        [field]: e.currentTarget.value
      })
    }
  }

  componentDidMount() {
    this.setState({
      username: "",
      password: ""
    })
  }

  render() {
    // if (this.props.formType === "signup") {
    //   const route = "/signup";
    //   const text = "login";
    // } else if (this.props.formType === "login") {
    //   const route = "/login";
    //   const text = "signup";
    // } else {
    //   const route = "/";
    // }

    // return (
    //   <div>
    //     <header>{ this.props.formType === "signup" ? "Sign Up" : "Log In" }</header>
    //     <form onSubmit={this.handleSubmit}>
    //       <label>Username:
    //         <input type="text" onChange={this.update("username")} value={this.state.username} />
    //       </label>
    //       <p />
    //       <label>Password:
    //         <input type="password" onChange={this.update("password")} value={this.state.password} />
    //       </label>
    //       <p />
    //       <button>{ this.props.formType === "signup" ? "Sign Up" : "Log In" }</button>
    //     </form>
    //     <Link to={route}>{ text }</Link>
    //   </div>
    // )

    if (this.props.formType === "signup") {  
      return (
        <div>
          <header>Sign Up</header>
          <form onSubmit={this.handleSubmit}>
            <label>Username:
              <input type="text" onChange={this.update("username")} value={this.state.username} />
            </label>
            <p></p>
            <label>Password:
              <input type="password" onChange={this.update("password")} value={this.state.password} />
            </label>
            <p></p>
            <button>click here to signup</button>
          </form>
          <Link to="/login"> sessionform login </Link>
        </div>
      )
    } else if (this.props.formType === "login") {
      return (
        <div>
          <header> Log In</header>
          <form onSubmit={this.handleSubmit}>
            <label>Username:
              <input type="text" onChange={this.update("username")} value={this.state.username}/>
            </label>
            <p></p>
            <label>Password:
              <input type="password" onChange={this.update("password")} value={this.state.password}/>
            </label>
            <p></p>
            <button>click here to login</button>  
          </form>
          <Link to="/signup"> sessionform signup </Link>
        </div>
      )
    } else {
      <Link to="/" />
    }
  }
}

export default SessionForm;