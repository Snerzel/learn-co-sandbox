 class CovidCaseComparer::CLI
  def call
    puts "Today's cases!"
    daily_cases
    vax_prompt
  end
  
  def daily_cases

    @places = CovidCaseComparer::Place.today
    @places.each do |place|
      puts "#{place.name} cases are #{place.cases} today. "
    end
  end
  
  def vax_prompt
    
    puts "Would you like to see vaccinations?"
    input = gets.strip
    case input
    when "yes"
    @places.each do |place|
      puts "#{place.name} has administerd #{place.vax} total! "
    end
    when "no"
      puts "Okay bye!"
    else
      puts "Oh No! I don't know what to do with that!"
      vax_prompt
    end
  end
end