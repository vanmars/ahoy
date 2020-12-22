const showLoader = () => {
  console.log("Spinner initiated!")
  $('.loading-spinner').show();
}

const hideLoader = () => {
  console.log("Spinner hidden")
  $('.loading-spinner').hide();
}

$(document).ready(() => {
  $('.load-spinner-btn').click(showLoader);
  $(document).change(hideLoader);
});