class Phone
  include Mongoid::Document
  include Mongoid::Timestamps

  field :number
  field :name

  key :number
  index :number

  before_create :normalize_phone

  validates_format_of :number, :with => /[0-9\- \(\)\+]/

  private
  def normalize_phone
    self.number = Phony.normalize(number)
  end

end
