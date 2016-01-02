class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name, null: false, default: "Default Account"
      t.timestamps
    end
  end
end
