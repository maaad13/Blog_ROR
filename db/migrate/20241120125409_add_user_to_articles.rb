class AddUserToArticles < ActiveRecord::Migration[7.1]
  def change
    # First, add the user_id column as nullable
    add_reference :articles, :user, foreign_key: true, null: true

    # Then, update the existing articles to set a default user_id
    reversible do |dir|
      dir.up do
        execute <<-SQL
          UPDATE articles SET user_id = (SELECT id FROM users LIMIT 1)
        SQL
      end
    end

    # Finally, make the user_id column NOT NULL
    change_column_null :articles, :user_id, false
  end
end
