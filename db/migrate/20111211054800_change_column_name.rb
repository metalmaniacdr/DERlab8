class ChangeColumnName < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.rename :fname, :first_name
      t.rename :lname, :last_name
    end
  end

end