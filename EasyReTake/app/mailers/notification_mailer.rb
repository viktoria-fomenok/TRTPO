class NotificationMailer < ApplicationMailer
  default from: 'info@easyretake.com'
  layout 'mailer'

  def order_is_ready(user, order)
    @user = user
    @order = order
    mail(to: @user.email, subject: 'Information from EasyReTake.by')
  end

  def data_of_exam(professor, user, date_exam)
    @professor = professor
    @user = user
    @date_exam = date_exam
    mail(to: @user.email, subject: 'Information from EasyReTake.by')
  end
end
