class AddTweetNumberToDoramas < ActiveRecord::Migration[5.0]
  def change
    add_column :doramas, :tweet_number, :integer
  end
end
