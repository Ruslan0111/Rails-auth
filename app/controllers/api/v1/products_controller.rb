class Api::V1::ProductsController < ApplicationController
  before_action :authorize_request

  def index
    products = Product.all
    render json: products, status: :ok
  end

  def create
    product = Product.new(product_params)

    if product.save
      render json: { message: "Product created", data: product }, status: :ok
    else
      render json: { message: "Product not created", data: product.errors }, status: :unprocessable_entity
    end
  end

  def show
    product = Product.find(params[:id])

    render json: { message: "Product show", data: product }, status: :ok
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    render json: { message: "Product deleted", data: product }, status: :ok
  end

  private

    def product_params
      params.permit([
        :title,
        :description
      ])
    end
end
