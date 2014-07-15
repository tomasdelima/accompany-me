class Accompaniment < ActiveRecord::Base
  belongs_to :activity
  belongs_to :friend

  validates :subject, presence: true

  def self.parse_html(field)
    field = field.gsub("\n", "<br>")
    field = field.gsub("\t", "&nbsp&nbsp")
    field = field.gsub(" ", "&nbsp")
    field.html_safe
  end
end
