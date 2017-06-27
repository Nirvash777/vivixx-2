require 'csv'
require 'colorize'

@db_car = 'car.csv'
@db_order = 'order.csv'
@db_perf = 'perf.csv'
@db_visl = 'visl.csv'
@track_num = ''
@bill = 0

class Car
  attr_accessor :code, :make, :model, :price
  def initialize(hash)
    @code = hash[:code]
    @make = hash[:make]
    @model = hash[:model]
    @price = hash[:price]
  end

  def self.from_cars_row(row)
    self.new({
        code: row['code'],
        make:  row['make'],
        model:  row['model'],
        price: row['price']
      })
  end

    HEADERS = ['code', 'make', 'model', 'price'] #capital variable is constant

    def to_cars_row
      CSV::Row.new(HEADERS, [code, make, model, price])
    end

end

class Order
  attr_accessor :tracker, :code, :name
  def initialize(hash)
    @code = hash[:code]
    @tracker = hash[:tracker]
    @name = hash[:name]
  end

  def self.from_order_row(row)
    self.new({
        code: row['code'],
        tracker:  row['tracker'],
        name: row['name']
      })
  end

    HEADERS = ['tracker', 'code', 'name'] #capital variable is constant

    def to_order_row
      CSV::Row.new(HEADERS, [tracker, code, name])
    end
end

class Performance
  attr_accessor :tracker, :perf, :price
  def initialize(hash)
    @tracker = hash[:tracker]
    @perf = hash[:perf]
    @price = hash[:price]
  end

  def self.from_perf_row(row)
    self.new({
        tracker:  row['tracker'],
        perf: row['perf'],
        price:  row['price']
      })
  end

    HEADERS = ['tracker', 'perf', 'price'] #capital variable is constant

    def to_perf_row
      CSV::Row.new(HEADERS, [tracker, perf, price])
    end
end

class Visual
  attr_accessor :tracker, :visl, :price
  def initialize(hash)
    @tracker = hash[:tracker]
    @visl = hash[:visl]
    @price = hash[:price]
  end

  def self.from_visl_row(row)
    self.new({
        tracker:  row['tracker'],
        visl: row['visl'],
        price:  row['price']
      })
  end

    HEADERS = ['tracker', 'visl', 'price'] #capital variable is constant

    def to_visl_row
      CSV::Row.new(HEADERS, [tracker, visl, price])
    end
end

def car_code
  code = []
  CSV.foreach(@db_car, headers: true) do |row|
    car = Car.from_cars_row(row)
    code << car.code.to_i
  end
  return code.max.to_i + 1
end

def tracker_code
  track_num = []
    CSV.foreach(@db_order, headers: true) do |row|
      tracker = Order.from_order_row(row)
      track_num << tracker.tracker.to_i
    end
  return track_num.max.to_i + 1
end

def check_tracking_num(code)
  track_num = []
    CSV.foreach(@db_order, headers: true) do |row|
      tracker = Order.from_order_row(row)
      track_num << tracker.tracker.to_i
    end
    return track_num.include? code.to_i
end

def track_view
  code = 0
  @bill=0
  system "cls "
  puts "\n"
  puts " TRACK ORDER ".center(79, "=")
  puts "\n"
  puts "Type 'EXIT' to go back".prepend(" "*30)
  puts "\n"
  puts "Enter Tracking Number: ".prepend(" "*30)
  print '>>> '.prepend(" "*30)
  track_num = gets.chomp
  if track_num.upcase != 'EXIT'
  CSV.foreach(@db_order, headers: true) do |row|
    tracker = Order.from_order_row(row)
    if track_num.to_i == tracker.tracker.to_i
        code = tracker.code.to_i
      break
    end
  end

    puts "\n"
    if code.to_i != 0
      CSV.foreach(@db_car, headers: true) do |row|
        car = Car.from_cars_row(row)
        if code.to_i == car.code.to_i
              @bill += car.price.to_i
              puts "Your order is #{car.make.upcase}  #{car.model.upcase} - P#{car.price} ".center(79, " ")
              break
        end
      end
      puts "\n"

      CSV.foreach(@db_perf, headers: true) do |row|
        car_perf = Performance.from_perf_row(row)
        if track_num.to_i == car_perf.tracker.to_i
            @bill += car_perf.price.to_i
            puts "Upgraded #{car_perf.perf} - #{car_perf.price}".center(79, " ")
        end
      end
      puts "\n"
      CSV.foreach(@db_visl, headers: true) do |row|
        car_visl = Visual.from_visl_row(row)
        if track_num.to_i == car_visl.tracker.to_i
            @bill += car_visl.price.to_i
            puts "Upgraded #{car_visl.visl} - #{car_visl.price}".center(79, " ")
        end
      end
      puts "\n"
        puts "Total Bill: #{@bill}".center(79, " ")
      gets.chomp

    else
      msg("INVALID")
    end

  end
