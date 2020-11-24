$(document).ready(function() {
// GAME DETECTS A WIN SCENARIO
  // Create Lists to track when flipped blue cards and flipped green cards occur.
  // Use the cardClicked function below to append each list.
  let flippedBlue = [];
  let flippedGreen = [];

  // Define variable to track mouse click.
  let clickTracker = [];

  // Define a variable called 'turn'.
  let turn;
  if ($('#turn-text').html() === "Blue's Turn"){
    turn = 'B'
  } else {
    turn = 'G'
  }
  
  //When the blue count list length equals four, cue blue win scenario page.
  const blueWin = () => {
    if (flippedBlue.length == 4) {
      console.log("Blue wins!")
      // window.location = 'blueWin.html';
    };
  };
  
  //When the green count list length equals four, cue green win scenario page.
  const greenWin = () => {
    if (flippedGreen.length == 4) {
      console.log("Green wins!")
      // window.location = 'greenWin.html';
    };
  };
  
  // 2. THE GAME DETECTS WHOSE TURN IT IS AND PRINTS IT TO THE SCREEN.
    // Create function that defines how to change text, turn, clickTracker list on each turn scenario.
  const turnChange = (ev) => {
    if (turn == 'B' && clickTracker.length < 2){   // If turn is blue, and it is the first turn.
        // If first click is a blue, it remains blue's turn.
        if (ev.target.classList.contains('blue') || ev.target.parentNode.classList.contains('blue')) {
          turn = 'B';
          // If first click is not a blue, it becomes green's turn.
        } else {
          turn = 'G';
          document.querySelector('#turn-text').innerHTML = "Green's Turn";
          clickTracker = [];
        };
  
    } else if (turn == 'B' && clickTracker.length == 2) { // If turn is blue, and it is the second turn.
      // Change turn to G, change screen text,  and reset ClickTracker.
      turn = 'G';
      document.querySelector('#turn-text').innerHTML = "Green's Turn";
      clickTracker = [];
  
    } else if (turn == 'G' && clickTracker.length < 2) {  // If turn is green, and it is the first turn.
        // If first click is a green, it remains green's turn.
        if (ev.target.classList.contains('green') || ev.target.parentNode.classList.contains('green')) {
        turn = 'P';
        // If first click is not a green: change turn to B, change screen text, and reset clickTracker.
        } else {
        turn = 'B';
        document.querySelector('#turn-text').innerHTML = "Blue's Turn";
        clickTracker = [];
        }
  
    } else { // If turn is green, and it is the second turn.
      turn = 'B';
      document.querySelector('#turn-text').innerHTML = "Blue's Turn";
      clickTracker = [];
    };
  };
  
  // 3. WHEN A USER CLICKS ON A CARD, THE CARD TURNS THE CORRECT COLOR.
      // Create Event Handlers
  const cardClicked = (ev) => {
    console.log(ev)
    console.log(ev.target.classList)
    console.log(ev.target.parentNode.classList)
    console.log(ev.target.style)
    console.log(ev.target.parentNode.style)

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
      $('#islander-board').hide();
      $('#board').show();
    } else if (view.innerHTML === "Go To Captain's View") {
      $('#board').hide();
      $('#islander-board').show();
    }
  }
  
    // Event Listeners
    console.log("Event listeners attached!")
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