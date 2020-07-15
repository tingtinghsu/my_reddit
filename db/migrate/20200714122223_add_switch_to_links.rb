class AddSwitchToLinks < ActiveRecord::Migration[5.2]
  def change
    add_column :links, :switch, :boolean, default: true
  end
end
