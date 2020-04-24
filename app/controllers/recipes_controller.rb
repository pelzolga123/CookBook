class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end
    
  def create
    @recipe = @post.recipe.build(recipe_params)
    respond_to do |format|
        if @recipe.save
            format.html { redirect_to post_path, notice: 'Recipe created' }
            format.json { render :show, status: :created, location: @post }
        else
            format.html { redirect_to @post, alert: 'Recipe not created' }
            format.json { render json: @post.errors, status: :unprocessable_entity }
        end
    end  
  end  

  def recipe_params
    params.require(:comment).permit(:ingredient_name, :measurement, :post_id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_recipe
    @recipe = @post.recipes.find(params[:id])
  end

end
