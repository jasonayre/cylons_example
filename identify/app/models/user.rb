class User < ActiveRecord::Base
  include ::Cylons::Remote
  include ::Cylons::RemotePagination

  # remote_has_many :manufacturers
  # remote_has_many :categories
  # remote_has_many :products
  # remote_has_many :departments

  validates_uniqueness_of :email

  scope :by_id, lambda{ |*ids|
    where(:id => ids.flatten )
  }

  scope :by_email, lambda{ |*emails|
    puts emails
    where(:email => emails.flatten )
  }

  scope :by_name, lambda{ |*names|
    puts names.inspect
    where(:name => names.flatten )
  }
end
