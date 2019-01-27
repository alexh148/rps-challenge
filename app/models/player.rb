class Player
  attr_reader :name, :choice

  def initialize(name, choice = nil)
    @name = name
    @choice = choice
  end

  def choose(choice)
    @choice = choice
  end

  def self.make_computer
    Player.new('Computer')
  end

  def random_choose
    @choice = ['Rock', 'Paper', 'Scissors'].sample
  end
end
