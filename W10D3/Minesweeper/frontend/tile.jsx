import React from "react";

export default class Tile extends React.Component {
  constructor(props) {
      super(props)
      this.state = {
          bombCount: this.props.tile.adjacentBombCount(),
          explored: this.props.tile.explored,
          bombed: this.props.tile.bombed,
          flagged: this.props.tile.flagged,
          tStatus: "",
          val: null
      }
      this.tFlag = this.tFlag.bind(this)
      this.tExplore = this.tExplore.bind(this)  
      this.setVal = this.setVal.bind(this)
  }

  tFlag() {
    this.setState({
      flagged: this.props.tile.toggleFlag()
    })
  }

  tExplore() {
    this.setState({
      // explored: this.props.tile.explore(),
      tStatus: 'explored'
    })
  }

  setVal() {
    
    if (this.state.bombed) {
        this.setState({val: "💣"})
    } else if (this.state.bombCount > 0) {
        this.setState({val: this.state.bombCount})
    } else {this.tExplore()}
  }

  render() {   
    // let bCount = this.state.bombCount === 0 ? null : this.state.bombCount

    return (
        <div className={this.state.tStatus} className="tile" onClick={this.setVal}>
            {/* {this.state.explored ? className='explored' : className='tile' }  */}
            {this.state.val}
            {/* {this.state.flagged ? "🚩" : ""} */}
        </div>
    )
  }
}

// bombed 
// explored 
// flagged toggleflag()

// show num, show nothing, show bomb