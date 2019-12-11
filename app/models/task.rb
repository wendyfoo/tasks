# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  category    :string
#  completed   :boolean
#  deadline    :string
#  description :string
#  duration    :integer
#  priority    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

class Task < ApplicationRecord
  validates :priority, :presence => true
  validates :description, :presence => true
  validates :category, :presence => true
  default_scope { order('priority ASC', 'duration ASC', 'deadline ASC') }

  belongs_to :user
  
  def user
    return User.where({ :id => self.user_id }).at(0)
  end

  def sort
    return self.all.order({ :priority => :asc })
  end

  def completion_verification
    if self.completed = true
      return "Closed"
    else 
      return "Open"
    end 
  end

end
