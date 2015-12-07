#= require jquery
#= require jquery_ujs
#= require materialize-sprockets
#= require jquery.validate
#= require jquery.validate.additional-methods
#= require_tree .

$(document).ready ->
  (->
    text = undefined
    cl = undefined
    $('.ntSaveForms').each (i) ->
      cl = 'ntSaveForms' + i
      $(this).addClass cl
      # add new class
      text = $.Storage.get(cl)
      if text and text.length > 0 and !$(this).val()
        $(this).val text
        # set field data
      return
    $('.ntSaveForms').keyup ->
      $.Storage.set $(this).attr('class').split(' ')[$(this).attr('class').split(' ').length - 1], $(this).val()
      # save field data
      return
    $('.ntSaveFormsSubmit').click ->
      $('.ntSaveForms').each (i) ->
        $.Storage.remove 'ntSaveForms' + i
        # remove data
        return
      return
    return
  )()
  return

$(document).ready ->
  $('.new_client').validate rules:
    'client[name]':
      required: true
    'client[surname]':
      required: true
    'client[patronymic]':
      required: true
    'client[phone]':
      required: true
      number: true
      minlength: 6
    'client[email]':
      required: true
    'client[passport]':
      required: true
      number: true
      minlength: 6

  $('.new_user').validate rules:
    'user[login]':
      required: true
    'user[password]':
      required: true
      minlength: 3
    'user[name]':
      required: true
    'user[surname]':
      required: true
    'user[patronymic]':
      required: true
    'user[phone]':
      required: true
      number: true
      minlength: 6

  $('.new_loan').validate rules:
    'loan[sum]':
      required: true
      number: true
      minlength: 2

jQuery.extend jQuery.validator.messages,
  required: "Поле должно быть заполнено"
  email: 'Введите корретный E-mail'
  number: 'Поле должно содержать число'
  minlength: jQuery.validator.format('Поле должно содержать от {0} чисел')
  # remote: 'Please fix this field.'
  # url: 'Please enter a valid URL.'
  # date: 'Please enter a valid date.'
  # dateISO: 'Please enter a valid date (ISO).'
  # digits: 'Please enter only digits.'
  # creditcard: 'Please enter a valid credit card number.'
  # equalTo: 'Please enter the same value again.'
  # accept: 'Please enter a value with a valid extension.'
  # maxlength: jQuery.validator.format('Please enter no more than {0} characters.')
  # rangelength: jQuery.validator.format('Please enter a value between {0} and {1} characters long.')
  # range: jQuery.validator.format('Please enter a value between {0} and {1}.')
  # max: jQuery.validator.format('Please enter a value less than or equal to {0}.')
  # min: jQuery.validator.format('Please enter a value greater than or equal to {0}.')

