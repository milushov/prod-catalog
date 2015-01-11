class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :msg
      t.references :product, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
