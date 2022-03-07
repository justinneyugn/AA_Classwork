import React from 'react';
import * as Minesweeper from "./minesweeper.js";

class Game extends React.Component{
    constructor(){
        super();
        this.state = {board: new Minesweeper.Board(9, 10)};
    }

    updateGame(){

    }

    render(){
        return (
            <div>

            </div>
        )
    }
}

export default Game;