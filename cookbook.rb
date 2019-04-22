require 'csv'
require_relative 'recipe'
require_relative 'view'
require_relative 'service'

class Cookbook
  def initialize(csv_file_path)
    @recipes = []
    @csv_file_path = csv_file_path
    parsing
  end

  def parsing
    CSV.foreach(@csv_file_path) do |row|
      @recipes << Recipe.new(row[0], row[1], row[2])
    end
  end

  def storing
    CSV.open(@csv_file_path, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.time]
      end
    end
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    storing
  end

  def find_index(index)
    @recipes[index]
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    storing
  end
end

