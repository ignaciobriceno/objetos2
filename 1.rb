class Table

  attr_reader :name,:income

  def initialize(name,*income)
  # @income es un array de enteros
    @name = name
    @income = income.map(&:to_i)
  end

  def self.read_file(file = 'casino.txt')
    data = File.open(file,'r').readlines.map(&:chomp)
    tables_objects = []

    data.each do |line|
      table_data = line.split(', ')
      tables_objects << Table.new(*table_data)
    end
    return tables_objects
  end

  def best_day
    "La #{self.name} tuvo su ingreso maximo el dia #{self.income.index(self.income.max)+1} con un valor de #{self.income.max}"
  end 

  def self.daily_average
    casino = self.read_file
    sum_total = 0
    days_total = 0

    casino.each do |table|
      sum_total =+ table.income.sum
      days_total =+ table.income.length
    end
    return "El promedio diario es #{sum_total/days_total}"
  end

end

Table.read_file('casino.txt').each do |table|
   puts table.best_day
end

puts Table.daily_average
