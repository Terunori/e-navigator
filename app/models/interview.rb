# == Schema Information
#
# Table name: interviews
#
#  id             :bigint(8)        not null, primary key
#  user_id        :bigint(8)
#  interviewer_id :bigint(8)
#  begin_at       :datetime
#  allowed        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Interview < ApplicationRecord
  enum allowed: { undecided: 0, allowed: 1, disallowed: 2 }
  belongs_to :user
  has_one :interviewer, class_name: 'User', foreign_key: :id, primary_key: :interviewer_id

  validate :interview_must_future
  validates :begin_at, uniqueness: true

  def interview_must_future
    if begin_at.present? && begin_at.past?
      errors.add(:begin_at, :past)
    end
  end
end
