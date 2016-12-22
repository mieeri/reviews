class CreateDoramas < ActiveRecord::Migration[5.0]
  def change
    create_table :doramas do |t|

      t.timestamps
    end
  end
end
