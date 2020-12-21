// Audio 
const setVolume = () => {
  document.querySelector('#win_audio').volume = 0.1;
  document.querySelector('#success_audio').volume = 0.1;
  document.querySelector('#wrong_audio').volume = 0.1;
};

const correctSound = () => {
  document.querySelector('#success_audio').play();
};

const incorrectSound = () => {
  document.querySelector('#wrong_audio').play();
};


$(document).ready(function() {  
  setVolume();
  // 1. HANDLE WIN SCENARIO
  // When the blue count list length equals four, cue blue win scenario page.
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

  //When the green count list length equals four, cue green win scenario page.
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

  // 2. HANDLE TURN TRACKING
  // Create function that defines how to change text, turn, clickTracker list on each turn scenario.
  const turnChange = (ev) => {
    // If turn is blue, and it is the first turn.
    if (turn == 'B' && clickTracker.length < 2){   
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
        turn = 'P';
        correctSound();
      // If first click is yellow, it remains green's turn, but water noise plays.
      } else if (ev.target.classList.contains('yellow') || ev.target.parentNode.classList.contains('yellow')) {
        turn = 'P';
        incorrectSound();
      // If first click is not a green: change turn to B, change screen text/color, reset clickTracker, and play water noise.
      } else {
      turn = 'B';
      incorrectSound();
      document.querySelector('#turn-text').innerHTML = "Blue's Turn";
      document.querySelector('#turn-text').style.color = "#CAFDFF";
      clickTracker = [];
      }
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
    
  // 3. WHEN A USER CLICKS ON A CARD, THE CARD TURNS THE CORRECT COLOR.
      // Create Event Handlers
  const cardClicked = (ev) => {
    if (ev.target.classList.contains('blue')) {           
      ev.target.style.backgroundColor = '#4197E5';
      flippedBlue.push(ev);                        
      blueWin();                                                         
    } else if (ev.target.parentNode.classList.contains('blue')){  
      ev.target.parentNode.style.backgroundColor = '#4197E5';
      flippedBlue.push(ev);
      blueWin();
    } else if (ev.target.classList.contains('green')) {     
      ev.target.style.backgroundColor = '#5F7511';
      flippedGreen.push(ev);
      greenWin();
    } else if (ev.target.parentNode.classList.contains('green')){
      ev.target.parentNode.style.backgroundColor  = '#5F7511';
      flippedGreen.push(ev);
      greenWin();
    } else if (ev.target.classList.contains('red')) {        
      ev.target.style.backgroundColor = '#A54E4D';
    } else if (ev.target.parentNode.classList.contains('red')){
      ev.target.parentNode.style.backgroundColor  = '#A54E4D';
    } else if (ev.target.classList.contains('yellow')) {    
      ev.target.style.backgroundColor  = '#F1AB5E';
    } else if (ev.target.parentNode.classList.contains('yellow')){
      ev.target.parentNode.style.backgroundColor  = '#F1AB5E';
    }
    clickTracker.push(ev);
    turnChange(ev);
  };

  // 4. User CAN TOGGLE THE VIEW
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
      // $('#islander-board').removeClass("animate__rollOut");
      // $('#board').removeClass("animate__rollIn");
      // $('#board').addClass("animate__rollOut");
      // $('#islander-board').addClass("animate__rollIn");
      

      $('#islander-board').hide();
      $('#board').show();
    } else if (view.innerHTML === "Go To Captain's View") {
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
  // Define variable to track mouse click.
  let clickTracker = [];
  // Define a variable called 'turn'.
  let turn;
  if ($('#turn-text').html() === "Blue's Turn"){
    turn = 'B';
    document.querySelector('#turn-text').style.color = "#CAFDFF";
  } else {
    turn = 'G';
    document.querySelector('#turn-text').style.color = "#BED669";
  };

  // Event Listeners
  $('#card0').click(cardClicked);
  $('#card1').click(cardClicked);
  $('#card2').click(cardClicked);
  $('#card3').click(cardClicked);
  $('#card4').click(cardClicked);
  $('#card5').click(cardClicked);
  $('#card6').click(cardClicked);
  $('#card7').click(cardClicked);
  $('#card8').click(cardClicked);
  $('#card9').click(cardClicked);
  $('#card10').click(cardClicked);
  $('#card11').click(cardClicked);
  $('#card12').click(cardClicked);
  $('#card13').click(cardClicked);
  $('#card14').click(cardClicked);
  $('#card15').click(cardClicked);
  $('#game-view').click(viewToggler);
});