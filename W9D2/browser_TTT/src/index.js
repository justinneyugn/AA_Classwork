const View = require("./ttt-view");
const Game = require("../ttt_node/game");

document.addEventListener("DOMContentLoaded", () => {
  let container = document.querySelector('.grid');
  const game1 = new Game();
  const view1 = new View(game1, container);
  const square = document.querySelector('li')
  window.container = container;
  
  container.addEventListener('click', e => {
    // console.log(e.dataset.indexNumber);
    // game1.playMove(e.dataset.indexNumber)
    view1.makeMove(e.target);
    }
  )
});

