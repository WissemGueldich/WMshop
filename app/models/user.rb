class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  has_one :room, dependent: :destroy
  has_one_attached :avatar,dependent: :destroy
  has_one :ratings
  has_many :comments
  include Rails.application.routes.url_helpers


  def to_s
    email
  end

  after_create do 
    customer = Stripe::Customer.create(email: email)
    update(stripe_customer_id: customer.id)
  end
  def image_url
    rails_blob_path(self.avatar, disposition: "attachment", only_path: true)
  end
end
