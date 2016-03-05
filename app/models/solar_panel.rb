class SolarPanel < ActiveRecord::Base
  validates_presence_of :title, :message => 'Enter a Title'
  validates_presence_of :description, :message => 'Enter a Description'

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x300>", :small => "40x50>" }, :default_url => ""
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/, :message => 'Invalid Image Format e.g [ image.jpeg/jpg/png ]'

end
