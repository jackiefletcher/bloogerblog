class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.column :post_id, :integer
      t.column :text, :string

      t.timestamps
    end
  end
end
