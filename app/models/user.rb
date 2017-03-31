class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
      
  LANGUAGES = I18n.available_locales.map(&:to_s)

  validates :f_name, :l_name, :language, presence: true
  validates :profile_src, presence: true
  validates :language, inclusion: {in: LANGUAGES}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
