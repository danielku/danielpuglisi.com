class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_and_belongs_to_many :tags

  # Scopes
  default_scope order("published_at DESC").order("published")
  scope :published, where(published: true)

  def should_generate_new_friendly_id?
    new_record?
  end
end
