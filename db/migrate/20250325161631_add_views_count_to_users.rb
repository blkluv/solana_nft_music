class AddViewsCountToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :views_count, :integer, default: 0
  end
end
