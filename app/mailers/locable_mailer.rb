class TicketsMailer < ApplicationMailer

  def locked_user(user)
    @user = user
    mail(to: "test@yandex.ru", subject: "#{@user} заблокирован")
  end

end
