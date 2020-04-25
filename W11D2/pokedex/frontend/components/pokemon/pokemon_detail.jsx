import React from 'react';

class PokemonDetail extends React.Component {
  constructor(props) {
    super(props)
  }

  componentDidMount() {
    // debugger
    this.props.requestPokemonDetail(this.props.match.params.id);
  }

  componentDidUpdate(prevProps) {
    // debugger
    if (prevProps.match.params.id !== this.props.match.id)  {
      this.props.requestPokemonDetail(this.props.match.params.id)
    }
  }

  render() {
    // debugger
    return (
      <div>Pokemon Detail</div>
    ) 
  }
}

export default PokemonDetail;