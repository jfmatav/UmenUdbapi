class PlatosController < ApplicationController
  # GET /platos
  # GET /platos.json
  def index
    @platos = Plato.all

    render json: @platos
  end

  # GET /platos/1
  # GET /platos/1.json
  def show
    @plato = Plato.find(params[:id])

    if !@plato.comentario.first.nil?
      render json: @plato.as_json(only: [:id, :nombre, :precio, :categoria, :tipo, :calificaciones, :total, :semana, :dia, :soda_id], include: [comentario:{only: [:id]}])
    else
      render json: @plato.as_json(only: [:id, :nombre, :precio, :categoria, :tipo, :calificaciones, :total, :semana, :dia, :soda_id])
    end
  end

  # POST /platos
  # POST /platos.json
  def create
    if params[:best]
      @plato = Plato.where("dia = ? and semana = ?", params[:dia], params[:semana])
      @plato.order(:promedio)
      
      @recomendacion = @plato

      render json: @recomendacion.as_json(only: [:id, :nombre, :precio, :categoria, :calificaciones, :total, :soda_id, :promedio])

    else
      if params[:get]
        @plato = Plato.where("soda_id = ? and dia = ? and semana = ?", params[:soda_id], params[:dia], params[:semana])

        render json: @plato.as_json(only: [:id, :nombre, :precio, :categoria, :tipo, :calificaciones, :total, :semana, :dia, :soda_id, :promedio])
      

      else
        @plato = Plato.new(plato_params)

        if @plato.save
          render json: @plato, status: :created, location: @plato
        else
          render json: @plato.errors, status: :unprocessable_entity
        end
      end
    end

  end

  # PATCH/PUT /platos/1
  # PATCH/PUT /platos/1.json
  def update
    @plato = Plato.find(params[:id])

    if @plato.update(plato_params)
      head :no_content
    else
      render json: @plato.errors, status: :unprocessable_entity
    end
  end

  # DELETE /platos/1
  # DELETE /platos/1.json
  def destroy
    @plato = Plato.find(params[:id])
    @plato.destroy

    head :no_content
  end

  def plato_params 
    params.permit(:nombre, :precio, :categoria, :tipo, :calificaciones, :total, :soda_id, :get, :semana, :dia, :promedio, :best)
  end
end
