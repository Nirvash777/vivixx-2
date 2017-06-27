@profile={
fname: '',
lname: ''
}
@lot_num=[0,0,0]
@your_num=[0,0,0]
@count=0

def randomNum
  for x in 0..2
    c=true
      while c == true do
         rnd=rand(1..9)
        if @lot_num.include?(rnd.to_i)!=true
            c=false
            @lot_num[x]=rnd
        end
      end
  end
end
def blankSpace
  return ' '*79
end
def putAst
  return '*'*79
end
def toCenter(txt)
  return txt.center(79, ' ')
end
def startScreen
  system "cls"
  puts blankSpace, blankSpace, blankSpace, putAst, putAst
  puts """

         ██▓     ▒█████  ▄▄▄█████▓▄▄▄█████▓▓█████  ██▀███  ▓██   ██▓
        ▓██▒    ▒██▒  ██▒▓  ██▒ ▓▒▓  ██▒ ▓▒▓█   ▀ ▓██ ▒ ██▒ ▒██  ██▒
        ▒██░    ▒██░  ██▒▒ ▓██░ ▒░▒ ▓██░ ▒░▒███   ▓██ ░▄█ ▒  ▒██ ██░
        ▒██░    ▒██   ██░░ ▓██▓ ░ ░ ▓██▓ ░ ▒▓█  ▄ ▒██▀▀█▄    ░ ▐██▓░
        ░██████▒░ ████▓▒░  ▒██▒ ░   ▒██▒ ░ ░▒████▒░██▓ ▒██▒  ░ ██▒▓░
        ░ ▒░▓  ░░ ▒░▒░▒░   ▒ ░░     ▒ ░░   ░░ ▒░ ░░ ▒▓ ░▒▓░   ██▒▒▒
        ░ ░ ▒  ░  ░ ▒ ▒░     ░        ░     ░ ░  ░  ░▒ ░ ▒░ ▓██ ░▒░
          ░ ░   ░ ░ ░ ▒    ░        ░         ░     ░░   ░  ▒ ▒ ░░
            ░  ░    ░ ░                       ░  ░   ░      ░ ░
                                                            ░ ░

  """
  #puts 'LOTTERY'.center(79, '*')
  puts putAst, putAst, blankSpace, blankSpace
  puts toCenter(">>> Press ENTER to PLAY <<<")
  con=gets.chomp
  if con.strip.upcase=="EXIT_PROGRAM"
    exit
  end
end
def showPoints
  showNumbers
  puts blankSpace
  if @count>=1
    puts toCenter("Congratulations, #{@profile[:fname]} #{@profile[:lname]}, You win! You've got #{@count} points!")
  else
    puts toCenter("Sorry, #{@profile[:fname]} #{@profile[:lname]}, You lose! You've got #{@count} points!")
  end
  puts putAst, blankSpace
  puts toCenter(">>> Press ENTER to continue <<<")
  @lot_num=[0,0,0]
  @your_num=[0,0,0]
  gets.chomp
end

def getName
  system "cls"
  puts blankSpace, blankSpace, blankSpace, blankSpace
  puts toCenter("Please tell me your first name.")
  puts blankSpace
  print ">>> ".prepend(" "*27)
  fname =gets.chomp
  @profile[:fname]=fname

  system "cls"
  puts blankSpace, blankSpace, blankSpace, blankSpace
  puts toCenter("Please tell me your last name.")
  puts blankSpace
    print ">>> ".prepend(" "*27)
  lname =gets.chomp
  @profile[:lname]=lname
end

def getNumbers
  @count=0
  system "cls"
  puts blankSpace, blankSpace, blankSpace, blankSpace, blankSpace, putAst, blankSpace
  puts toCenter("Welcome, #{@profile[:fname].upcase} #{@profile[:lname].upcase}.")
  puts toCenter("Please enter three numbers, from 1 to 9 only.")
  puts toCenter("If you guess at least one number you win.")
  puts blankSpace, putAst, blankSpace
  puts toCenter('>>> Press ENTER to continue <<<')
gets.chomp
  for x in 1..3
    ent=true
    while ent==true do
      system "cls"
      puts blankSpace, blankSpace, blankSpace, blankSpace
      puts """

        ▄▄▄ . ▐ ▄ ▄▄▄▄▄▄▄▄ .▄▄▄       ▐ ▄ ▄• ▄▌• ▌ ▄ ·. ▄▄▄▄· ▄▄▄ .▄▄▄
        ▀▄.▀·•█▌▐█•██  ▀▄.▀·▀▄ █·    •█▌▐██▪██▌·██ ▐███▪▐█ ▀█▪▀▄.▀·▀▄ █·
        ▐▀▀▪▄▐█▐▐▌ ▐█.▪▐▀▀▪▄▐▀▀▄     ▐█▐▐▌█▌▐█▌▐█ ▌▐▌▐█·▐█▀▀█▄▐▀▀▪▄▐▀▀▄
        ▐█▄▄▌██▐█▌ ▐█▌·▐█▄▄▌▐█•█▌    ██▐█▌▐█▄█▌██ ██▌▐█▌██▄▪▐█▐█▄▄▌▐█•█▌
        ▀▀▀ ▀▀ █▪ ▀▀▀  ▀▀▀ .▀  ▀    ▀▀ █▪ ▀▀▀ ▀▀  █▪▀▀▀·▀▀▀▀  ▀▀▀ .▀  ▀

      """
      puts blankSpace, putAst, blankSpace
      puts toCenter("Enter entry #{x}: ")
      print '>>> '.prepend(' '*27)
      entry=gets.chomp

      if @your_num.include?(entry.to_i)==true or entry.to_i>=10
        system "cls"
        puts blankSpace, blankSpace, blankSpace, blankSpace
        puts toCenter("Your have entered an invalid number or you've already chosen that number.")
        puts blankSpace
        puts toCenter(">>> Press ENTER to continue <<<")
        gets.chomp
      else
        ent=false
        if @lot_num.include?(entry.to_i)==true
          @count+=1
        end
          @your_num[x-1]=entry.to_i
      end
    end

  end
end

def showNumbers
  puts blankSpace, blankSpace, blankSpace, putAst, putAst
  puts toCenter("MYSTERY NUMBERS")
ms=""
  for x in 0..2
    ms = ms+"#{@lot_num[x]} "
  end
  puts toCenter(ms.strip)
  puts blankSpace, putAst, blankSpace, blankSpace
  puts putAst, putAst
  ys=""
puts toCenter("Your Numbers")
  for x in 0..2
    ys=ys+"#{@your_num[x]} "
  end
  puts toCenter(ys.strip)
  puts blankSpace, putAst, blankSpace, blankSpace
end

def startProgram
  while true do

  startScreen
  getName
  randomNum
  getNumbers
  showPoints
end
end


startProgram
