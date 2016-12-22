class AddColumnsToDoramas < ActiveRecord::Migration[5.0]
  def change
    add_column :doramas, :story, :string
    add_column :doramas, :image, :string
    add_column :doramas, :title, :string
  end
end
