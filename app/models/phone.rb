class Phone
  include Mongoid::Document
  include Mongoid::Timestamps

  field :number
  field :name

  key :number
  index :number

end
