class ConfirmMailer < ApplicationMailer
  def confirm_mail(confirm)
    @confirm = confirm
    mail to: "sakitakitakita@gmail.com", subject: "投稿の確認メール"
  end
end
