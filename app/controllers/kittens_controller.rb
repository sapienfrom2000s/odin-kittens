class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
    format_data_as_requested(@kittens)
  end

  def create
    @kitten = Kitten.new(kitten_params) 
    if @kitten.save
      flash[:notice] = "Your kitten was added to the database"
      redirect_to kitten_path(@kitten)
    else
      flash[:notice] = "Something went wrong"
      render :new, status: :unprocessable_entity
    end                             
  end

  def update
    @kitten = Kitten.find(params[:id])

    if @kitten.update(kitten_params)
      redirect_to @kitten
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @kitten = Kitten.new
  end

  def show
    @kitten = Kitten.find(params[:id])
    format_data_as_requested(@kitten)
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :softness, :cuteness)
  end

  def format_data_as_requested(object)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => object }
      format.json { render :json => object }
    end
  end

end
