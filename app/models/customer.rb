class Customer < ActiveRecord::Base
  has_many :products
  has_many :payments
  belongs_to :user

  validates :first_name, presence: true, format: {with: /[a-z]/, message: 'Write only small letter'}
  validates :last_name, presence: true, format: {with: /[a-z]/, message: 'Write only small letter'}
  validates :address, presence: true, format: {with: /[a-z0-9]/, message: 'Write only small letter'}
  validates :mail, :uniqueness => { scope: :user_id }, on: :create
  validates :mobile_num, numericality: true, :length => { in: 10..10 }, uniqueness: true, on: :create
  validates :family_members, numericality: true
  before_create :create_user
  before_update :update_user

  def self.search(options)
    if options[:search]
      Customer.where("first_name like ? OR last_name like ? OR mobile_num like ?", "%#{options[:search]}%", "%#{options[:search]}%", "%#{options[:search]}%")
    else
      Customer.order(last_name: :asc)
    end
  end

  def create_user
    if self.mail.blank?
      self.mail = generate_username
    end
    user = User.new
    user.email = self.mail
    user.password = mobile_num
    user.role_id = Role.find_by_name("Customer").id
    user.save
    self.user_id = user.id
  end

  def generate_username
    first_name + mobile_num.to_s.last(4) + "@gmail.com"
  end

  def update_user
    if self.mail.blank?
      self.mail = generate_username
    end
    self.user.update(email: self.mail, password: mobile_num)
  end
end