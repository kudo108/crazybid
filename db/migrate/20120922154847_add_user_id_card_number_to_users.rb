class AddUserIdCardNumberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_id_card_number, :string

  end
end
