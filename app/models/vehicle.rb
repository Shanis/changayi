class Vehicle < ActiveRecord::Base
def self.search(search)
  if search
    find(:all, :conditions => ['year =', "%#{search}%"])
  else
    find(:all)
  end
end
end
