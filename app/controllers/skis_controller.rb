class SkisController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :search, :show]
  def search
  end

  def index
    #before we create the actual form, we test the filtering thing "a la mano"
    @skis = Ski.all
    # where.(city: 'Lyon').sort_by { |ski| ski.size }

  end

  def show
    @ski = Ski.find(params[:id])
    # modifs pour afficher le formulaire de reservation dans le show
    @transaction = Transaction.new
  end

  def new
    @ski = Ski.new
  end


  def create
    @ski = Ski.new(ski_params)
    @ski.owner = current_user
    if @ski.save
      redirect_to ski_path(@ski)
    else
      render :new
    end
  end

   private

  def ski_params
    params.require(:ski).permit(:price, :size, :model, :city, :photo)
  end
end
