# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  user_id    :integer          not null
#  answer_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Like < ApplicationRecord

    validates :user_id, :answer_id, presence: true

    belongs_to :answer,
        foreign_key: :answer_id,
        class_name: :Answer

    belongs_to :user,
        foreign_key: :user_id,
        class_name: :User
end
