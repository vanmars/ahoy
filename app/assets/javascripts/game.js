// Audio Functions ------------------------------------------
const setVolume = () => {
  document.querySelector('#win_audio').volume = 0.5;
  document.querySelector('#success_audio').volume = 0.4;
  document.querySelector('#wrong_audio').volume = 0.8;
}

const correctSound = () => {
  document.querySelector('#success_audio').play();
}

const incorrectSound = () => {
  document.querySelector('#wrong_audio').play();
}

// TOGGLE VIEW ------------------------------------------
const changeCardColorByView = () => {
  const view = document.querySelector('#game-view');
  if (view.innerHTML === "Go To Islander's View") {
    $('#islander-board').hide();
    $('#board').show();
  } else if (view.innerHTML === "Go To Captain's View") {
    $('#board').hide();
    $('#islander-board').show();
  };
}

const viewToggler = (ev) => {
  if (ev.target.innerHTML === "Go To Islander's View") {
    ev.target.innerHTML = "Go To Captain's View";
  } else {
    ev.target.innerHTML = "Go To Islander's View";
  };
  changeCardColorByView();
}

// CARD CLICK EVENT HANDLER ------------------------------------------
const cardClicked = (ev, blueArr, greenArr, turn, clickArr) => {
  if (ev.target.classList.contains('blue')) {           
    ev.target.style.backgroundColor = '#4197E5';
    blueArr.push(ev);                        
    blueWin(blueArr);                                                         
  } else if (ev.target.parentNode.classList.contains('blue')) {  
    ev.target.parentNode.style.backgroundColor = '#4197E5';
    blueArr.push(ev);
    blueWin(blueArr);
  } else if (ev.target.classList.contains('green')) {     
    ev.target.style.backgroundColor = '#5F7511';
    greenArr.push(ev);
    greenWin(greenArr);
  } else if (ev.target.parentNode.classList.contains('green')) {
    ev.target.parentNode.style.backgroundColor  = '#5F7511';
    greenArr.push(ev);
    greenWin(greenArr);
  } else if (ev.target.classList.contains('red')) {        
    ev.target.style.backgroundColor = '#A54E4D';
  } else if (ev.target.parentNode.classList.contains('red')) {
    ev.target.parentNode.style.backgroundColor  = '#A54E4D';
  } else if (ev.target.classList.contains('yellow')) {    
    ev.target.style.backgroundColor  = '#F1AB5E';
  } else if (ev.target.parentNode.classList.contains('yellow')) {
    ev.target.parentNode.style.backgroundColor  = '#F1AB5E';
  }
  clickArr.push(ev);
  turnChange(ev, turn, clickArr);
};

// HANDLE TURN SETTING and TRACKING
const setTurn = (turn) => {
  if ($('#turn-text').html() === "Blue's Turn") {
    turn = 'B';
    document.querySelector('#turn-text').style.color = "#CAFDFF";
  } else {
    turn = 'G';
    document.querySelector('#turn-text').style.color = "#BED669";
  };
}

const turnChange = function(ev, turn, clickArr) {
  // If turn is blue, and it is the first turn.
  if (turn == 'B' && clickArr.length < 2) {   
    // If first click is a blue, it remains blue's turn, and success noise plays.
    if (ev.target.classList.contains('blue') || ev.target.parentNode.classList.contains('blue')) {
      turn = 'B';
      correctSound();
    // If first click is yellow, it remains blue's turn, but water noise plays.
    } else if (ev.target.classList.contains('yellow') || ev.target.parentNode.classList.contains('yellow')) {
      turn = 'B';
      incorrectSound();
    // If first click is not a blue, change to green's turn, change screen text/color, reset clickTracker, and water noise plays.
    } else {
      turn = 'G';
      incorrectSound();
      document.querySelector('#turn-text').innerHTML = "Green's Turn";
      document.querySelector('#turn-text').style.color = "#BED669";
      clickArr = [];
    };
  // If turn is blue, and it is the second turn.
  } else if (turn == 'B' && clickArr.length == 2) { 
    // If click is blue, play success noise, otherwise play water noise
    if (ev.target.classList.contains('blue') || ev.target.parentNode.classList.contains('blue')) {
      correctSound();
    } else {
      incorrectSound();
    };
    // Change turn to G, change screen text, and reset this.clickTracker .
    turn = 'G';
    document.querySelector('#turn-text').innerHTML = "Green's Turn";
    document.querySelector('#turn-text').style.color = "#BED669";
    clickArr = [];
  // If turn is green, and it is the first turn.
  } else if (turn == 'G' && clickArr.length < 2) {  
    // If first click is a green, it remains green's turn, and success noise plays
    if (ev.target.classList.contains('green') || ev.target.parentNode.classList.contains('green')) {
      turn = 'P';
      correctSound();
    // If first click is yellow, it remains green's turn, but water noise plays.
    } else if (ev.target.classList.contains('yellow') || ev.target.parentNode.classList.contains('yellow')) {
      turn = 'P';
      incorrectSound();
    // If first click is not a green: change turn to B, change screen text/color, reset clickArr, and play water noise.
    } else {
      turn = 'B';
      incorrectSound();
      document.querySelector('#turn-text').innerHTML = "Blue's Turn";
      document.querySelector('#turn-text').style.color = "#CAFDFF";
      clickArr = [];
    };
  // If turn is green, and it is the second turn.
  } else { 
    // If click is green, play success noise, otherwise play water noise
    if (ev.target.classList.contains('green') || ev.target.parentNode.classList.contains('green')) {
      correctSound();
    } else {
      incorrectSound();
    };
    // Change turn to B, change screen text, and reset ClickArr.
    turn = 'B';
    document.querySelector('#turn-text').innerHTML = "Blue's Turn";
    document.querySelector('#turn-text').style.color = "#CAFDFF";
    clickArr = [];
  };
};

// HANDLE WIN SCENARIO ------------------------------------------
const blueWin = (blueArr) =>{
  if (blueArr.length === 4) {
    $('#win-para').append("Blue wins!");
    $('#win-para').css("color", "#0E4A71")
    $('.play-container').hide();
    $('.win-container').show();
    $('.win-para-div').addClass("animate__tada animate__infinite")
    $('#win_audio').play()
  };
}

const greenWin = (greenArr) => {
  if (greenArr.length == 4) {
    $('#win-para').append("Green wins!");
    $('#win-para').css("color", "#BED669")
    $('.play-container').hide();
    $('.win-container').show();
    $('.win-para-div').addClass("animate__tada animate__infinite")
    document.querySelector('#win_audio').play()
  };
}

document.addEventListener('DOMContentLoaded', () => {   
  let flippedBlue = [];
  let flippedGreen = [];
  let clickTracker = [];
  let turn = "";
  setTurn(turn);
  setVolume();
  changeCardColorByView();

  // Set Event Listeners
  $('#game-view').click(viewToggler);
  const cardArray = Array.from(document.querySelectorAll('.board-card'));
  cardArray.forEach(card => {
    card.addEventListener('click', (ev) => cardClicked(ev, flippedBlue, flippedGreen, turn, clickTracker));
  })
});