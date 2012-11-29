$ ->
  $("#show_password_button").click ->
    span = $("#show_password_span")
    if span.css("display") == "none"
      span.css("display", "inline")
      $(this).val("Hide Password")
    else
      span.css("display", "none")
      $(this).val("Show Password")
