import React from 'react';

export default class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = {time: new Date()};
  }
  
  componentDidMount() {
    this.timer = setInterval(
      () => this.tick(), 1000
    );
  }

  componentWillUnmount() {
    clearInterval(this.timer);
  }

  tick() {
    this.setState({ 
      time: new Date() 
    });
  }

  render() {
    return (
      <h1>{this.state.time.toLocaleTimeString()}</h1> 
    );
  }
}