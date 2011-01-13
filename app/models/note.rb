class Note
  include Mongoid::Document
  embedded_in :phone, :inverse_of => :notes
end
