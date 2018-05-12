module ApplicationHelper
  WEB_FONT_URLS = [
    'https://fonts.googleapis.com/css?family=Patrick+Hand'.freeze,
    'https://fonts.googleapis.com/earlyaccess/roundedmplus1c.css'.freeze
  ]

  def web_font_link_tag
    return if Rails.env.test?
    stylesheet_link_tag(*WEB_FONT_URLS, media: 'all', 'data-turbolinks-track': 'reload')
  end
end
