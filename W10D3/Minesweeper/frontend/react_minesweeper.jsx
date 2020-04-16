import React from 'react';
import ReactDOM from 'react-dom';
import Game from './game.jsx'
// import Board from './board.jsx'

function Root() {
    return (
        <Game/>
    )
}

document.addEventListener('DOMContentLoaded', () => {
    ReactDOM.render(<Root/>, document.getElementById('main'));
});

// ReactDOM.render(<Root />, document.getElementById('main'));
