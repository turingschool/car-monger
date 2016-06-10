class Car < ActiveRecord::Base
  scope :alphabetical_by_make, -> { order(:make) }
  scope :model, -> (model)  {where(model: model )}
  scope :make, -> (make) { where(make: make )}
  scope :newer_than, -> (year) { where("year > ?", year)}
  scope :older_than, -> (year) { where("year < ?", year)}
  scope :rear_wheel_drive, -> { where(drive: "Rear-Wheel Drive")}
  scope :front_wheel_drive, -> { where(drive: "Front-Wheel Drive")}
  scope :city_mpg_less_than, -> (mpg) { where("city_mpg < ?", mpg)}
  scope :city_mpg_more_than, -> (mpg) { where("city_mpg > ?", mpg)}
end
