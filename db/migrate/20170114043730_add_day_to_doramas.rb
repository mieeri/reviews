class AddDayToDoramas < ActiveRecord::Migration[5.0]
  def change
    add_column :doramas, :day, :string
  end
end
