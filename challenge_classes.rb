class Election
  #for design
  def blankSpace
    return ' '*79
  end
  def putAst
    return '*'*79
  end
  def toCenter(txt)
    return txt.center(79, ' ')
  end
  #end
  #getter and setter
  attr_accessor :name
  attr_accessor :totalVotes
  attr_accessor :votedname
  attr_accessor :voterNum
  attr_accessor :invalid
  attr_accessor :candidate

  def initialize(candidates)
    @candidate=candidates
    @name=""
    @voterNum=1
    @votes=Array.new
    @totalVotes=0
    @votedname=""
    @ind=0
    @ind2=[]
    @invalid=0
  end

  def banner
    system "cls"
    puts blankSpace, blankSpace, blankSpace, putAst, putAst
    puts"""
          ▌ ▐·▪   ▌ ▐·▪  ▐▄• ▄ ▐▄• ▄      ▌ ▐·      ▄▄▄▄▄▪   ▐ ▄  ▄▄ •
         ▪█·█▌██ ▪█·█▌██  █▌█▌▪ █▌█▌▪    ▪█·█▌▪     •██  ██ •█▌▐█▐█ ▀ ▪
         ▐█▐█•▐█·▐█▐█•▐█· ·██·  ·██·     ▐█▐█• ▄█▀▄  ▐█.▪▐█·▐█▐▐▌▄█ ▀█▄
          ███ ▐█▌ ███ ▐█▌▪▐█·█▌▪▐█·█▌     ███ ▐█▌.▐▌ ▐█▌·▐█▌██▐█▌▐█▄▪▐█
         . ▀  ▀▀▀. ▀  ▀▀▀•▀▀ ▀▀•▀▀ ▀▀    . ▀   ▀█▄▀▪ ▀▀▀ ▀▀▀▀▀ █▪·▀▀▀▀


                     .▄▄ ·  ▄· ▄▌.▄▄ · ▄▄▄▄▄▄▄▄ .• ▌ ▄ ·.
                     ▐█ ▀. ▐█▪██▌▐█ ▀. •██  ▀▄.▀··██ ▐███▪
                     ▄▀▀▀█▄▐█▌▐█▪▄▀▀▀█▄ ▐█.▪▐▀▀▪▄▐█ ▌▐▌▐█·
                     ▐█▄▪▐█ ▐█▀·.▐█▄▪▐█ ▐█▌·▐█▄▄▌██ ██▌▐█▌
                       ▀▀▀▀   ▀ •  ▀▀▀▀  ▀▀▀  ▀▀▀ ▀▀  █▪▀▀▀
    """
    puts putAst, "VIVIXX PRESIDENTIAL VOTING SYSTEM".center(79, "*")
    puts putAst, putAst, blankSpace
    puts toCenter('>>> Press Enter to VOTE <<<')
    gets.chomp
  end

  def voterName
    system "cls"
    puts blankSpace, blankSpace, blankSpace, blankSpace, putAst, putAst
    puts toCenter("Your are voter number #{@voterNum}".upcase)
    puts putAst, putAst, blankSpace, blankSpace, blankSpace, blankSpace
    puts toCenter("What is your name?")
    print '>>> '.prepend(" "*27)
    @name=gets.chomp.strip
  end

  def invalids
    system "cls"
    puts blankSpace, blankSpace, blankSpace, blankSpace, blankSpace, blankSpace
    puts toCenter('Invalid VOTE! Not COUNTED!')
    puts toCenter('Press Enter to continue.')
    @invalid=0
    gets.chomp
  end

  def voteCounted
    system "cls"
    puts blankSpace, blankSpace, blankSpace, blankSpace, blankSpace, blankSpace
    puts toCenter("You VOTED for #{@votedname}!")
    puts toCenter('Press Enter to continue.')
    gets.chomp
  end

  def showCandidate
    system "cls"
    puts blankSpace, blankSpace
    puts toCenter("Welcome, #{@name.upcase}")
    puts blankSpace, blankSpace, putAst, putAst
    puts toCenter("LIST OF CANDIDATES")
    puts putAst
    for x in 0..@candidate.length-1
        puts "#{x+1}. #{@candidate[x][:candidate]}".prepend(" "*33)
    end
    puts putAst, blankSpace
  end



  def getWinner
    system "cls"
    for x in 0..@candidate.length-1
        @votes.push(@candidate[x][:votes])
    end

  counter=0
    for x in 0..@candidate.length-1
      if @candidate[x][:votes]==@votes.max
        @ind=x
        break
      end
    end
  for x in 0..@candidate.length-1
    if @votes.max != 0
    if @candidate[x][:votes]==@votes.max
      counter+=1
      @ind2.push(x)
    end
    end
  end

  if counter>=2
    voteGraph
    puts toCenter("It's a tie.")
    for x in 0..@ind2.length-1
      puts toCenter("#{@candidate[@ind2[x].to_i][:candidate] } with #{@candidate[@ind2[x].to_i][:votes]} vote/s.")
    end
      puts blankSpace, putAst
  elsif counter==0
    puts blankSpace, blankSpace, blankSpace, blankSpace, putAst, blankSpace
    puts toCenter("Program Terminated")
    puts blankSpace, putAst
  else
    voteGraph
      puts toCenter("The winner is #{@candidate[@ind.to_i][:candidate].strip} with #{@candidate[@ind.to_i][:votes]} vote/s.")
      puts blankSpace, putAst
  end
  end

  def voteGraph
    g=""
    puts blankSpace, blankSpace, toCenter('RESULT'), blankSpace, putAst, blankSpace
      for x in 0..@candidate.length-1
        if @candidate[x][:votes] !=0
          a=((@candidate[x][:votes].to_f/@totalVotes)*20).floor
          g="="*(((@candidate[x][:votes].to_f/@totalVotes)*20).floor)
          g=g.concat(" "*(20-a))
        else
          g=" "*20
        end
        puts "#{@candidate[x][:candidate].concat(' '*(7-@candidate[x][:candidate].length))} [ #{@candidate[x][:votes]} ] [ #{g} ] #{((@candidate[x][:votes].to_f/@totalVotes).to_f*100).round}% ".prepend(' '*15)
      end
    puts blankSpace, putAst, blankSpace
  end

end #end class

election = Election.new([
  {candidate: 'Mike', votes: 0},
  {candidate: 'Reggie', votes: 0},
  {candidate: 'Kenneth', votes: 0},
  {candidate: 'Trevor', votes: 0},
])


n=true
while n==true do
  if (election.invalid==0 and election.totalVotes>=1)
    election.voteCounted
  end

  if election.invalid==1
    election.invalids
  end

  election.banner
  election.voterName

if election.name.upcase != "EXIT_PROGRAM"
  election.showCandidate
  puts election.toCenter("Enter the number of your CANDIDATE.")
  print '>>> '.prepend(" "*27)
vote=gets.chomp

if vote.to_i>=1 and vote.to_i<=election.candidate.length
  election.candidate[vote.to_i-1][:votes]+=1
  election.votedname=election.candidate[vote.to_i-1][:candidate]
  election.voterNum+=1
  election.totalVotes+=1
elsif vote.upcase=="EXIT_PROGRAM"
  n=false
else
    election.invalid=1
end
else
n=false
end
end
election.getWinner
