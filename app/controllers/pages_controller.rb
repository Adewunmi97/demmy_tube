class PagesController < ApplicationController
  def home
    @posts = Post.all
  end

  def pricing
  end

  def privacy
  end

  def profile
  end

  def payment_success
    plan = params[:plan]
    order_id = params[:order_id]
  
    Payment.create!(
      user: current_user,
      plan: plan,
      paypal_order_id: order_id,
      status: "completed"
    )
  
    current_user.update!(pro: true)
  
    render json: { message: "subscription successful" }, status: :ok
  end
  
end
