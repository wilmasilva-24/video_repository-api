class AddUsersToVideos < ActiveRecord::Migration[6.1]
  def change
    add_reference :videos, :user, index: true
  end
end
