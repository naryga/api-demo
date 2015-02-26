class AddAppIdToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :app_id, :integer
  end
end
