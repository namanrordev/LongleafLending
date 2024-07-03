import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    function removeErrors() {
        $('.error').remove();
        $('#err-name').remove();
        $('#err-email').remove();
        $('#err-phone').remove();
    }

    // Function to validate numeric input
    function validateNumericInput(inputId, stepId) {
        const value = $(inputId).val();
        if (value !== '' && !$.isNumeric(value)) {
            $(inputId).after('<label class="error absolute block text-red-900">Numeric value only.</label>');
        }
    }

    // Common keyup event handler
    function commonKeyupHandler(inputId, stepId) {
        $(inputId).keyup(function() {
            removeErrors();
            if (stepId) {
                validateNumericInput(inputId, stepId);
            }
        });
    }

    // Keyup event handlers
    commonKeyupHandler('#loan_user_address');
    commonKeyupHandler('#loan_user_loan_term', '#step-loanTerm');
    commonKeyupHandler('#loan_user_purchase_price', '#step-purchasePrice');
    commonKeyupHandler('#loan_user_repair_budget', '#step-repairBudget');
    commonKeyupHandler('#loan_user_arv', '#step-arv');
    commonKeyupHandler('#loan_user_name');
    commonKeyupHandler('#loan_user_email');
    commonKeyupHandler('#loan_user_phone');

    // Button click event handlers
    $('#cal-profit').click(function(){
        $('#step-address').removeClass('hidden');
        $('#step-start').addClass('hidden');
        $('#form-label').addClass('hidden');
    });

    function stepNext(currentStep, nextStep, inputId, numeric = false) {
        removeErrors();
        const value = $(inputId).val();
        if (value === '') {
            $(inputId).after('<label class="error absolute block text-red-900">Please fill this field</label>');
        } else if (numeric && !$.isNumeric(value)) {
            $(inputId).after('<label class="error absolute block text-red-900">Numeric value only.</label>');
        } else {
            $(nextStep).removeClass('hidden');
            $(currentStep).addClass('hidden');
        }
    }

    $('#address-next').click(function(){
        stepNext('#step-address', '#step-loanTerm', '#loan_user_address');
    });

    $('#loanTerm-next').click(function(){
        stepNext('#step-loanTerm', '#step-purchasePrice', '#loan_user_loan_term', true);
    });

    $('#purchasePrice-next').click(function(){
        stepNext('#step-purchasePrice', '#step-repairBudget', '#loan_user_purchase_price', true);
    });

    $('#repairBudget-next').click(function(){
        stepNext('#step-repairBudget', '#step-arv', '#loan_user_repair_budget', true);
    });

    $('#arv-next').click(function(){
        stepNext('#step-arv', '#step-personal-details', '#loan_user_arv', true);
    });

    $('#submit').click(function(event){
        removeErrors();
        const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        const name = $('#loan_user_name').val();
        const email = $('#loan_user_email').val();
        const phone = $('#loan_user_phone').val();
        
        if (name === '') {
            $('#loan_user_name').after('<label id="err-name" class="block text-red-900">Please fill this field</label>');
            event.preventDefault();
        }
        
        if (email === '') {
            $('#loan_user_email').after('<label id="err-email" class="block absolute text-red-900">Please fill this field</label>');
            event.preventDefault();
        } else if (!emailRegex.test(email)) {
            $('#loan_user_email').after('<label id="err-email" class="block absolute text-red-900">Please enter a valid email address</label>');
            event.preventDefault();
        }

        if (phone === '') {
            $('#loan_user_phone').after('<label id="err-phone" class="block absolute text-red-900">Please fill this field</label>');
            event.preventDefault();
        }else if(!$.isNumeric(phone)) {
            $('#loan_user_phone').after('<label id="err-phone" class="block absolute text-red-900">Numeric value only.</label>');
            event.preventDefault();
        }


        
        if (name !== '' && email !== '' && phone !== '' && $.isNumeric(phone) && emailRegex.test(email)) {
            $('#step-personal-details').addClass('hidden');
            $('#submit').attr('disabled', false);
        }
    });
  }
}