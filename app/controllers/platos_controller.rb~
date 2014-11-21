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
      render json: @plato.as_json(only: [:id, :nombre, :precio, :categoria, :tipo, :calificaciones, :total, :promedio, :semana, :dia, :soda_id], include: [comentario:{only: [:id]}])
    else
      render json: @plato.as_json(only: [:id, :nombre, :precio, :categoria, :tipo, :calificaciones, :total, :promedio, :semana, :dia, :soda_id])
    end
  end




  # POST /platos
  # POST /platos.json
  def create

    if params[:ant] #CONSULTA PARA MODIFICAR EL PROMEDIO
      
      @plato = Plato.find(params[:id])

      @plato.total = @plato.total - params[:ant].to_i + params[:nota].to_i
      @plato.promedio = @plato.total.to_f/@plato.calificaciones.to_f
      @plato.save

      head :no_content

    else

      if params[:reset] #CONSULTA NECESARIA PARA PONER TODOS LOS PLATOS CON CALIFICACIONES; TOTAL Y PROMEDIO EN 0

        Plato.update_all("calificaciones = 0, total = 0, promedio = 0")

        head :no_content

      else
        if params[:menu] #CONSULTA QUE PIDIÓ HECTOR PARA DESPLEGAR TODOS LOS PLATOS DE UNA SODA EN UN DÏA ESPECÍFICO

          @plato = Plato.where("dia = ? and semana = ? and soda_id = ?", params[:dia], params[:semana], params[:soda_id])
      
          render json: @plato.as_json(only: [:id, :nombre, :precio, :categoria, :tipo, :calificaciones, :total, :semana, :dia, :soda_id, :promedio])
      

        else
          if params[:nota] #CONSULTA QUE PIDIÓ DAGO PARA MANDAR UNA NOTA Y UN ID Y QUE SE ACTUALICE EN LA BASE DE DATOS

            @p = Plato.find(params[:id])
            if @p.calificaciones
              @p.calificaciones = @p.calificaciones + 1
            else
              @p.calificaciones = 1
            end
            if @p.total
              @p.total = @p.total + params[:nota].to_i
            else
              @p.total = params[:nota].to_i
            end
            @p.promedio = @p.total.to_f/@p.calificaciones.to_f
    
            @p.save

            render json: @plato.as_json#, status: :created, location: @plato

          else
            if params[:best] # CONSULTA QUE DEVUELVE EL MEJOR PLARO DE UN DïA ESPECIFICO
              @plato = Plato.where("dia = ? and semana = ?", params[:dia], params[:semana])
              #@plato.order(:promedio)
      
              @recomendacion = @plato.order(promedio: :desc).first

              render json: @recomendacion.as_json(only: [:id, :nombre, :precio, :categoria, :calificaciones, :total, :soda_id, :promedio])

            else 
              if params[:get] # CONSULTA QUE DA UN PLATO DE UN TIPO, DIA, SEMANA y SODA ESPECIFICOS
                @plato = Plato.where("soda_id = ? and dia = ? and semana = ? and categoria = ?", params[:soda_id], params[:dia], params[:semana], params[:categoria])

                render json: @plato.as_json(only: [:id, :nombre, :precio, :categoria, :tipo, :calificaciones, :total, :semana, :dia, :soda_id, :promedio])
      

              else # CREA UN NUEVO PLATO CON EL JSON
                @plato = Plato.new(plato_params)
                @plato.total = 0
                @plato.calificaciones = 0
                @plato.promedio = 0
  
                if @plato.save
                  render json: @plato, status: :created, location: @plato
                else
                  render json: @plato.errors, status: :unprocessable_entity
                end
              end
            end
          end
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
    params.permit(:nombre, :precio, :categoria, :tipo, :calificaciones, :total, :soda_id, :get, :semana, :dia, :promedio, :best, :menu, :nota, :ant, :reset)
  end
end
