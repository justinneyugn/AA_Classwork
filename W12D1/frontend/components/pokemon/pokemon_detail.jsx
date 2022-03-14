import React from "react";

class PokemonDetail extends React.Component {
  constructor(props){
    super(props);
  }

  componentDidMount(){
    this.props.requestSinglePokemon();
  }
  
  render() {
    return null;
  }

}

export default PokemonDetail;