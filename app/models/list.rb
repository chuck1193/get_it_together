class List < ApplicationRecord
  has_many :tasks

  def complete_all_tasks!
      tasks.update(complete: true)
    end

    def snooze_all_tasks!
      tasks.each { |task| task.snooze_hour! }

      #task.each(&:snooze_hour!)
    end

    def total_duration
      tasks.sum(:duration)


      # task.inject(0) { |task, sum| sum + task.duration}
    end

    def incomplete_tasks
      tasks.select { |task| !task.complete }
      # tasks.where(complete: false)
    end

    def favorite_tasks
      tasks.where(favorite: true)
    end
end
