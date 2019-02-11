# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  birthday               :date
#  gender                 :integer
#  school                 :string
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum gender: { female: 0, male: 1, others: 2 }

  # TODO before_destroy
  before_destroy :nullify_interviewer, prepend: true

  has_many :interviews, dependent: :destroy
  belongs_to :interviewer, class_name: 'Interview', foreign_key: :id, optional: true

  def age
    date_format = "%Y%m%d"
    (Date.today.strftime(date_format).to_i - birthday.strftime(date_format).to_i) / 10000
  end

  private
  def nullify_interviewer
    Interview.where(interviewer_id: self.id).update_all(interviewer_id: nil)
  end
end
