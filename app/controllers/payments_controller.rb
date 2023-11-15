class PaymentsController < ApplicationController
  before_action :set_product, only: [:create]

  def success
  end
 
  def create
    begin
      customer = Stripe::Customer.create({
        email: current_user.email, 
        name: 'usama',
      })      
     product = Stripe::Product.create({
        name: params[:product_title], 
        type: 'service',
      })
      price = Stripe::Price.create({
        product: product.id,
        unit_amount: params[:product_quantity],  
        currency: 'usd',
      })
      session[:stripe_customer_id] = customer.id
      session[:stripe_product_id] = product.id

      redirect_to success_payments_path

    rescue Stripe::StripeError => e
      flash[:error] = "Stripe error: #{e.message}"
      redirect_to root_path
    end
  end

  private

  def set_product
    product_id = session[:product_id]
  end
end
