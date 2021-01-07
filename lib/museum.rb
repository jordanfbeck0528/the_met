class Museum
  attr_reader :name, :exhibits, :patrons
  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    @exhibits.select do |exhibit|
      exhibit if patron.interests.include?(exhibit.name)
    end.reverse
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    exhibit_hash = {}
    @exhibits.each do |exhibit|
      @patrons.each do |patron|
        if exhibit_hash[exhibit].nil? && patron.interests.include?(exhibit.name)
          exhibit_hash[exhibit] = [patron]
        elsif !exhibit_hash[exhibit].nil? && !exhibit_hash[exhibit].include?(patron) && patron.interests.include?(exhibit.name)
          exhibit_hash[exhibit] << patron
        elsif exhibit_hash[exhibit].nil?
          exhibit_hash[exhibit] = []
        end
      end
    end
    exhibit_hash
  end

  def ticket_lottery_contestants(exhibit)
    @patrons.map do |patron|
      patron if patron.interests.include?(exhibit.name) &&
      patron.spending_money < exhibit.cost
    end.compact
  end

  def draw_lottery_winner(exhibit)
    unless ticket_lottery_contestants(exhibit) == nil
      ticket_lottery_contestants(exhibit).sample.name
    end
  end
end
