class ConfirmMailer < ApplicationMailer
  def confirm_mail(confirm, current_user_info)
    @confirm = confirm
    binding.pry
    mail to: "current_user_info.email", subject: "投稿の確認メール"
  end
end
