class RenameDateColumnToDoramas < ActiveRecord::Migration[5.0]
  def change
    rename_column :doramas, :day, :date
  end
end
