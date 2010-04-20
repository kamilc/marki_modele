class CreateCompatibilities < ActiveRecord::Migration
  def self.up
    create_table :compatibilities do |t|
      t.references :product, :marka_model
      t.timestamps
    end
  end

  def self.down
    drop_table :compatibilities
  end
end
