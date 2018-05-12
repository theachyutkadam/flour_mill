class Operator < ActiveRecord::Base
  has_many :products
  belongs_to :user

  validates :first_name, presence: true, format: {with: /[a-z]/, message: 'Write only small letter'}
  validates :middle_name, presence: true, format: {with: /[a-z]/, message: 'Write only small letter'}
  validates :last_name, presence: true, format: {with: /[a-z]/, message: 'Write only small letter'}
  validates :mobile, presence: true, length: { minimum: 10}, :uniqueness => { scope: :user_id }, on: :create
  validates :mail, presence: true, :uniqueness => { scope: :user_id }, on: :create, :format => { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  validates :permanent_address, presence: true, format: {with: /[a-z0-9]/, message: 'Write only small letter'}
  validates :salary, presence: true, numericality: true

  before_create :create_user
  before_update :update_user

  def self.search(options)
    if options[:search]
      @operators = Operator.where("first_name like ? OR last_name like ? OR mobile like ?", "%#{options[:search]}%", "%#{options[:search]}%", "%#{options[:search]}%").order(last_name: :asc)
    else
      @operators = Operator.order(last_name: :asc)
    end
  end

  def create_user
    @user = User.new
    @user.email = self.mail
    @user.password = mobile
    @user.role_id = Role.find_by_name("Operator").id
    @user.save
    self.user_id = user.id
  end

  def update_user
    self.user.update(email: self.mail, password: mobile)
  end
end
