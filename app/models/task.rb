class Task < ApplicationRecord
  belongs_to :list
  has_many :user, through: :list

    def toggle_complete!
        update(complete: !complete)
      end

      def overdue?
        return Time.now > deadline && !complete
      end

      def increment_priority!
        if priority < 10
          update(priority: priority + 1)
        end
      end

      def decrement_priority!
        if priority > 1 
          update(priority: priority - 1)
        end
      end

      def snooze_hour!
        update(deadline: deadline + 1.hour)
      end
end
