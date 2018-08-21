class Book < ApplicationRecord
  def self.search(search)
    where("title LIKE ?  OR title LIKE ? OR title LIKE ? OR author LIKE ?",
      "%#{search.capitalize}%", "%#{search}%", "%#{search.downcase}%",
       "%#{search.capitalize}%")
  end

  has_many :reviews
end
