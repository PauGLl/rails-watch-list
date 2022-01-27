class AddReferenceToReviews < ActiveRecord::Migration[6.1]
  def change
    add_reference :reviews, :list
  end
end
