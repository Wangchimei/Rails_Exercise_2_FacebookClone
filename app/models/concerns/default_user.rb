module Avatar
  extend ActiveSupport::Concern

  def self.default
    "https://picsum.photos/400/400"
  end
end