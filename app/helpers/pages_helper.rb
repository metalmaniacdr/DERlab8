module PagesHelper
  def logo
    image_tag("mylogo.png", :alt => "The Auto Store")
  end
  def map
    image_tag("map.jpg", :alt => "location map")
  end
end
