let Piece = require("./piece");

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  const board = Array.from( 
    { length: 8 }, 
    () => Array.from( { length:  8 } )
  );
 
   board[3][4] = new Piece("black");
   board[4][3] = new Piece("black");
   board[3][3] = new Piece("white");
   board[4][4] = new Piece("white");
  
   return board
  // Array.from( { num_of_row_spots } ,  builder_function_for_more_columns )
  // first builds # of rows, second "callback" reads as "for each row, build X columns"
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  if (this.isValidPos(pos)) {
    return this.posToBe(pos);
  } else {
    throw Error;
  }
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  if(this.getPiece(pos)){
    return(this.posToBe(pos).color === color);
  }
  return false;
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
   return(!!this.getPiece(pos) );
};


Board.prototype.posToBe = function(pos){
  // console.log(pos)
  return (this.grid[pos[0]][pos[1]]);
}
/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
};

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  if ((pos[0] >= 0 && pos[0] < 8) && (pos[1] >= 0 && pos[1] < 8)) {
    return true;
  } else {
    return false;
  }
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns null if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns null if it hits an empty position.
 *
 * Returns null if no pieces of the opposite color are found.
 */
function _positionsToFlip (board, pos, color, dir, piecesToFlip=[]) {
  let matchColor = false;
  if(!board.isValidPos(pos)){
    // console.log("isValidPos");
    return [];
  }
  if(board.isMine(pos, color) ){
    // console.log("ismine");
    matchColor = true;
    return [];
  }
  
  let possiblePos = [pos[0] + dir[0], pos[1] + dir[1]];
 
  if ( !board.isValidPos(possiblePos) ) {  // checking if on the board or not, add another statement to check 
    return [];
  } else if ((!board.isMine(possiblePos, color)) &&(board.isOccupied(possiblePos))) {
     piecesToFlip.push(possiblePos);
    // console.log("hello")
    // console.log(piecesToFlip)
  } else {
    return [];
  }
// token we can replace
  if(matchColor){
    return piecesToFlip.concat(_positionsToFlip(board, possiblePos, color, dir, piecesToFlip));
  }else{
    return [];
  }

  //if piecesToFlip

  // if the ptf have a length, we can go thru it to check if this move is possible o no
  // we can interate thru the pos we have to combine w/ what we have at start
  // we can check if the 
  // 
  // color at start is same color at the end
}

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
};

/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
  for(let i = 0; i < 8; i++){
    for( let j = 0; j < 8; j++) {
      if (this.grid[i][j]){
        process.stdout.write(`| ${this.grid[i][j].toString()} `)
      }else{
        process.stdout.write(`|${i},${j}`) 
        
      }
    }
    console.log(`|`)
  }


};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  if (this.isOccupied(pos)) {
    return false;
  }
  
  let positions = [];

  for (let i = 0; i < Board.DIRS.length; i++) {

   positions = positions.concat(_positionsToFlip(this,pos,color,Board.DIRS[i]));
  }
  
 

  if (positions.length > 0) {
    return true;
  } else {
    return false;
  }
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
};


module.exports = Board;


let b = new Board()
//b.print()
 console.log(b.validMove([3,4],"black")) // false
 console.log(b.validMove([2,3],"white")) // false
 console.log(b.validMove([2,3],"black")) // true

//  console.log(_positionsToFlip(b,[2,3],"white", [1,0], []))
//  console.log(_positionsToFlip(b,[5,3],"white", [-1,0], []))
 console.log(_positionsToFlip(b,[2,3],"black", [1,0], []))