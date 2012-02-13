class CreateHosts < ActiveRecord::Migration
  def self.up
    create_table :hosts do |t|
      t.string :hostname
      t.string :ip
      t.string :username
      t.string :password

      t.timestamps
    end
  end

  def self.down
    drop_table :hosts
  end
end
