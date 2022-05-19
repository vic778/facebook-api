class CreateUserInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :user_infos do |t|
      t.text :bio
      t.string :profile_picture
      t.string :cover_picture
      t.string :city
      t.string :from 
      t.string :relationship
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
