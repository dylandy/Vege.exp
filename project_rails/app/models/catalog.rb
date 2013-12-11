class Catalog < ActiveRecord::Base

  def self.count_me
    return where('id < 100').count
  end

  def good_name
    return self.name + "good!"
  end
end
