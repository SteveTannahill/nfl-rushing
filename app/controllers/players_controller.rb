class PlayersController < ApplicationController
  before_action :set_player, only: %i[ show edit update destroy ]

  # GET /players or /players.json
  def index
      
    @players = Player.all
    @players_names = @players.map {|p| p.name}
    @players_names = ["All"] + @players_names.uniq.sort
    
    case params[:commit]
    when "Select"
        if params[:player_name] == "All"
            @players
        else
            @players = @players.where(name: params[:player_name])
        end
    when "Update"
        if sort_is_valid? params[:sort] and order_is_valid? params[:order]
          @players = @players.order(params[:sort] + " " + params[:order])
        else
          @players
        end
    else
        @players
    end
    
      respond_to do |format|
        format.html
        format.csv { send_data @players.to_csv(@players) }
      end
    
  end

  # GET /players/1 or /players/1.json
  def show
      @params = params
  end

  # GET /players/new
  def new
    @player = Player.new
  end

  # GET /players/1/edit
  def edit
  end

  # POST /players or /players.json
  def create
    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        format.html { redirect_to @player, notice: "Player was successfully created." }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1 or /players/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to @player, notice: "Player was successfully updated." }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1 or /players/1.json
  def destroy
    @player.destroy
    respond_to do |format|
      format.html { redirect_to players_url, notice: "Player was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def player_params
      params.require(:player).permit(:name, :team, :pos, :att_g, :att, :yds, :avg, :yds_g, :td, :lng, :lng_t, :rfd, :rfdp, :rush20, :rush40, :fum)
    end
    
    def sort_is_valid? sort
        Player.column_names.include? sort
    end
    
    def order_is_valid? order
        ["ASC" "DESC"].include? order
    end
end
