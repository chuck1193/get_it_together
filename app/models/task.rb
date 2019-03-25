class Task < ApplicationRecord
  belongs_to :list
  has_one :user, through: :list

  enum priority: {highest: 1, high: 2, medium: 3, low: 4, lowest: 5}

  enum status: {pending: 0, complete: 1}

  enum category: {school: 0, grocery: 1, work: 2, home: 3, other: 4}

      def toggle_complete!
        update(complete: !complete)
      end

      # def tracking_tasks_complete
      #   if status == 'complete' 
      #     completed += 1
      #   end
      # end



end
