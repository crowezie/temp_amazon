class Product < ApplicationRecord

  validates :title, {
    presence: true,
    uniqueness: { case_sensitive: false }
  }

  validates :price, {
    numericality: { greater_than_or_equal_to: 0 }
  }

  validates :description, {
    presence: true,
    length: { minimum: 10 }
  }

  # Callback methods
  before_validation :set_defaults
  before_save :capitalize_title

  private

  def set_defaults
    # We could also set this default at the database level in our migration.
    # It really depends on the structure of your models and specific use case
    # in terms of which is better.
    self.price ||= 1
  end

  def capitalize_title
    # We definitely need self.title on the left hand side as otherwise it will
    # just set a local variable title. For consistency we also use it on the
    # right hand side. But if we don't have it Rails will first look for a
    # local variable title in the capitalize_title method. When it doesn't find
    # that, it will go up a level (into the Product class) and if you have an
    # attribute 'title' on your Product object it will use that.
    self.title = self.title.capitalize
  end

end
