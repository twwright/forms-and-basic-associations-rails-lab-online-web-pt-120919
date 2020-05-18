class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :notes
  belongs_to :genre
  accepts_nested_attributes_for :notes, :reject_if => proc { |attr| attr[:content].blank? }

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    artist.try(:name)
  end
end
