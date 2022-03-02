class View {
  constructor(game, el) {
    this.game = game;
    this.el = el;
    this.setupBoard(); 
  }

  setupBoard() {
    // const grid = document.querySelector('.grid');
    // let div = document.createElement('div')
    let ul = document.createElement('ul');
    for (let i = 0; i < 3; i++) {
      for (let j = 0; j < 3; j++) {
        let li = document.createElement('li');
        li.dataset.indexNumber = JSON.stringify([i,j]);
        // if (i === 0) {
        //   li.classList.add('first');
        // } else if (i === 1) {
        //   li.classList.add('second');
        // } else if (i === 2) {
        //   li.classList.add('third');
        // }
        ul.append(li);
      }
    }
    this.el.append(ul);
  }
  
  bindEvents() {}

  handleClick(e) {

  }

  makeMove(square) {
    // console.log(square.dataset.indexNumber);
    // const pos = [square.dataset.indexNumber[1], square.dataset.indexNumber[3]];
    console.log(square.dataset.indexNumber);
    this.game.playMove(JSON.parse(square.dataset.indexNumber));
    square.classList.add(this.game.currentPlayer);
    if (this.game.winner()) {
      console.log("winner!");
      alert(`Game Over! Winner: ${this.game.currentPlayer}`)
    }

  }

}

module.exports = View;
