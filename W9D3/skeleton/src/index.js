const View = require("./ttt-view.js");// require appropriate file
const Game = require("../../solution/game.js")// require appropriate file


$(() => {
  let game = new Game();

  let board = $(".ttt")

  new View(game, board);
  
  
});





