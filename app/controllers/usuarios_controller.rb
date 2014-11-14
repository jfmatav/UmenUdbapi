class UsuariosController < ApplicationController
  # GET /usuarios
  # GET /usuarios.json
  def index
    @usuarios = Usuario.all

    render json: @usuarios.as_json(only: [:id, :nombre, :direccion, :password])
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
    @usuario = Usuario.find(params[:id])

    if !@usuario.comentario.first.nil?
        render json: @usuario.as_json(only: [:id, :nombre, :direccion, :password], include: [comentario:{only: [:id]}])
    else
        render json: @usuario.as_json(only: [:id, :nombre, :direccion, :password])
    end
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
      
    if params[:opt]

      @usuario = Usuario.where("direccion = ?", params[:direccion])

      render json: @usuario.as_json(only: [:id, :direccion, :password])

    else      
      @usuario = Usuario.new(usuario_params)

      if @usuario.save
        render json: @usuario, status: :created, location: @usuario
      else
        render json: @usuario.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    @usuario = Usuario.find(params[:id])

    if @usuario.update(usuario_params)
      head :no_content
    else
      render json: @usuario.errors, status: :unprocessable_entity
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario = Usuario.find(params[:id])
    @usuario.destroy

    head :no_content
  end

  def usuario_params
    params.permit(:nombre, :direccion, :password, :opt)
  end
end
