class SkisController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :search, :show]
  def search
  end

  # GET /skis
  def index
      @skis = Ski.all
    # before we create the actual form, we test the filtering thing "a la mano"
    if params[:query].present?
      @skis = @skis.global_search(params[:query])
    else
      @skis = Ski.all
    end

    # if params[:rental_date].present?
    #   @skis = @skis.joins(:transactions).where(transactions: { rental_date: 2.days.ago..5.days.from_now}) )
    # end

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
