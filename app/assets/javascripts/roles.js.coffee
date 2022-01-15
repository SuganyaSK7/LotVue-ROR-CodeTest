# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
	$('#roles_table').DataTable()

	$('#show_user').click ->
  		$.ajax(url: '/roles/display_all_users')

  	$('#hide_roles').click ->
  		role_ids = []
  		$('input:checkbox[name=\'is_hidden[]\']:checked').each ->
    		role_ids.push($(this).attr('id').substring(8))
    	$.ajax(url: '/roles/update_hidden_values?role_ids=' + role_ids)
