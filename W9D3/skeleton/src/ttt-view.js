class View {
  constructor(game, $el) {
    this.game = game;
    this.el = $el; // this is the main canvas
    this.setupBoard();
  }

  bindEvents() {
    $(".square").on("click", () => {
    this.game.playMove();
    });
  }

  makeMove($square) {
    $square.removeClass("unchecked").addClass("checked");  
    let $currentPlayer = this.game.currentPlayer;
    $square.text(`${$currentPlayer}`);
  }

  setupBoard() {
    const $box = $("<ul></ul>").addClass("box");

    for (let i = 0; i < 9; i++) {
      const $square = $("<li></li>").addClass("square").addClass("unchecked");
      $box.append($square);                                            
    }
    this.el.append($box); // board 
  }
}

module.exports = View;