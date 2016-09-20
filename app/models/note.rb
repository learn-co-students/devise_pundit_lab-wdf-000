class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :ensure_owner_can_read

  def visible_to
      self.readers.collect{|reader| reader.name}.join(", ")
  end

  def visible_to=(csv_list_of_names)
    self.readers = csv_list_of_names.split(/\,\s?/).collect do |name|
       User.find_by(name: name)
    end
  end

  private

  def ensure_owner_can_read
    if user && !readers.include?(user)
      readers << user
    end
  end
end
