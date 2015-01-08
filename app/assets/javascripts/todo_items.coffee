# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
toggleItem = (elem) ->
  $li = $(elem).closest('li').toggleClass("completed")
  id = $li.data 'id'

  data = "todo_item[completed]=#{elem.checked}"
  url = "/todo_items/#{id}"
  $.ajax
    type: 'PUT'
    url: url
    data: data

#$ ->
$(document).on "page:change", ->
  $("#todo-list").on 'change', '.toggle', (e) -> toggleItem e.target
  #$("#todo-list").on 'change', '.toggle', -> alert "toggle changed!"

