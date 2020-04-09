const Asteroid = require("./asteroid");
const Util = require("./util");

function Game() {
  this.asteroids = [];
  this.addAsteroids();
}

Game.DIM_X = 800;
Game.DIM_Y = 600;
Game.NUM_ASTEROIDS = 20;

Game.prototype.addAsteroids = function() {
  for (let i = 0; i < Game.NUM_ASTEROIDS; i++) {
    this.asteroids.push(new Asteroid({pos: (this.randomPosition())}
    ));
  }
}

Game.prototype.randomPosition = function() {
  let x = Math.floor(Math.random() * Game.DIM_X);
  let y = Math.floor(Math.random() * Game.DIM_Y);
  return [x,y]; 
}

Game.prototype.draw = function(ctx) {
    ctx.clearRect(0,0,canvas.width, canvas.height);
    this.asteroids.forEach ((asteroid) => {
        asteroid.draw(ctx);
      })
    }
    
Game.prototype.moveObjects = function() {
  this.asteroids.forEach((asteroid) => {
    asteroid.move();
  })
}

Game.prototype.wrap = function(pos) {
    if (pos[0] > Game.DIM_X) {
        return [0,pos[1]]
    }
}
module.exports = Game;