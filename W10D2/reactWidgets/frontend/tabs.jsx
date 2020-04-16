import React from 'react';

export default class Tabs extends React.Component {
  constructor(props) {
    super(props);
    this.state = {title:"", content:""};
  }

  showOne(e) {
    e.preventDefault();
    let name = "one";
    let quote = "Soy el primero";
    this.setState({ title: name, content: quote});
  }

  showTwo(e) {
    e.preventDefault();
    let name = "two";
    let quote = "Second plane here";
    this.setState({ title: name, content: quote });
  }

  showThree(e) {
    e.preventDefault();
    let name = 'three';
    let quote = "El tercer oracion";
    this.setState({ title: name, content: quote });
  }
  
  render() {
    return (
      <div class="tabs">
        <button onClick={ e => this.showOne(e) }>one</button>
        <button onClick={ e => this.showTwo(e) }>two</button>
        <button onClick={ e => this.showThree(e) }>three</button>
        <h3> { this.state.content } </h3>
      </div>
    )
  }
}