end

def part_menu
  system "cls"
  puts "Car Parts Menu".center(79, "=")
  puts "1. Performance Parts".prepend(" "*30)
  puts "2. Visual Customisation".prepend(" "*30)
  puts "3. Exit".prepend(" "*30)
end

def save_perf(tracker, perf, price)
  car_perf = Performance.new({
    tracker: tracker,
    perf: perf,
    price: price
    })

  CSV.open(@db_perf, 'a+') do |perf|
    perf << car_perf.to_perf_row
  end
  msg("SUCCESSFULLY SAVED")
end

def save_visl(tracker, visl, price)
  car_visl = Visual.new({
    tracker: tracker,
    visl: visl,
    price: price
    })

  CSV.open(@db_visl, 'a+') do |visl|
    visl << car_visl.to_visl_row
  end
  msg("SUCCESSFULLY SAVED")

end

def perf(perf)
  case perf.to_i
  when 1
    save_perf(@track_num, 'Air Filter', 175)
    # @custom_price += 175
  when 2
    save_perf(@track_num, 'Brakes', 200)
    # @custom_price += 200
  when 3
    save_perf(@track_num, 'Cam Shaft', 275)
    # @custom_price += 275
  when 4
    save_perf(@track_num, 'Clutch', 2000)
    # @custom_price += 2000
  when 5
    save_perf(@track_num, 'Cooling System', 3500)
    # @custom_price += 3500
  else
      msg("INVALID")
  end

end

def visl(visl)
  case visl.to_i
  when 1
    save_visl(@track_num, 'Front Bumper', 175)
  when 2
    save_visl(@track_num, 'Front Fenders', 200)
  when 3
    save_visl(@track_num, 'Headlights', 275)
  when 4
    save_visl(@track_num, 'Splitter', 2000)
  when 5
    save_visl(@track_num, 'Hood', 3500)
  else
      msg("INVALID")
  end
end

def upgrade_menu
  loop do
    part_menu
    puts "\n"
    print "Enter your choice: ".prepend(" "*27)
    car = gets.chomp

    case car
    when "1"
      system "cls"
      @custom_price=0
      puts "\n"
      puts " CUSTOMIZE PERFORMANCE ".center(79, "=")
      puts "\n"
      puts "1. Air filter = $175".prepend(" "*30)
      puts "2. Brakes = $200".prepend(" "*30)
      puts "3. Cam Shaft = $275".prepend(" "*30)
      puts "4. Clutch = $2,000".prepend(" "*30)
      puts "5. Cooling System = $3,500".prepend(" "*30)
      puts "\n"
      print "Enter your choice: ".prepend(" "*30)
      perf = gets.chomp
      perf(perf)
    when "2"
      system "cls"
      @custom_price=0
      puts "\n"
      puts " CUSTOMIZE VISUALS ".center(79, "=")
      puts "\n"
      puts "1. Front Bumper - $175".prepend(" "*30) #RocketBunny and Ford Mustang RTR
      puts "2. Front Fenders - $200".prepend(" "*30)
      puts "3. Headlights - $275".prepend(" "*30)
      puts "4. Splitter - $2000".prepend(" "*30)
      puts "5. Hood - $3500".prepend(" "*30)
      puts "\n"
      print "Enter your choice: ".prepend(" "*30)
      visl = gets.chomp
      visl(visl)
      # msg("You will pay: $#{@custom_price}")
    when "3"
      break
    else
      msg("Wrong Input")
    end
  end
