class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|

    	t.integer :user_id, null: false
    	t.references :votable, polymorphic: true, index: true

			t.integer :votevalue    	
      t.timestamps null: false
    end
  end
end
