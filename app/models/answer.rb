# == Schema Information
#
# Table name: answers
#
#  id          :bigint           not null, primary key
#  question_id :integer          not null
#  user_id     :integer          not null
#  body        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Answer < ApplicationRecord

    validates :body, presence: true

    belongs_to :user,
        foreign_key: :user_id,
        class_name: :User

    belongs_to :question,
        foreign_key: :question_id,
        class_name: :Question
end
