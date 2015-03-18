class AddLastSignedAt < ActiveRecord::Migration
  def change
    add_column :users, :last_signed_in_at, :datetime, default: nil
  end
end
