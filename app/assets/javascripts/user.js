function listenToNewUserForm () {
  $('.create-user.submit input').on('click', function (event) {
    event.preventDefault()

    var signUpForm = $('.sign-up-page #new_user')
    var data = {
      user: {
        email: signUpForm.find('#user_email').val(),
        password: signUpForm.find('#user_password').val(),
        password_confirmation: signUpForm.find('#user_password_confirmation').val(),
      }
    }

    $.post('/users', data)
    .success(function (response) {
      window.location = '/'
    })
    .error(function (response) {
      var errors = JSON.parse(response.responseText).errors
      var errorMessage = validateEmail(errors) + validatePassword(errors) + validatePasswordConfirmation(errors)

      var errorAlert = signUpForm.find('.error-messages')
      errorAlert.addClass('alert alert-danger')
      errorAlert.html(errorMessage)
    })
  })

  function validateEmail (errors) {
    return errors.email ? '<strong>Email</strong>: ' + errors.email.join(', ') + '<br/>' : ''
  }

  function validatePassword (errors) {
    return errors.password ? '<strong>Senha</strong>: ' + errors.password.join(', ') + '<br/>' : ''
  }

  function validatePasswordConfirmation (errors) {
    return errors.password_confirmation ? '<strong>Confirme sua senha</strong>: deve ser igual a senha</br>' : ''
  }
}