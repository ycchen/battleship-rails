# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    render layout: 'spa'
  end

  def android
    render layout: 'mobile'
  end

  def confirm
    Player.confirm_email(confirm_params[:token])
    redirect_to android_url
  end

  def reset
    redirect_to android_url(token: params[:token])
  end

  def reset_complete
    redirect_to android_url(reset_complete: 1)
  end

  private

  def confirm_params
    params.permit(:token)
  end
end
