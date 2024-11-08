class ApplicationMailer < ActionMailer::Base
  default from: "sofwhee@gmail.com"
  layout "mailer"

  def lock_email
    @admin = params[:admin]
    @url   = 'http://example.com/lock'
    mail(to: @admin.email, subject: 'Your account has been locked') 
  end
end
