class ConfirmMailer < ApplicationMailer
  def confirm_mail(confirm)
    @confirm = confirm
    mail to: "example@mail.com", subject: "投稿の確認メール"
  end
end
