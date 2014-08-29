class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :display_name
      t.boolean :is_friend
      t.integer :friends_count
      t.string :about
      t.string :email
      t.string :phone
      t.string :profile_picture_url
      t.string :friend_request
      t.boolean :trust_request
      t.string :venmo_id
      t.date :date_joined

      t.timestamps
    end
  end
end
