# -*- encoding : utf-8 -*-
class ContactMailer < ActionMailer::Base
  default :from => "contato@daviferreira.com"
  
  def contact(data)
    @data = data
    mail(:to => "contato@daviferreira.com",
         :from => data.email,
         :subject => "Contato Daviferreira.com")
  end
end
