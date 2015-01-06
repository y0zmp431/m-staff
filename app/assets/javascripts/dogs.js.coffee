# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  #  $('a').bind 'click', (event) ->
  #  alert "delete"
  #  false
  msnry = new Masonry '.mosaic', {itemSelector: '.mosaic_element'}
  #msnry = new Masonry '.mosaic'
  $('#dog_name').bind 'railsAutocomplete.select', (event, data) ->
    dogs_of = $(this).attr("dogs_of")
    #alert data.item.id
    #alert JSON.stringify data
    $('#list_dog_ids').append("<input type=\"hidden\" name=\"#{dogs_of}[dog_ids][]\" class=\"dog_id\" value=\"#{data.item.id}\" />")
#    $('#field_dog_ids').value data.item.id
    $('#list_dog_ids').append('<a href="" for="'+data.item.id+'" class="delete_dog_id">'+data.item.label+'</a>')
    $('a.delete_dog_id').bind 'click', (e) ->
      id = $(e.target).attr 'for'
      $('.dog_id[value="'+id+'"]').remove()
      $(e.target).remove()
      false
#    alert(data.item.id)
  $('a.delete_dog_id').bind 'click', (e) ->
    id = $(e.target).attr 'for'
    $('.dog_id[value="'+id+'"]').remove()
    $(e.target).remove()
    false

