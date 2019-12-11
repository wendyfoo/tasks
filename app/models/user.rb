# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  validates :username, :presence => true
  validates :username, :uniqueness => true
  has_secure_password

  def tasks
    return Task.where({ :user_id => self.id})
  end 
    
end
