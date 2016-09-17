class AddPictureNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :picture_name, :string
  end
end
