const MovingObject = require("./moving_object.js");
const Util = require("./util.js");

Util.inherits(Asteroid, MovingObject);


function Asteroid(obj) {
  // new MovingObject({pos, vel, 50, #666699}) was this what we were supposed to do?
  
  obj.pos = obj.pos 
  obj.vel = Util.randomVec(10);
  obj.radius = 50;
  obj.color = "#666699";  // why is this.color overrideable but obj.color not

  MovingObject.call(this, obj);
}

module.exports = Asteroid;
// markov.call(pavlov, bunch of shit)