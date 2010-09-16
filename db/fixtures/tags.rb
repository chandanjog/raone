class ActiveRecord::Base
  # given a hash of attributes including the ID, look up the record by ID.
  # If it does not exist, it is created with the rest of the options.
  # If it exists, it is updated with the given options.
  #
  # Raises an exception if the record is invalid to ensure seed data is loaded correctly.
  #
  # Returns the record.
  def self.create_or_update(options = {})
    id = options.delete(:id)
    record = find_by_id(id) || new
    record.id = id
    record.attributes = options
    record.save!

    record
  end
end

ActsAsTaggableOn::Tag.create_or_update(:id => 1, :name => "accounting")
ActsAsTaggableOn::Tag.create_or_update(:id => 2, :name => "agriculture")
ActsAsTaggableOn::Tag.create_or_update(:id => 3, :name => "architecture")
ActsAsTaggableOn::Tag.create_or_update(:id => 4, :name => "arts")
ActsAsTaggableOn::Tag.create_or_update(:id => 5, :name => "photography")
ActsAsTaggableOn::Tag.create_or_update(:id => 6, :name => "astrology")
ActsAsTaggableOn::Tag.create_or_update(:id => 8, :name => "aeronautics")
ActsAsTaggableOn::Tag.create_or_update(:id => 9, :name => "ayurvedic")
ActsAsTaggableOn::Tag.create_or_update(:id => 10, :name => "biography")
ActsAsTaggableOn::Tag.create_or_update(:id => 11, :name => "biology")
ActsAsTaggableOn::Tag.create_or_update(:id => 12, :name => "management")
ActsAsTaggableOn::Tag.create_or_update(:id => 13, :name => "CBSE")
ActsAsTaggableOn::Tag.create_or_update(:id => 14, :name => "ICSE")
ActsAsTaggableOn::Tag.create_or_update(:id => 15, :name => "business")
ActsAsTaggableOn::Tag.create_or_update(:id => 16, :name => "children")
ActsAsTaggableOn::Tag.create_or_update(:id => 17, :name => "computers")
ActsAsTaggableOn::Tag.create_or_update(:id => 18, :name => "IT")
ActsAsTaggableOn::Tag.create_or_update(:id => 19, :name => "cooking")
ActsAsTaggableOn::Tag.create_or_update(:id => 20, :name => "dentistry")

ActsAsTaggableOn::Tag.create_or_update(:id => 21, :name => "economics")
ActsAsTaggableOn::Tag.create_or_update(:id => 22, :name => "engineering")
ActsAsTaggableOn::Tag.create_or_update(:id => 23, :name => "english")
ActsAsTaggableOn::Tag.create_or_update(:id => 24, :name => "environment")
ActsAsTaggableOn::Tag.create_or_update(:id => 25, :name => "fashion")
ActsAsTaggableOn::Tag.create_or_update(:id => 26, :name => "fiction")
ActsAsTaggableOn::Tag.create_or_update(:id => 27, :name => "general-knowledge")
ActsAsTaggableOn::Tag.create_or_update(:id => 28, :name => "geography")
ActsAsTaggableOn::Tag.create_or_update(:id => 29, :name => "health")
ActsAsTaggableOn::Tag.create_or_update(:id => 30, :name => "history")
ActsAsTaggableOn::Tag.create_or_update(:id => 31, :name => "homoeopathy")
ActsAsTaggableOn::Tag.create_or_update(:id => 32, :name => "hospitality")
ActsAsTaggableOn::Tag.create_or_update(:id => 33, :name => "humor")
ActsAsTaggableOn::Tag.create_or_update(:id => 34, :name => "IIT-JEE")
ActsAsTaggableOn::Tag.create_or_update(:id => 35, :name => "investment")
ActsAsTaggableOn::Tag.create_or_update(:id => 36, :name => "journalism")
ActsAsTaggableOn::Tag.create_or_update(:id => 37, :name => "law")
ActsAsTaggableOn::Tag.create_or_update(:id => 38, :name => "languages")
ActsAsTaggableOn::Tag.create_or_update(:id => 39, :name => "literature")
ActsAsTaggableOn::Tag.create_or_update(:id => 40, :name => "magazines")
ActsAsTaggableOn::Tag.create_or_update(:id => 41, :name => "maps")
ActsAsTaggableOn::Tag.create_or_update(:id => 43, :name => "atlases")
ActsAsTaggableOn::Tag.create_or_update(:id => 44, :name => "marketing")
ActsAsTaggableOn::Tag.create_or_update(:id => 45, :name => "advertising")
ActsAsTaggableOn::Tag.create_or_update(:id => 46, :name => "mathematics")
ActsAsTaggableOn::Tag.create_or_update(:id => 47, :name => "medicine")
ActsAsTaggableOn::Tag.create_or_update(:id => 48, :name => "naturopathy")
ActsAsTaggableOn::Tag.create_or_update(:id => 49, :name => "non-fiction")

ActsAsTaggableOn::Tag.create_or_update(:id => 51, :name => "pharmacy")
ActsAsTaggableOn::Tag.create_or_update(:id => 52, :name => "physics")
ActsAsTaggableOn::Tag.create_or_update(:id => 53, :name => "physiotherapy")
ActsAsTaggableOn::Tag.create_or_update(:id => 54, :name => "poetry")
ActsAsTaggableOn::Tag.create_or_update(:id => 55, :name => "political-science")
ActsAsTaggableOn::Tag.create_or_update(:id => 56, :name => "psychology")
ActsAsTaggableOn::Tag.create_or_update(:id => 57, :name => "quiz")
ActsAsTaggableOn::Tag.create_or_update(:id => 58, :name => "puzzles")
ActsAsTaggableOn::Tag.create_or_update(:id => 59, :name => "religion")
ActsAsTaggableOn::Tag.create_or_update(:id => 60, :name => "science")
ActsAsTaggableOn::Tag.create_or_update(:id => 61, :name => "self-help")
ActsAsTaggableOn::Tag.create_or_update(:id => 62, :name => "social-science")
ActsAsTaggableOn::Tag.create_or_update(:id => 63, :name => "sports")
ActsAsTaggableOn::Tag.create_or_update(:id => 64, :name => "tax")
ActsAsTaggableOn::Tag.create_or_update(:id => 65, :name => "travel")
ActsAsTaggableOn::Tag.create_or_update(:id => 66, :name => "vastu")
ActsAsTaggableOn::Tag.create_or_update(:id => 67, :name => "yoga")
ActsAsTaggableOn::Tag.create_or_update(:id => 68, :name => "zoology")

#ActsAsTaggableOn::Tag.seed_many(:id, :name , [
#        { :id => 1, :name => "Accounting" }
#])

