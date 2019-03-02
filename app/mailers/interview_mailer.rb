class InterviewMailer < ApplicationMailer
  default from: ENV['EMAIL_ADDRESS'],
          bcc: ENV['EMAIL_ADDRESS'],
          reply_to: ENV['EMAIL_ADDRESS']

  def request_schedule_email(interviewer, interviewee)
    @interviewer = interviewer
    @interviewee = interviewee
    mail(to: interviewer.email, cc: interviewee.email, subject: '【e-navigator】面接希望日が決まりました')
  end

  def apply_schedule_email(interviewer, interviewee)
    @interviewer = interviewer
    @interviewee = interviewee
    @interview_schedules = @interviewee.interviews.where(allowed: 'allowed', interviewer_id: @interviewer.id).order(begin_at: :asc)
    mail(to: interviewee.email, cc: interviewer.email, subject: '【e-navigator】面接日程が承認されました')
  end
end
