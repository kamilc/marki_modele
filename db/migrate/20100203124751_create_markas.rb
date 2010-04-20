class CreateMarkas < ActiveRecord::Migration
  def self.up
    create_table :markas do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :markas
  end
end
