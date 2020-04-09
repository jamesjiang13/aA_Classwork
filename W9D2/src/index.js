const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js");
const Game = require("./game.js");
const GameView = require("./gameview.js");

window.MovingObject = MovingObject;

document.addEventListener("DOMContentLoaded", function () {
    const canvas = document.getElementById("game-canvas");
    const ctx = canvas.getContext("2d"); 
    window.canvas = canvas;
    window.ctx = ctx;
    
    window.game = new Game()
    window.gameview = new GameView(window.game, ctx);
    window.gameview.start();
    // let x = new Asteroid({
    //     pos: [30, 30],
    //     vel: [10, 10],
    //     radius: 5,
    //     color: "#00FF00"
    // });
    // window.x = x;

    // window.x.draw(ctx)

});


console.log("Webpack is working!");

