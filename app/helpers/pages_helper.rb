module PagesHelper
  def paginator(page, recipes)
    output = []
    if page > 1
      output << (link_to "prev page", search_path(:page=> (session[:page] - 1)))
    else
      output << "<a class=\"nohover\">prev page</a>"
    end
    output << "<span> #{session[:page]} </span>"
    if recipes.length == 10
      output << (link_to "next page", search_path(:page=> (session[:page] + 1)))
    else
      output << "<a class=\"nohover\">next page</a>"
    end

    return output.join.html_safe
  end

  # def paginator(page, recipes)
  #   if page == 1
  #     if recipes.length % 10 == 0
  #       pages = (recipes.length / 10) - 1
  #     else
  #       pages = (recipes.length / 10)
  #     end
  #
  #     if pages >= 1
  #       output = ["previous page "]
  #     else
  #       output = []
  #     end
  #     output << "#{session[:page]} "
  #     pages.times do |i|
  #       output << (link_to "#{session[:page] + i + 1} ", search_path(:page=> (session[:page] + i + 1)))
  #     end
  #     if pages >= 1
  #       output << (link_to " next page", search_path(:page=> (session[:page] + 1)))
  #     end
  #
  #     return output.join.html_safe
  #   elsif page == 2
  #     if recipes.length % 10 == 0
  #       pages = (recipes.length / 10) - 2
  #     else
  #       pages = (recipes.length / 10) - 1
  #     end
  #
  #     output = [
  #       (link_to "previous page ", search_path(:page=> (session[:page] - 1))),
  #       (link_to "1 ", search_path(:page=> 1)),
  #       "2 "
  #     ]
  #     pages.times do |i|
  #       output << (link_to "#{session[:page] + i + 1} ", search_path(:page=> (session[:page] + i + 1)))
  #     end
  #
  #     if pages >= 1
  #       output << (link_to " next page", search_path(:page=> (session[:page] + 1)))
  #     end
  #     return output.join.html_safe
  #   else
  #     if recipes.length % 10 == 0
  #       pages = (recipes.length / 10) - 3
  #     else
  #       pages = (recipes.length / 10) - 2
  #     end
  #
  #     output = [
  #       (link_to "previous page ", search_path(:page=> (session[:page] - 1))),
  #       (link_to "#{session[:page] - 2} ", search_path(:page=> (session[:page] - 2))),
  #       (link_to "#{session[:page] - 1} ", search_path(:page=> (session[:page] - 1))),
  #       "#{session[:page]} "
  #     ]
  #     pages.times do |i|
  #       output << (link_to "#{session[:page] + i + 1} ", search_path(:page=> (session[:page] + i + 1)))
  #     end
  #
  #     if pages >= 1
  #       output << (link_to " next page", search_path(:page=> (session[:page] + 1)))
  #     end
  #
  #     return output.join.html_safe
  #     # return [(link_to "previous page ", search_path(:page=> (session[:page] - 1))),
  #     # (link_to "#{session[:page] - 2} ", search_path(:page=> (session[:page] - 2))),
  #     # (link_to "#{session[:page] - 1} ", search_path(:page=> (session[:page] - 1))),
  #     # "#{session[:page]} ",
  #     # (link_to "#{session[:page] + 1} ", search_path(:page=> (session[:page] + 1))),
  #     # (link_to "#{session[:page] + 2} ", search_path(:page=> (session[:page] + 2))),
  #     # (link_to "next page", search_path(:page =>(session[:page] + 1)))].join.html_safe
  #   end
  # end

  def reformat_array(strung_arr)
    if strung_arr.class == Array
      return strung_arr
    else
      strung_arr = strung_arr[1..-2]
      strung_arr = strung_arr.split("\"")
      return strung_arr.reject!.with_index{|item, i| i.even?}
    end
  end
end
