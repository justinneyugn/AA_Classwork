import React from "react";
import { connect } from "react-redux";
import PokemonDetail from "./pokemon_detail";
import {requestSinglePokemon} from "../../actions/pokemon_actions"

const mSTP = (state, ownProps) => ({
  pokemon: state.entities.pokemon[ownProps.match.params.id]
})

const mDTP = (dispatch) => ({
  requestSinglePokemon: (id) => dispatch(requestSinglePokemon(id))
})

export default connect(mSTP,mDTP)(PokemonDetail);

//TODO testing.