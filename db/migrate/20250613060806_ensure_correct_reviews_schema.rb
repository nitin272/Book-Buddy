class EnsureCorrectReviewsSchema < ActiveRecord::Migration[8.0]
  def up
    # First, remove any existing foreign keys to users
    if foreign_key_exists?(:reviews, :users)
      remove_foreign_key :reviews, :users
    end

    # Remove user_id column if it exists
    if column_exists?(:reviews, :user_id)
      remove_column :reviews, :user_id
    end

    # Ensure book_id exists and has proper foreign key
    unless column_exists?(:reviews, :book_id)
      add_reference :reviews, :book, null: false, foreign_key: true
    end

    # Ensure we have the basic columns
    unless column_exists?(:reviews, :rating)
      add_column :reviews, :rating, :integer
    end

    unless column_exists?(:reviews, :comment)
      add_column :reviews, :comment, :text
    end
  end

  def down
    # No need for down migration as we want to keep this state
  end
end 