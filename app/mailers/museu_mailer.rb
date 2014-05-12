class MuseuMailer < ActionMailer::Base
  default from: 'helper@msr.pt'

  def restorePassword(user, tempPass)
    @user = user
    @temp = tempPass
    mail(to:@user.email, subject: 'Pls restore')
  end

end

