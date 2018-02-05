$(document).on('turbolinks:load', function() {
  var $form = $('#new_subscription');
  buildCard();

  $form.submit(function(event) {
    // Disable the submit button to prevent repeated clicks:
    $form.find('.submit').prop('disabled', true);

    // Request a token from Stripe:
    Stripe.card.createToken($form, stripeResponseHandler);

    // Prevent the form from being submitted:
    return false;
  });
});

function buildCard() {

  $('#new_subscription').card({
    container: '.card-wrapper', // *required*

    formSelectors: {
      numberInput: 'input[data-stripe="number"]',
      expiryInput: 'input[data-stripe="exp_month"], input[data-stripe="exp_year"]',
      cvcInput: 'input[data-stripe="cvc"]',
      nameInput: 'input[data-stripe="name"]'
    },

    width: 350, // optional — default 350px
    formatting: true, // optional - default true

    // Strings for translation - optional
    messages: {
      validDate: 'valid\ndate', // optional - default 'valid\nthru'
      monthYear: 'mm/yy', // optional - default 'month/year'
    },

    // Default placeholders for rendered fields - optional
    placeholders: {
      number: '•••• •••• •••• ••••',
      name: $('input[data-stripe="name"]').val() || 'NOME COMPLETO',
      expiry: '••/••',
      cvc: '•••'
    },

    // if true, will log helpful messages for setting up Card
    debug: false // optional - default false
  });
}

var errorMessages = {
  incorrect_number: "O número do cartão está incorreto.",
  invalid_number: "The card number is not a valid credit card number.",
  invalid_expiry_month: "The card's expiration month is invalid.",
  invalid_expiry_year: "O ano de validade do cartão é inválido.",
  invalid_cvc: "The card's security code is invalid.",
  expired_card: "O cartão está expirado.",
  incorrect_cvc: "The card's security code is incorrect.",
  incorrect_zip: "The card's zip code failed validation.",
  card_declined: "The card was declined.",
  missing: "There is no card on a customer that is being charged.",
  processing_error: "An error occurred while processing the card.",
  rate_limit:  "An error occurred due to requests hitting the API too quickly. Please let us know if you're consistently running into this error."
};

function stripeResponseHandler(status, response) {
  // Grab the form:
  var $form = $('#new_subscription');

  if (response.error) { // Problem!

    // Show the errors on the form:
    $form.find('.payment-errors').text(errorMessages[response.error.code]);
    $form.find('.submit').prop('disabled', false); // Re-enable submission

  } else { // Token was created!

    // Get the token ID:
    var token = response.id;

    // Insert the token ID into the form so it gets submitted to the server:
    $form.append($('<input type="hidden" name="stripeToken">').val(token));

    // Submit the form:
    $form.get(0).submit();
  }
};
