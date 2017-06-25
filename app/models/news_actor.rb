class NewsActor < ApplicationRecord
  belongs_to :news
  belongs_to :actor
end
