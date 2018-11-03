module RecipeSearchesHelper
  def checkbox_field(label, params)
    if params["health"] && params["health"].include?(label.downcase)
      return ('<input type="checkbox" name="health[]" value="' + "#{label.downcase}" + '" checked >').html_safe
    else
      return ('<input type="checkbox" name="health[]" value="' + "#{label.downcase}" + '">').html_safe
    end
  end
end
