class News < ApplicationRecord
  belongs_to :user
  belongs_to :serie
  has_many :actors, through: :news_actors, source: :actor
  has_many :news_actors, dependent: :destroy

  validates :user_id, presence: true

  def self.search(news_title, serie, actor, news)
    if serie.present?
      serie = Serie.where(name: serie)
      news = serie[0].news
    end
    news = news.where('title ilike ?', "%#{news_title}%") if news_title.present?
    if actor.present?
      actor = Actor.where(name: actor)[0]
      news &= actor.news
    end
    news
  end

end
