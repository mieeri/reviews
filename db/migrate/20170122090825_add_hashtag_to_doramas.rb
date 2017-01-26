class AddHashtagToDoramas < ActiveRecord::Migration[5.0]
  def change
    add_column :doramas, :hash_tag, :string
  end
end
