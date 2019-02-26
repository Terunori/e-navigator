class InterviewMailer < ApplicationMailer
  default from: ENV['EMAIL_ADDRESS'],
          bcc: ENV['EMAIL_ADDRESS'],
          reply_to: ENV['EMAIL_ADDRESS']

  def request_schedule_email(send_to, cc)
    @interviewer = send_to
    @interviewee = cc
    mail(to: send_to.email, cc: cc.email, subject: '【e-navigator】面接希望日が決まりました')
  end
end
