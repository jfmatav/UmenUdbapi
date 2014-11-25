class AcompanamientosController < ApplicationController
  # GET /acompanamientos
  # GET /acompanamientos.json
  def index
    @acompanamientos = Acompanamiento.all

    render json: @acompanamientos
  end

  # GET /acompanamientos/1
  # GET /acompanamientos/1.json
  def show
    @acompanamiento = Acompanamiento.find(params[:id])

    render json: @acompanamiento
  end

  # POST /acompanamientos
  # POST /acompanamientos.json
  def create

    if params[:busq]

      @acomp = Acompanamiento.where("dia = ? and semana = ? and soda_id = ?", params[:dia], params[:semana], params[:soda_id])
      
      render json: @acomp

    else

      @acompanamiento = Acompanamiento.new(acompanamiento_params)

      if @acompanamiento.save
        render json: @acompanamiento, status: :created, location: @acompanamiento
      else
        render json: @acompanamiento.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /acompanamientos/1
  # PATCH/PUT /acompanamientos/1.json
  def update
    @acompanamiento = Acompanamiento.find(params[:id])

    if @acompanamiento.update(acompanamiento_params)
      head :no_content
    else
      render json: @acompanamiento.errors, status: :unprocessable_entity
    end
  end

  # DELETE /acompanamientos/1
  # DELETE /acompanamientos/1.json
  def destroy
    @acompanamiento = Acompanamiento.find(params[:id])
    @acompanamiento.destroy

    head :no_content
  end

  def acompanamiento_params
    params.permit(:acompanamiento, :guarnicion, :ensalada1, :ensalada2, :ensalada3, :ensalada4, :ensalada5, :ensalada6, :fresco1, :fresco2, :frescosinazucar, :fruta1, :fruta2, :soda_id, :semana, :dia)
  end
end
