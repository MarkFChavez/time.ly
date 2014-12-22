class @Dashboard
  self = this

  @show_token: ->
    $(".show-token").on "click", (e) ->
      e.preventDefault()
      url = $(this).data("url")

      self.get_token(url)

  @get_token: (url) ->
    $.ajax
      type: "GET"
      url: url
      success: (data) ->
        $("span.access_token").text(data.token)
      error: (data) ->
        alert "error"

  @init: ->
    self.show_token()

$ ->
  Dashboard.init()
