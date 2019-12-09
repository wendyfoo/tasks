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
end
