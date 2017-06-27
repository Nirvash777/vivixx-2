#Menu
$prod1="Menudo"
$prod2="Rice"
$prod3="Adobo"
$prod4="Kare-kare"
$prod5="Halo-Halo"

#Menu Price
$p1=30
$p2=10
$p3=50
$p4=80
$p5=100

#Global Variables
$orders=""
$tprice=0
$order=""
$num_of_order=0
$money=0

def getName
  puts "Welcome to Siegren's Restaurant!"
  puts 'Enter "e" to exit the program.'
  print "Good day, What is your name? "
  name=gets.chomp
  exitProgram(name)
  puts "Hello, #{name}. Choose your order."
end

def exitProgram(input)
  if input.upcase=="E"
    puts "Thank you! Come again!"
    exit
  end
end

def showMenu
  puts "___________________________________"
  puts "Menu of the Day"
  puts "1. #{$prod1} = #{$p1}"
  puts "2. #{$prod2} = #{$p2}"
  puts "3. #{$prod3} = #{$p3}"
  puts "4. #{$prod4} = #{$p4}"
  puts "5. #{$prod5} = #{$p5}"
  puts "___________________________________"
end

def getNumOfOrder
  print "How many: "
  num=gets.chomp
  if num.to_i==0
  $num_of_order=1
  else
  $num_of_order=num.to_i
  end
  exitProgram(num)
end

def getOrder
  n="y"
  while n.upcase=="Y" do
    showMenu
    print "Choose your order, just enter the number: "
    $order=gets.chomp
exitProgram($order)
    if $order=="1"
      getNumOfOrder
      $orders=$orders+$prod1+" @#{$p1} x#{$num_of_order} \n"
      $tprice=$tprice+($p1*$num_of_order)

    elsif $order=="2"
      getNumOfOrder
      $orders=$orders+$prod2+" @#{$p2} x#{$num_of_order} \n"
      $tprice=$tprice+($p2*$num_of_order)

    elsif $order=="3"
      getNumOfOrder
      $orders=$orders+$prod3+" @#{$p3} x#{$num_of_order} \n"
      $tprice=$tprice+($p3*$num_of_order)

    elsif $order=="4"
      getNumOfOrder
      $orders=$orders+$prod4+" @#{$p4} x#{$num_of_order} \n"
      $tprice=$tprice+($p4*$num_of_order)

    elsif $order=="5"
      getNumOfOrder
      $orders=$orders+$prod5+" @#{$p5} x#{$num_of_order} \n"
      $tprice=$tprice+($p5*$num_of_order)

    else
      puts "Choice is not in the Menu"
    end

    print "Order another? Press y to order more. Any key to pay: "
    n=gets.chomp
    exitProgram(n)
  end
end


def showOrder

  puts "\n________________________"
  if $orders==""
    print "Your ordered nothing.\n"

  else
    print "Your ordered\n#{$orders}"
  end
  puts "_________________________\n"
  puts "Total price is #{$tprice}"
  puts "________________________\n"
end

def getMoney
if $orders !=""
  n=true
  while n==true do
    print "Enter amount of money: "
    m=gets.chomp
    $money=m.to_i
    exitProgram(m)
    if $money>=$tprice
      n=false
    else
      puts "Your money is lesser than the total amount due."
    end
  end
  puts "Your change is #{$money-$tprice}"
end
  puts "Thank you! Please come back again :)"
end


def executeProgram
  getName
  getOrder
  showOrder
  getMoney
end

executeProgram
