require 'test_helper'

class CarTest < ActiveSupport::TestCase

  test 'returns cars in alphabetical order' do
    car_one   = Car.create( make: "Subaru")
    car_two   = Car.create( make: "AM General")
    car_three = Car.create(make: 'Ford')

    assert_equal [car_two, car_three, car_one], Car.alphabetical_by_make
  end

  test 'return cars by a particular make' do
    car_one   = Car.create( make: "Subaru")
    car_one_a   = Car.create( make: "Subaru")
    car_two   = Car.create( make: "AM General")
    car_three = Car.create(make: 'Ford')


    assert_equal [car_one, car_one_a], Car.make('Subaru')
  end

  test 'returns cars of a particular model' do
    car_one   = Car.create( model: "A")
    car_two   = Car.create( model: "B")
    car_two_b   = Car.create( model: "B")
    car_three = Car.create(model: 'C')

    assert_equal [car_two, car_two_b], Car.model("B")
  end

  test "returns cars newer than a particular date" do
    car_one   = Car.create( year: "1977")
    car_two   = Car.create( year: "1987")
    car_three   = Car.create( year: "1997")
    car_four = Car.create(year: '2007')

    assert_equal [car_three, car_four], Car.newer_than("1995")
  end

  test "returns cars older than a particular date" do
    car_one   = Car.create( year: "1977")
    car_two   = Car.create( year: "1987")
    car_three   = Car.create( year: "1997")
    car_four = Car.create(year: '2007')

    assert_equal [car_one, car_two], Car.older_than("1995")
  end

  test "returns cars that are all rear-wheel drive" do
    car_one   = Car.create( drive: "Rear-Wheel Drive")
    car_two   = Car.create( drive: "Rear-Wheel Drive")
    car_three   = Car.create( drive: "Front-Wheel Drive")
    car_four = Car.create(drive: 'All-Wheel Drive')

    assert_equal [car_one, car_two], Car.rear_wheel_drive
  end

  test "returns cars that are all front-wheel drive" do
    car_one   = Car.create( drive: "Rear-Wheel Drive")
    car_two   = Car.create( drive: "Rear-Wheel Drive")
    car_three   = Car.create( drive: "Front-Wheel Drive")
    car_four = Car.create(drive: 'All-Wheel Drive')

    assert_equal [car_three], Car.front_wheel_drive
  end

  test "returns cars with mpg less than particular amount" do
    car_one   = Car.create( city_mpg: "16")
    car_two   = Car.create( city_mpg: "20")
    car_three   = Car.create( city_mpg: "10")
    car_four = Car.create(city_mpg: '25')

    assert_equal [car_one, car_two, car_three], Car.city_mpg_less_than("21")
  end

  test "returns cars with mpg more than particular amount" do
    car_one   = Car.create( city_mpg: "16")
    car_two   = Car.create( city_mpg: "20")
    car_three   = Car.create( city_mpg: "10")
    car_four = Car.create(city_mpg: '25')

    assert_equal [car_two, car_four], Car.city_mpg_less_than("19")
  end
end
