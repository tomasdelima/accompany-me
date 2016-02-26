class AddAccompaniableToAccompaniment < ActiveRecord::Migration
  def change
    add_reference :accompaniments, :accompaniable, polymorphic: true, index: {name: :index_accompaniments_on_accompaniable}
  end
end
