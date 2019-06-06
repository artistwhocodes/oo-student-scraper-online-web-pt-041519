require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    page = Nokogiri::HTML(open(index_url))
    students = [] #empty array to store our list
    # iterate through page beacuse that's where profile_url, location and name is
      page.css("div.roster-cards-container .student-card").collect do |card|
        #while we iterate, push our need infor inside
        students <<
        {
          profile_url: card.css("a").attribute('href').value, #key => value
          location: card.css('.student-location').text,
          name: card.css('.student-name').text
        }
      end
        students
  end

  def self.scrape_profile_page(profile_url)
    student_profile = Nokogiri::HTML(open(profile_url))
    profile_pages = {} #empty hash
    student_profile.css("div.social-icon-container a").each do |link|
      href = link.attribute("href").value  #all the links

      if href.include?("twitter")  # find link that has twitter
        profile_pages[:twitter] = href  #key will equal the link that has twitter
      elsif href.include?("linkedin")
        profile_pages[:linkedin] = href
      elsif href.include?("github")
        profile_pages[:github] = href
      else
        profile_pages[:blog] = href
      end


     profile_pages[:profile_quote] = student_profile.css("div.profile-quote").text
     profile_pages[:bio] = student_profile.css("p").text
        # :github =>           ,
        # :blog =>             ,
        # :profile_quote =>       ,
        # :bio =>
#student_profile.css(".social-icon-container a").attribute('href').value
   end
   profile_pages #return the now filled hash
 # binding.pry
  end

end
