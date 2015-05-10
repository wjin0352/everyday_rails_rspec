class Contact < ActiveRecord::Base
  has_many :phones
  accepts_nested_attributes_for :phones

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true, uniqueness: true
  # validates :phones, length: { is: 3 }
  def name
    [firstname, lastname].join(' ')
  end

  def self.by_letter(letter)
    # searches database for letter as first element and orders by lastname.
    where("lastname LIKE ?", "#{letter}%").order(:lastname)
  end


end
