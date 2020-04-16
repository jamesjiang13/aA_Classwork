import React from 'react'
import Tile from './tile.jsx';

export default class Board extends React.Component {
    constructor(props) {
        super(props)
        // this.state = {
        //     board: Array(10).fill(Array(10))
        // }
    }
    
    render() {
        return (
            <div className="board">
                {this.props.board.grid. map((row,idxR) => {
                    return (
                        <div className="row" key={idxR}>
                          {/* <span> */}
                            {row.map((tile,idxT) => {
                                return (
                                    <Tile
                                      key = {idxT} // column
                                      tile = {tile}
                                      updateGame = {this.props.updateGame}
                                    />
                                )
                            })}
                          {/* </span> */}
                        </div>
                    )
                })
              } 
           </div>
        )
    }
}