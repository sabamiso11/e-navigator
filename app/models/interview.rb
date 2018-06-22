class Interview < ApplicationRecord
    validate :not_before_today

    def not_before_today
      if start_interview.present? && start_interview < Time.current
        errors.add(:start_interview, "未来の日付を設定してください")
      end
    end
    
    enum state: { 保留:0, 承認:1, 却下:2}
    belongs_to :user
end
