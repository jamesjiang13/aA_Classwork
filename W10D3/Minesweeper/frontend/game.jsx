import React from 'react';
import * as Minesweeper from "../minesweeper";
import Board from './board.jsx';


export default class Game extends React.Component {
  constructor(props) {
    super(props)
    this.state = { 
      board: new Minesweeper.Board(10, 10), //10x10 with 5 bombs
    }
    this.updateGame = this.updateGame.bind(this);
  }

  updateGame() {

  }

  render() {
  
    return (
      <div>
        <h1>Minesweeper</h1>
        <Board
          board = { this.state.board }
          updateGame = { this.updateGame }
        />
      </div>
    )
  }
}