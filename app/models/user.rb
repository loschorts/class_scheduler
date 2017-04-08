class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
      
  LANGUAGES = I18n.available_locales.map(&:to_s)
  before_save :remove_old_profile_picture

  validates :f_name, :l_name, :language, :about, presence: true
  validates :about, length: { maximum: 140, minimum: 10, allow_nil: true, allow_blank: true }
  validates :profile_src, :profile_public_id, presence: true
  validates :language, inclusion: {in: LANGUAGES, allow_nil: true}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def profile_public_id= new_id
    @old_id = self.profile_public_id
    write_attribute(:profile_public_id, new_id)
  end

  protected

  def remove_old_profile_picture
    isValid = self.errors.empty?
    successful_update = isValid && @old_id && @old_id != self.profile_public_id
    unsuccessful_create = self.new_record? && !isValid && self.profile_public_id

    debugger
    
    if successful_update || unsuccessful_create
      Cloudinary::Uploader.destroy(@old_id) if @old_id
    end
  end


end
