class EntrepreneurProgram < ActiveRecord::Base
  has_many :outlines, dependent: :destroy

  validates_presence_of :topic, :message => 'Enter a Title'
  validates_presence_of :description, :message => 'Enter a Description'

end
