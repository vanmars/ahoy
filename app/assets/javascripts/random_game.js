const addSpinner = () => {
  console.log("Spinner initiated!")
  $('.loading').append('<div class="loading-spinner"></div>');
}

const removeSpinner = () => {
  console.log("Spinner hidden")
  $('.loading-spinner').remove();
}

$(document).ready(() => {
  $('.load-spinner-btn').on('click', addSpinner)
  $('.play-container').on('load', removeSpinner)
});