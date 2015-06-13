class PictureFinder
  FOOD_TAGS = ["food", "foodporn", "yum", "yummy", "foodie", "instafood", "dinner", "lunch", "breakfast", "tasty", "delish", "delicious", "eating", "foodpic", "foodpics", "eat", "foodgasm", "foods"]
  IRRELEVANT_TAGS = ["dog", "sexy", "fashion", "swag", "funny", "gay"]

  def initialize(coordinates={})
    @lat = coordinates[:lat]
    @long = coordinates[:long]
  end

  def pictures
    pictures = Instagram.media_search(lat, long, count: 100)
    food_related_pictures = food_related_pictures(pictures)
  end

  def food_related_pictures(pictures)
    pictures.select do |pic|
      food_related_picture?(pic)
    end
    #@sorted_results = pictures.sort_by {|hash| hash.likes["count"]}.uniq.reverse! #first(15)
  end

  def food_related_tags(picture)
    !(FOOD_TAGS & picture.tags).empty?
  end

  def filter_out_unrelated_tags(picture)
    (IRRELEVANT_TAGS & picture.tags).empty?
  end

  def food_related_picture?(picture)
    food_related_tags && filter_out_unrelated_tags
  end
end
