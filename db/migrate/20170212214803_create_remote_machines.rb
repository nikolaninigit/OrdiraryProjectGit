class CreateRemoteMachines < ActiveRecord::Migration
  def change
    create_table :remote_machines do |t|
      t.string :instanceId
      t.string :instanceState

      t.timestamps null: false
    end
  end
end
