class Note
  include Mongoid::Document
  include Mongoid::Timestamps
  field :content
  embedded_in :phone, :inverse_of => :notes

  def self.ordered_notes
    desc(:created_at)
  end
end
