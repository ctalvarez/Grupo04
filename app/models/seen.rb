class Seen < ApplicationRecord
  belongs_to :chapter
  belongs_to :user

  def delete_seen
    self.delete
  end

  def create_seen(userid, chapterid)
    Seen.create(user_id: userid, chapter_id: chapterid)
  end
end
