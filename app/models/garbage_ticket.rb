class GarbageTicket < ActiveRecord::Base
  attr_accessible :email, :is_open, :latitude, :level, :location, :longitude, :mobile, :remark
end
