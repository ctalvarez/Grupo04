class Seen < ApplicationRecord
  belongs_to :chapter
  belongs_to :user

  def delete_seen
    self.delete
  end

  
end
