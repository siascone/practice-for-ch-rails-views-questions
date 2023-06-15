# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  user_id    :integer          not null
#  subject    :string           not null
#  body       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Question < ApplicationRecord

    validates :subject, :body, presence: true

    belongs_to :user, 
        foreign_key: :user_id,
        class_name: :User
end
