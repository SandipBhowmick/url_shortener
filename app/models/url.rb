# This model for full url and unique string access from database
include Rails.application.routes.url_helpers
class Url < ApplicationRecord
  validates :full_url, uniqueness: { message: '^' }
  validate :url_is_correct?

  after_find do |url|
    url.update_attributes(count: (url.count + 1))
  end

  def url_is_correct?
    uri = URI.parse(full_url)
    raise URI::InvalidURIError if uri.host.nil?
  rescue URI::InvalidURIError
    errors.add(:full_url, '^Url is invalid')
  end
end
