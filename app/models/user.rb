class User < ApplicationRecord
  rolify
  def self.current_transaction
    ActiveRecord::Base.connection.current_transaction
  end
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
       
       
  has_many :articles, dependent: :destroy

end
