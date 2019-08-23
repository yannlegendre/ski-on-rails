class SkisController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :search, :show]
  def search
    @cities = Ski.all.map { |ski| ski.city }.uniq
  end

  # GET /skis
  def index
    # before we create the actual form, we test the filtering thing "a la mano"
    @skis = Ski.all
    p params
    @skis = @skis.where(size: params[:size]) if params[:size].present?
    @skis = @skis.near(params[:city], 15) if params[:city].present?
    @skis = @skis.where(model: params[:model]) if params[:model].present?

    @markers = @skis.map do |ski|
      {
        lat: ski.latitude,
        lng: ski.longitude
      }
    end

    # (Date.parse(params[:rental_date]) => correspond a la date
    #   dans la method scope.available_at dans le model ski
    # pour que ca la marche il faut que le params[:rental_date] soit un string
    # et par le parse on le met en objet
    if params[:rental_date].present?
      @skis = @skis.available_at(Date.parse(params[:rental_date]))
    end
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
