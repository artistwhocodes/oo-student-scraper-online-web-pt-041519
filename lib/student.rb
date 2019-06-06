class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url

  @@all = []

  def initialize(student_hash)
    @name = student_hash[:name]
    @location = student_hash[:location]
    @@all << self
  end

  def self.create_from_collection(students_array)
    students_array.each{|student| Student.new(student)}
  end

  def add_student_attributes(attributes_hash) #instance variables assign to key,value
    attributes_hash.each do |key,value| 
      if key == :twitter
        @twitter = value
      elsif
        key == :linkedin
        @linkedin = value
      elsif
        key == :github
        @github = value
      elsif
        key == :blog
        @blog = value
      elsif
        key == :profile_quote
        @profile_quote = value
      elsif
        key == :profile_url
        @profile_url = value
      elsif
        key == :bio
        @bio = value
      end
    end
   # binding.pry
  end

  def self.all
    @@all
  end

end
