# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord

    validates :username, :email, presence: true, uniqueness: true

    has_many :questions, 
        foreign_key: :user_id,
        class_name: :Question 

end
