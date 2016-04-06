class User < ActiveRecord::Base

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  attr_accessor :login

  validates_presence_of :username, :on=>:create
  validates_uniqueness_of :username, :allow_blank => true, :if => :username_changed?, :case_sensitive => false

  validates_presence_of :email, :on=>:create
  validates_uniqueness_of    :email,:case_sensitive => false, :allow_blank => true, :if => :email_changed?
  validates_format_of :email, :with  => Devise.email_regexp, :allow_blank => true, :if => :email_changed?
  validates_presence_of :password, :on=>:create
  validates_confirmation_of :password, :on=>[:create, :update], :message => 'Password confirmation does not match Password'

  validates_length_of :password, :within => Devise.password_length, :allow_blank => true
  
  has_attached_file :photo,
                    :storage => :dropbox,
                    :dropbox_credentials => "#{Rails.root}/config/dropbox_config.yml",
                    :styles => { :medium => "300x300>", :thumb => "80x100>", :pix => "180x150>", :admin_size => "128x128>", :small => "30x35>" },
                    :default_url => "",
                    :dropbox_options => {
                    :path => proc { |style| "#{style}/#{id}_#{photo.original_filename}" }
  }
  validates_attachment_content_type :photo, :content_type => /\Aphoto\/.*\Z/, :message => 'Invalid Image Format e.g [ image.jpeg/jpg/png ]'

  private
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  def password_required?
    !persisted? || !password.nil? || !password_confirmation.nil?
  end

  def email_required?
    true
  end

end
