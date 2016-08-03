class Article < ApplicationRecord

  validates :title, presence: true, length: {maximum: 100}
  validates :body, presence: true
  validates :owner, presence: true

  def self.search(page, query)
    if query.present?
      r = ransack(title_or_body_cont: query).result
      r.page(page).per(10).order(updated_at: :DESC)
    else
      Article.page(page).per(10).order(updated_at: :DESC)
    end
  end
end
