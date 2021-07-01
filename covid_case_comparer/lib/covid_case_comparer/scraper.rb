class CovidCaseComparer::Scraper
  
  def self.scrap_cal_cases
    doc = Nokogiri::HTML(open("https://covid19.ca.gov/state-dashboard/"))
    doc.css("div#total-cases-today").text.tr('today', '').strip
  end
  
  def self.scrap_cal_vax
    doc = Nokogiri::HTML(open("https://covid19.ca.gov/state-dashboard/"))
    doc.css("div#total-vaccines-number").text.gsub(/\s+/, " ").tr('total', '').strip
  end
  
  def self.scrap_on_cases
    case_a = []
    doc = Nokogiri::HTML(open("https://www.oha.com/news/updates-on-the-novel-coronavirus"))
    cases = doc.search("td.ms-rteTableEvenCol-3")
    
    cases.map do |r|
      case_a << r.text
    end
    case_a[7].tr('+', '').gsub(/\s+/, "")
  end
  
  def self.scrap_on_vax
    vax_a = []
    doc = Nokogiri::HTML(open("https://www.oha.com/news/updates-on-the-novel-coronavirus"))
    cases = doc.search("td.ms-rteTableEvenCol-3")
    
    cases.map do |r|
      vax_a << r.text
    end
    vax_a[12].gsub(/\s+/, ",")
  end
end