class CreateKasirs < ActiveRecord::Migration[7.0]
  def change
    create_table :kasirs do |t|
      t.string :nama
      t.string :email
      t.string :password


      t.timestamps
    end
  end
end
