class AddCompleteToNote < ActiveRecord::Migration
  def change
    add_column :notes, :complete, :boolean, null: false, default: false
  end
end
