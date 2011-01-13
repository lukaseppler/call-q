class Note
  include Mongoid::Document
  include Mongoid::Timestamps
  field :content
  embedded_in :phone, :inverse_of => :notes
end
