class Book < ApplicationRecord
  def self.search(search)
    where("title LIKE ?  OR title LIKE ? OR title LIKE ? OR author LIKE ?",
      "%#{search.capitalize}%", "%#{search}%", "%#{search.downcase}%",
       "%#{search.capitalize}%")
  end

  def avg_rate
    if self.ratings.count != 0
      return ('%.2f' % self.ratings.average(:number)).to_f
    else
      0
    end
  end

  has_many :reviews
  has_many :ratings
end
