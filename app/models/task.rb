class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  belongs_to :project_user
  has_many :todo_tasks
end
