class AddUserToReviews < ActiveRecord::Migration[8.0]
  def change
    # First add the column allowing null values
    add_reference :reviews, :user, null: true, foreign_key: true

    # If you have a default user or want to assign existing reviews to a specific user
    # Uncomment and modify the following line:
    # execute "UPDATE reviews SET user_id = (SELECT id FROM users LIMIT 1) WHERE user_id IS NULL"

    # Then add the not null constraint
    change_column_null :reviews, :user_id, false
  end
end
