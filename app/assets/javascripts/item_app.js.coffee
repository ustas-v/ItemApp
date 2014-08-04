
namespace 'Main'

class Main.ItemApp

  constructor: () ->

  clear_new_form: ->
    $('#item_name').val('')
    $('#item_picture').val('')
    $('.file-input-name').text('')

  decorate_file_inputs: ->
    $('input[type=file]').bootstrapFileInput()
    $('.file-inputs').bootstrapFileInput()

  decorate_file_input: (file_input) ->
    $(file_input).bootstrapFileInput()

  observe_form: (form) ->
    $(form).find('a.cancel-edit-form').off('click').on('click'
      (event) ->
        $(form).hide()

        return false
    )
