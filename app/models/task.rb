class Task < ApplicationRecord
  belongs_to :list
  has_many :users, through: :list

  enum priority: {highest: 1, high: 2, medium: 3, low: 4, lowest: 5}

  enum status: {pending: 0, complete: 1, waiting: 2}

    def toggle_complete!
        update(complete: !complete)
      end

      def overdue?
        return Time.now > deadline && !complete
      end

      def increment_priority!
        if priority < 6
          update(priority: priority + 1)
        end
      end

      def decrement_priority!
        if priority > 1 
          update(priority: priority - 1)
        end
      end

      def deadline_checker
        
      end

end