end

def car_menu
  loop do
    system "cls"
    puts "\n"
    puts " CAR LIST ".center(79, "=")
    puts "\n"
    CSV.foreach(@db_car, headers: true) do |row|
      car = Car.from_cars_row(row)
      puts "#{car.code}. #{car.make.upcase} - #{car.model.upcase} - #{car.price} ".prepend(" "*30)
    end
    puts "\n"
    puts "="*79
    puts "\n"
    puts "Type 'EXIT' to go back".prepend(" "*30)
    puts "\n"
    puts "Enter Car Code: ".prepend(" "*30)
    print '>>> '.prepend(" "*30)
    code = gets.chomp
    code_arr = []

      CSV.foreach(@db_car, headers: true) do |row|
        car = Car.from_cars_row(row)
        code_arr << car.code.to_i
      end

      check = code_arr.include? code.to_i

      if code.upcase != "EXIT"
        if check == true
          puts "What is your name: ".prepend(" "*30)
          print '>>> '.prepend(" "*30)
            name = gets.chomp
            tracker_num = tracker_code
                  order = Order.new({
                  tracker: tracker_num,
                  code: code,
                  name: name

                  })

                CSV.open(@db_order, 'a+') do |orders|
                  orders << order.to_order_row
                end


                msg("ORDERED SUCCESSFULLY")
                msg("Your tracking number is #{tracker_num}")

        else
          msg("INVALID CODE")
        end
      else
        break
      end
  end
end

def car_save
  system "cls"
  puts "\n"
  puts " ADD NEW CAR ".center(79, "=")
  puts "\n"
  puts "Car Maker: ".prepend(" "*30)
  print '>>> '.prepend(" "*30)
  make = gets.chomp
  puts "Car Model: ".prepend(" "*30)
  print '>>> '.prepend(" "*30)
  model = gets.chomp
  puts "Price: ".prepend(" "*30)
  print '>>> '.prepend(" "*30)
  price = gets.chomp

  car = Car.new({
    code: car_code,
    make: make,
    model: model,
    price: price
    })

  CSV.open(@db_car, 'a+') do |cars|
    cars << car.to_cars_row
  end
  msg("SUCCESSFULLY SAVED")
end

def msg(msg)
  system "cls"
  puts "\n\n\n\n\n\n\n"
  puts "="*79
  puts "\n"
  puts msg.center(79, " ")
  puts "\n"
  puts "="*79
  gets.chomp
end

def start_program
  loop do
    system "cls"
    puts "\n\n\n\n\n\n"
    puts "="*79
    puts " CAR SHOP ".center(79, "=")
    puts "="*79
    puts "\n"
    puts"  ╔═════════╗       ╔═══════╗       ╔════════╗   ".center(80, " ").black.on_white
    puts"  ║  ORDER  ║       ║ Track ║       ║  EXIT  ║   ".center(80, " ").black.on_white
    puts"  ╚═════════╝       ╚═══════╝       ╚════════╝   ".center(80, " ").black.on_white
      print "\n\n"
    puts " >>> ENTER TRANSACTION <<< ".center(79, "=")
    print '   '.prepend(" "*30)
    transaction = gets.chomp
    case transaction.upcase
      when "ORDER"
        car_menu
      when "TRACK"
        track_view
      when 'EXIT'
        break
      when 'ADMIN'
        car_save
      when 'CUSTOM'
        system "cls"
        puts "\n"
        puts " UPGRADE CAR ".center(79, "=")
        puts "\n"
        puts "Type 'EXIT' to go back".prepend(" "*30)
        puts "\n"
        puts "Enter Tracking Number: ".prepend(" "*30)
        print '>>> '.prepend(" "*30)
        @track_num = gets.chomp
        if @track_num.upcase != 'EXIT'
          if check_tracking_num(@track_num) == true
            upgrade_menu
          else
            msg('Invalid Tracking Number')
          end
        end
      else
        msg("INVALID")
      end
  end
end

start_program
