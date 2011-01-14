class Phone
  include Mongoid::Document
  include Mongoid::Timestamps

  field :number
  field :name

  key :number
  index :number

  embeds_many :notes

  before_create :normalize_phone

  validates_format_of :number, :with => /[0-9\- \(\)\+]/
  accepts_nested_attributes_for :notes

  def self.search(query)
    if query =~ /[0-9\-]/
      where :number => Phony.normalize(query)
    else
      where :name => query
    end
  end

  private
  def normalize_phone
    self.number = Phony.normalize(number)
  end

end
