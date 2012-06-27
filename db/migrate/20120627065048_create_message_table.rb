class CreateMessageTable < ActiveRecord::Migration
  def change
      create_table "messages", :force => true do |t|
        t.string  :role, :null => false, :length=> 15
        t.text    :message, :null=> false
        t.integer :user_id
        t.timestamps

      end

  end
end
