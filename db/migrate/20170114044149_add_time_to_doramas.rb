class AddTimeToDoramas < ActiveRecord::Migration[5.0]
  def change
    add_column :doramas, :time, :string
  end
end
