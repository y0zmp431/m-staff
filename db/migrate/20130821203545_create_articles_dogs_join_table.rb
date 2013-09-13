class CreateArticlesDogsJoinTable < ActiveRecord::Migration
  def change
    create_table :articles_dogs, :id => false do |t|
      t.integer :article_id
      t.integer :dog_id
    end
  end
end
