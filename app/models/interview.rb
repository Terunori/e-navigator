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
  enum allowed: { undecided: 0, allewed: 1, disallowed: 2 }
  belongs_to :user, dependent: :destroy
end
