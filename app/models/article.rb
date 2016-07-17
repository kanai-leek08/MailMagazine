class Article < ApplicationRecord

  def self.search(page, query)
    if query.present?
      r = ransack(title_or_body_cont: query).result
      r.page(page).per(10).order(updated_at: :DESC)
    else
      Article.page(page).per(10).order(updated_at: :DESC)
    end
  end
end
