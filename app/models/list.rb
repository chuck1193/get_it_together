class List < ApplicationRecord
  belongs_to :user
  has_many :tasks

  def complete_all_tasks!
      tasks.update(complete: true)
    end


    def incomplete_tasks
      tasks.select { |task| !task.complete }
      # tasks.where(complete: false)
    end

end
