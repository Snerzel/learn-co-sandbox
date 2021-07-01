class CovidCaseComparer::Place
  
  attr_accessor :name, :cases, :vax
  
  
  def self.today
    
  
    
    place_1 = self.new
    place_1.name = "California"
    place_1.cases = CovidCaseComparer::Scraper.scrap_cal_cases
    place_1.vax = CovidCaseComparer::Scraper.scrap_cal_vax
    
    place_2 = self.new
    place_2.name = "Ontario"
    place_2.cases = CovidCaseComparer::Scraper.scrap_on_cases
    place_2.vax = CovidCaseComparer::Scraper.scrap_on_vax
    
    [place_1, place_2]
    
  end
  
 
  
end