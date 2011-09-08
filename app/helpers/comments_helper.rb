# -*- encoding : utf-8 -*-
module CommentsHelper

  def gravatar_for(comment, options = { :size => 69 })
    gravatar_image_tag(comment.email.downcase, :alt => comment.author, :class => 'gravatar', :gravatar => options)
  end

  def sanitize_preserving_code(comment)
    require 'nokogiri'
    doc = Nokogiri::HTML::DocumentFragment.parse comment
    doc.css('code').each do |code|
      code.inner_html = CGI.escapeHTML code.inner_html.gsub('<br>', '')
    end
    sanitize doc.to_html, :tags => %w(strong em code br a) 
  end

end
