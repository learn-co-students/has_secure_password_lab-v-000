class Session < ActiveRecord::Base
		validates_presence_of :name
		validates_uniqueness_of :name
		validates_presence_of :password

end

