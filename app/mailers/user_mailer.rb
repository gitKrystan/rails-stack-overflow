class UserMailer < ApplicationMailer
  def registration_confirmation(user)
    @user = user
    mail(to: "#{user.name} <#{user.email}>",
         subject: 'Registered at Stack Overflow Redux')
  end
end
