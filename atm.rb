#!/usr/bin/ruby
        # require 'io/console'
      require 'highline/import'
@account=[{
    accountname: 'Joseph',
    accountnum: '12345678',
    pin: '1234',
    money: 80000

  }]
def blankSpace
  return ' '*79
end
def putAst
  return '*'*79
end
def toCenter(txt)
  return txt.center(79, ' ')
end

def banner
  system "cls"
puts blankSpace, blankSpace,blankSpace,blankSpace,blankSpace,blankSpace, putAst, putAst, blankSpace
puts toCenter('BPI')
puts toCenter("AUTOMATIC TELLER MACHINE")
puts blankSpace, putAst, putAst, blankSpace, blankSpace, blankSpace

  puts toCenter(">>> INSERT CARD HERE <<<")
gets.chomp
end

def menu
    system "cls"
    puts blankSpace, blankSpace,blankSpace,blankSpace,blankSpace, putAst, blankSpace
    puts toCenter("TRANSACTION")
    puts blankSpace, putAst
    puts "1. Withdraw".prepend(" "*27)
    puts "2. Balance"  .prepend(" "*27)
    puts "3. Exit"  .prepend(" "*27)
end
@choice=0


@getC=false
@cn=true
def password_prompt(message, mask='*')

  ask(message) { |q| q.echo = mask}
end
def getNum


  banner

        system "cls"

  # text = STDIN.noecho(&:gets).chomp

  puts blankSpace, blankSpace, blankSpace, blankSpace, putAst, blankSpace

      puts toCenter("Enter your pin number.")
     pin = password_prompt('>>> '.prepend(" "*27), '*')
 #pin=ask(">>> "){ |q| q.echo = '*'}

      #print ">>> ".prepend(" "*27)
    # system 'stty -echo'


  #   pin = ask('>>> ') { |q| q.echo = '*'}

      if @account[0][:pin]==pin
          @getC=true;

      else
        system "cls"
        puts blankSpace, blankSpace, blankSpace, blankSpace, putAst, blankSpace
        puts toCenter("Invalid pin.")
        puts toCenter("Removing Card...")
        puts blankSpace, blankSpace, blankSpace, blankSpace, putAst, blankSpace
        # puts toCenter(">>> Press ENTER to continue. <<<")
        # gets.chomp

      end


end

def withdraw
  system "cls"
  puts blankSpace, blankSpace, blankSpace, blankSpace, putAst, blankSpace
  puts toCenter("WITHDRAWAL")
  puts blankSpace, putAst
  puts toCenter("How much? ")
  print ">>> ".prepend(" "*27)
  wmoney=gets.chomp.to_i
  if wmoney >@account[0][:money]
    system "cls"
    puts blankSpace, blankSpace, blankSpace, blankSpace, putAst, blankSpace
    puts toCenter("Insufficient Balance.")
    puts blankSpace, putAst, blankSpace
    puts toCenter("Thank you for banking with us")
  puts blankSpace, putAst, blankSpace
  @con=false
  else
    system "cls"
    puts blankSpace, blankSpace, blankSpace, blankSpace, putAst, blankSpace
    @account[0][:money]=@account[0][:money]-wmoney
    puts toCenter("You withdrew #{wmoney} pesos. ")
    puts blankSpace
  con
  end
end
@con=true

def con
    puts blankSpace, putAst, blankSpace
    puts toCenter("Another transaction? Y/anykey : ")
    print ">>> ".prepend(' '*27)
    x= gets.chomp
    if x.upcase=="Y"
@con=true
      else
        system "cls"
        puts blankSpace, blankSpace, blankSpace, blankSpace, putAst, blankSpace
        puts toCenter("Thank you for banking with us")
        puts blankSpace, putAst, blankSpace

  @con=false

    end
end
def getChoice

  while @con==true do
    menu
    puts blankSpace, putAst
    puts toCenter("Enter your choice.")
    puts blankSpace
  #  print ">>> ".prepend(" "*27)
  #  @choice=gets.chomp.to_i

    @choice=ask(">>> ".prepend(" "*27)).to_i

    if @choice==1

        withdraw

    elsif @choice==2
        system "cls"
        puts blankSpace, blankSpace, blankSpace, blankSpace, putAst, blankSpace
        puts toCenter("Your Balance is #{@account[0][:money]}.")
        con
      elsif @choice==3
        system "cls"
        puts blankSpace, blankSpace, blankSpace, blankSpace, putAst, blankSpace
        puts toCenter("Thank you for banking with us")
        puts blankSpace, putAst, blankSpace
        gets.chomp
        exit

    else
      system "cls"
      puts blankSpace, blankSpace, blankSpace, blankSpace, putAst, blankSpace
      puts toCenter("Invalid choice")
      puts toCenter(">>> Press ENTER to continue.<<<")
      gets.chomp
    end


end
end

def exeProgram

    getNum
    if @getC == true
      getChoice
    end
end

exeProgram
