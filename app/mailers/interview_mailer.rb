class InterviewMailer < ApplicationMailer
  default from: ENV['EMAIL_ADDRESS'],
          bcc: ENV['EMAIL_ADDRESS'],
          reply_to: ENV['EMAIL_ADDRESS']

  def request(interviewer, interviewee)
    @interviewer = interviewer
    @interviewee = interviewee
    mail(to: interviewer.email, cc: interviewee.email, subject: '【e-navigator】面接希望日が決まりました')
  end

  def cancel(interviewer, interviewee, schedule)
    @interviewer = interviewer
    @interviewee = interviewee
    @schedule = schedule
    mail(to: interviewee.email, cc: interviewer.email, subject: '【e-navigator】面接日程がキャンセルされました')
  end

  def allow(interviewer, interviewee, schedule)
    @interviewer = interviewer
    @interviewee = interviewee
    @schedule = schedule
    mail(to: interviewee.email, cc: interviewer.email, subject: '【e-navigator】面接日程が承認されました')
  end
end
