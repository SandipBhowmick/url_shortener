# This model for full url and unique string access from database
include Rails.application.routes.url_helpers
class Url < ApplicationRecord
  validates :full_url, presence: { message: '^Please paste URL' }
  validates :full_url, uniqueness: { message: '^' }

  after_find do |url|
    url.update_attributes(count: (url.count + 1))
  end
end
