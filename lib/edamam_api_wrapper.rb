class EdamamApiWrapper

# index:
#   syntax to get recipe name:
#   response["hits"][0]["recipe"]["label"]
#  returns string

#   syntax to get recipe image:
#   response["hits"][0]["recipe"]["image"]
#  returns string

# show:
#  syntax to get recipe URL:
#  response["hits"][0]["recipe"]["url"]
#  returns string

#  syntax to get recipe ingredients:
#  response["hits"][0]["recipe"]["ingredientLines"]
#  returns array

#  syntax to get dietary labels:
#  response["hits"][0]["recipe"]["dietLabels"]
#  returns array - some are empty - how to handle nil?

end
