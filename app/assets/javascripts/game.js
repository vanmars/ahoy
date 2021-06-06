$(document).ready(function() {  
  // Set Audio ----------------------------------
  const setVolume = () => {
    document.querySelector('#win_audio').volume = 0.5;
    document.querySelector('#success_audio').volume = 0.4;
    document.querySelector('#wrong_audio').volume = 0.8;
  };

  const correctSound = () => {
    document.querySelector('#success_audio').play();
  };

  const incorrectSound = () => {
    document.querySelector('#wrong_audio').play();
  };
  setVolume();

  // HANDLE WIN SCENARIO ----------------------------------
  const blueWin = () => {
    if (flippedBlue.length == 4) {
      console.log("Blue wins!")
      // Style the win card appropriately
      $('#win-para').append("Blue wins!");
      $('#win-para').css("color", "#0E4A71")
      // Hide nav bar, and game board, and show win container
      $('.play-container').hide();
      $('.win-container').show();
      $('.win-para-div').addClass("animate__tada animate__infinite")
      document.querySelector('#win_audio').play()
    };
  };

  const greenWin = () => {
    if (flippedGreen.length == 4) {
      console.log("Green wins!")
      // Make the win-card appear
      $('#win-para').append("Green wins!");
      $('#win-para').css("color", "#BED669")
      // Hide nav bar, and game board, and show win container
      $('.play-container').hide();
      $('.win-container').show();
      $('.win-para-div').addClass("animate__tada animate__infinite")
      document.querySelector('#win_audio').play()
    };
  };

  // HANDLE TURNS ----------------------------------
  // Function defines how to change text, turn, clickTracker list on each turn scenario.
  const turnChange = (ev) => {
    // If turn is blue, and it is the first turn.
    if (turn == 'B' && clickTracker.length < 2) {   
      // If first click is a blue, it remains blue's turn, and success noise plays.
      if (ev.target.classList.contains('blue') || ev.target.parentNode.classList.contains('blue')) {
        correctSound();
      // If first click is yellow, it remains blue's turn, but water noise plays.
      } else if (ev.target.classList.contains('yellow') || ev.target.parentNode.classList.contains('yellow')) {
        incorrectSound();
      // If first click is not a blue, change to green's turn, change screen text/color, reset clickTracker, and water noise plays.
      } else {
        turn = 'G';
        incorrectSound();
        document.querySelector('#turn-text').innerHTML = "Green's Turn";
        document.querySelector('#turn-text').style.color = "#BED669";
        clickTracker = [];
      };
    // If turn is blue, and it is the second turn.
    } else if (turn == 'B' && clickTracker.length == 2) { 
      // If click is blue, play success noise, otherwise play water noise
      if (ev.target.classList.contains('blue') || ev.target.parentNode.classList.contains('blue')) {
        correctSound();
      } else {
        incorrectSound();
      };
      // Change turn to G, change screen text, and reset ClickTracker.
      turn = 'G';
      document.querySelector('#turn-text').innerHTML = "Green's Turn";
      document.querySelector('#turn-text').style.color = "#BED669";
      clickTracker = [];
    // If turn is green, and it is the first turn.
    } else if (turn == 'G' && clickTracker.length < 2) {  
      // If first click is a green, it remains green's turn, and success noise plays
      if (ev.target.classList.contains('green') || ev.target.parentNode.classList.contains('green')) {
        correctSound();
      // If first click is yellow, it remains green's turn, but water noise plays.
      } else if (ev.target.classList.contains('yellow') || ev.target.parentNode.classList.contains('yellow')) {
        incorrectSound();
      // If first click is not a green: change turn to B, change screen text/color, reset clickTracker, and play water noise.
      } else {
        turn = 'B';
        incorrectSound();
        document.querySelector('#turn-text').innerHTML = "Blue's Turn";
        document.querySelector('#turn-text').style.color = "#CAFDFF";
        clickTracker = [];
      };
    // If turn is green, and it is the second turn.
    } else { 
      // If click is green, play success noise, otherwise play water noise
      if (ev.target.classList.contains('green') || ev.target.parentNode.classList.contains('green')) {
        correctSound();
      } else {
        incorrectSound();
      };
      // Change turn to B, change screen text, and reset ClickTracker.
      turn = 'B';
      document.querySelector('#turn-text').innerHTML = "Blue's Turn";
      document.querySelector('#turn-text').style.color = "#CAFDFF";
      clickTracker = [];
    };
  };

  // HANDLE CARD CLICKS
  const cardClicked = (ev) => {
    if (ev.target.classList.contains('blue')) {           
      ev.target.style.backgroundColor = '#4197E5';
      flippedBlue.push(ev);                        
      blueWin();                                                         
    } else if (ev.target.parentNode.classList.contains('blue')) {  
      ev.target.parentNode.style.backgroundColor = '#4197E5';
      flippedBlue.push(ev);
      blueWin();
    } else if (ev.target.classList.contains('green')) {     
      ev.target.style.backgroundColor = '#5F7511';
      flippedGreen.push(ev);
      greenWin();
    } else if (ev.target.parentNode.classList.contains('green')) {
      ev.target.parentNode.style.backgroundColor  = '#5F7511';
      flippedGreen.push(ev);
      greenWin();
    } else if (ev.target.classList.contains('red')) {        
      ev.target.style.backgroundColor = '#A54E4D';
    } else if (ev.target.parentNode.classList.contains('red')) {
      ev.target.parentNode.style.backgroundColor  = '#A54E4D';
    } else if (ev.target.classList.contains('yellow')) {    
      ev.target.style.backgroundColor  = '#F1AB5E';
    } else if (ev.target.parentNode.classList.contains('yellow')) {
      ev.target.parentNode.style.backgroundColor  = '#F1AB5E';
    }
    clickTracker.push(ev);
    turnChange(ev);
  };

   // HANDLE VIEW TOGGLE
   const viewToggler = (ev) => {
    if (ev.target.innerHTML === "Go To Islander's View") {
      ev.target.innerHTML = "Go To Captain's View";
    } else {
      ev.target.innerHTML = "Go To Islander's View";
    };
    changeCardColorByView();
  }

  const changeCardColorByView = () => {
    const view = document.querySelector('#game-view');
    // const cards = document.querySelectorAll('.board-card');
    if (view.innerHTML === "Go To Islander's View") {
      // Code for Adding Additional Animation (if so desire in future)
      // $('#islander-board').removeClass("animate__rollOut");
      // $('#board').removeClass("animate__rollIn");
      // $('#board').addClass("animate__rollOut");
      // $('#islander-board').addClass("animate__rollIn");
      $('#islander-board').hide();
      $('#board').show();
    } else if (view.innerHTML === "Go To Captain's View") {
      // Code for Adding Additional Animation (if so desire in future)
      // $('#islander-board').removeClass("animate__rollIn");
      // $('#board').removeClass("animate__rollOut");
      // $('#islander-board').addClass("animate__rollOut");
      // $('#board').addClass("animate__rollIn");
      $('#board').hide();
      $('#islander-board').show();
    }
  };

  // Create Lists to track when flipped blue cards and flipped green cards occur. Use the cardClicked function above to append each list.
  let flippedBlue = [];
  let flippedGreen = [];
  let clickTracker = [];
  let turn;
  if ($('#turn-text').html() === "Blue's Turn"){
    turn = 'B';
    document.querySelector('#turn-text').style.color = "#CAFDFF";
  } else {
    turn = 'G';
    document.querySelector('#turn-text').style.color = "#BED669";
  };

    // Set Event Listeners
  $('#game-view').click(viewToggler);
  const cardArray = Array.from(document.querySelectorAll('.board-card'));
  cardArray.forEach(card => {
    card.addEventListener('click', (ev) => cardClicked(ev, flippedBlue, flippedGreen, turn, clickTracker));
  })
});
