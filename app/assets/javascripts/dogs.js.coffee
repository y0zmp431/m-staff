# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(window).load ->
  #  $('a').bind 'click', (event) ->
  #  alert "delete"
  #  false

  #$('.mosaic').before $('<div class="gallery"></div>')

  #$('.mosaic .mosaic_element').bind 'click', ->
  #  $('.gallery').append( this ).masonry().masonry( 'appended', this ).masonry('layout')
  $('.mosaic').masonry()


  #window.msnry = new Masonry '.mosaic', {
    #columnWidth: '.mosaic_element.pedigree',
    #itemSelector: '.mosaic_element.dog_desc'
  #}

  #$('.mosaic_element').bind 'click', ->
    #$('.mosaic').masonry('addItems', this)
    #$('.mosaic').appended( '.mosaic_element.pedigree' )
    #$('.mosaic').masonry('appended', $('.mosaic_element.pedigree'))
    #$('.mosaic').masonry()
    #window.msnry.hide $('.mosaic_element.pedigree')
  #msnry = new Masonry '.mosaic'
  #
  #
  # Rails autocomplete
  #
  $('#dog_name').bind 'railsAutocomplete.select', (event, data) ->
    dogs_of = $(this).attr("dogs_of")
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

