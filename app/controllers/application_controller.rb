class ApplicationController < ActionController::Base

  before_action :get_health_labels

  def get_health_labels
    @HEALTH_LABELS =
      [
        "balanced",
        "high-fiber",
        "high-protein",
        "low-carb",
        "low-fat",
        "low-sodium",
        "alcohol-free",
        "celery-free",
        "crustacean-free",
        "dairy-free",
        "egg-free",
        "fish-free",
        "gluten-free",
        "kidney-friendly",
        "kosher",
        "low-potassium",
        "lupine-free",
        "mustard-free",
        "No-oil-added",
        "low-sugar",
        "paleo",
        "peanut-free",
        "pescatarian",
        "pork-free",
        "red-meat-free",
        "sesame-free",
        "shellfish-free",
        "soy-free",
        "sugar-conscious",
        "tree-nut-free",
        "vegan",
        "vegetarian",
        "wheat-free"
      ]
  end

end
