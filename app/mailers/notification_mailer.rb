class NotificationMailer < ApplicationMailer
  default from: 'test@gmail.com'

  def interviewer_approval(interviewer, examinee)
    @interviewer = interviewer
    @examinee = examinee
    @interview = @examinee.interviews.where(state: 1).first
    mail(
      to: @interviewer.email,
      subject: '面接日程が決まりました。'
    )
  end

  def examinee_approval(interviewer, examinee)
    @interviewer = interviewer
    @examinee = examinee
    @interview = @examinee.interviews.where(state: 1).first
    mail(
      to: @examinee.email,
      subject: '面接日程が決まりました。'
    )
  end

  def interviewer_desired(interviewer, examinee)
    @interviewer = interviewer
    @examinee = examinee
    mail(
      to: @interviewer.email,
      subject: '面接希望日が決定しました。'
    )
  end

  def examinee_desired(examinee)
    @examinee = examinee
    mail(
      to: @examinee.email,
      subject: '面接希望日を登録しました。'
    )
  end
end
