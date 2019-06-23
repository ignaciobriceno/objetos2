class Roulette
  def play(apuesta)
    @roulette = (1..10).to_a.sample
    @apuesta = apuesta
    (@apuesta == @roulette)? winner : historial
  end

  def winner
    file  = File.open('winners.txt', 'a')
    file.puts "#{@apuesta}"
    historial
  end

  def historial    
    file = File.open('roulette_history.txt', 'a')
    file.puts "#{@roulette}"
    file.close
  end

  def self.read_file(file = 'roulette_history.txt')
    data = File.open(file, 'r').readlines.map(&:chomp)
    obj_roulette = []

    data.each do |line|
      roulette_data = line.split(', ')
      obj_roulette << roulette_data
    end
    group = []
    grouped = obj_roulette.group_by{|x| x}
    grouped.each do |k,v|
      group.push(v.count)
      # puts grouped[k]=v.count
    end
    cant = group.length
    if group[cant] = group.max
      puts group[cant]
    end
  end
end

p1 = Roulette.new
p1.play(3)
Roulette.read_file()