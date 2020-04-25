import { connect } from 'react-redux';
import { requestPokemonDetail } from '../../actions/pokemon_actions';
import selectAllPokemon from '../../reducers/selectors';
import PokemonDetail from './pokemon_detail';

const mapStateToProps = state => ({
  pokeDetail: selectAllPokemon(state)
})

const mapDispatchToProps = dispatch => ({
  requestPokemonDetail: poke => dispatch(requestPokemonDetail(poke))
})

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonDetail);