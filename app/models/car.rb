class Car < ActiveRecord::Base

  def self.alphabetical_by_make
    self.order(:make)
  end

  def self.make(make)
    where(make: make)
  end

  def self.model(model)
    where(model: model)
  end

  def self.newer_than(year)
    where("year > ?", year)
  end

  def self.older_than(year)
    where("year < ?", year)
  end

  def self.rear_wheel_drive
    where(drive: "Rear-Wheel Drive")
  end

  def self.front_wheel_drive
    where(drive: "Front-Wheel Drive")
  end

  def self.city_mpg_less_than(mpg)
    where("city_mpg < ?", mpg)
  end

  def self.city_mpg_more_than(mpg)
    where("city_mpg > ?", mpg)
  end
end
