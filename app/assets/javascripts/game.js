$(document).ready(function() {
// GAME DETECTS A WIN SCENARIO
  // Create Lists to track when flipped blue cards and flipped green cards occur.
  // Use the cardClicked function below to append each list.
  let flippedBlue = [];
  let flippedGreen = [];

  // Define variable to track mouse click.
  let clickTracker = [];
  
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
        if (ev.target.className == 'blue' || ev.path[1].className == 'blue') {
          turn = 'B';
          // If first click is not a blue: change turn to G, change screen text, and reset clickTracker.
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
        if (ev.target.className == 'green' || ev.path[1].className == 'green') {
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
    if (ev.target.classList.contains('blue')) {            // If clicked div card has a blue class tag, it will turn blue.
      ev.target.style.backgroundColor = '#4197E5';
      flippedBlue.push(ev);                         // Append event to flippedBluelist.
      blueWin();                                    // Initialize blueWin function to see if there is a blue win scneario.
      clickTracker.push(ev);                          // Append event to clickTracker list to keep track of turn tacken.
      turnChange(ev);                                 // Check to see if the turn needs to change to green.
    } else if (ev.target.parentNode.classList.contains('blue')){     // In case users click on the text element rather than the div card, the div card will still change color, not just the text.
      ev.parentNode.style.backgroundColor = '#4197E5';
      flippedBlue.push(ev);
      blueWin();
      clickTracker.push(ev);
      turnChange(ev);
  
    } else if (ev.target.className == 'green') {     // Same deal as abve, but for div cards with a purple class tag.
      ev.target.style.backgroundColor = '#5F7511';
      flippedGreen.push(ev);
      greenWin();
      clickTracker.push(ev);
      turnChange(ev);
    } else if (ev.path[1].className == 'green'){
      ev.path[1].style.backgroundColor = '#5F7511';
      flippedGreen.push(ev);
      greenWin();
      clickTracker.push(ev);
      turnChange(ev);
  
    } else if (ev.target.className == 'red') {        // Same deal as above, but for div cards with a red class tag.
      ev.target.style.backgroundColor = '#A54E4D';
      clickTracker.push(ev);
      turnChange(ev);
    } else if (ev.path[1].className == 'red'){
      ev.path[1].style.backgroundColor = '#A54E4D';
      clickTracker.push(ev);
      turnChange(ev);
  
    } else if (ev.target.className == 'blue_close_call') {     // Same deal as above, but for div cards with a ccyellow class tag.
      ev.target.style.backgroundColor = '#F1AB5E';
      clickTracker.push(ev);
      turnChange(ev);
    } else if (ev.path[1].className == 'blue_close_call'){
      ev.path[1].style.backgroundColor = '#F1AB5E';
      clickTracker.push(ev);
      turnChange(ev);
  
    } else if (ev.path[1].className == 'green_close_call'){    // Same deal as above, but for div cards with a ccpurple class tag.
      ev.path[1].style.backgroundColor = '#F1AB5E';
      clickTracker.push(ev);
      turnChange(ev);
    } else {
      ev.target.style.backgroundColor = '#F1AB5E';
      clickTracker.push(ev);
      turnChange(ev);
    }
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
  
      // Create Event Listeners

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


    // Define a variable called 'turn'.
    let turn;
    if ($('#turn-text').html() === "Blue's Turn"){
      turn = 'B'
    } else {
      turn = 'G'
    }
  
    
  });


  const changeCardColorByView = () => {
    const view = document.querySelector('#game-view');
    const cards = document.querySelectorAll('.board-card');
    if (view.innerHTML === "Go To Islander's View") {
      cards.forEach(function(card){
        card.style.backgroundColor = '#0E4A71';
      });
    } else if (view.innerHTML === "Go To Captain's View") {
      cards.forEach(function(card){
        if (card.classList.contains('blue')){
          card.style.backgroundColor = '#4197E5';
        } else if (card.classList.contains('green')){
          card.style.backgroundColor = '#5F7511';
        } else if (card.classList.contains('yellow')){
          card.style.backgroundColor = '#F1AB5E';
        } else if (card.classList.contains('red')){
          card.style.backgroundColor = '#A54E4D';
        };
      });
    }
  }