class Package < ActiveRecord::Base
  validates :name, uniqueness: { case_sensitive: false }
  validates :url, format: {
    with: /\Agit:\/\//
  }
end
