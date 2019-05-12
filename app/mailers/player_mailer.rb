# frozen_string_literal: true

class PlayerMailer < ApplicationMailer
  def confirmation_email
    @player = params[:player]
    mail(to: @player.email, subject: 'Battleship Signup')
  end

  def reset_email
    @player = params[:player]
    mail(to: @player.email, subject: 'Battleship Password Reset')
  end

  def reset_complete_email
    @player = params[:player]
    mail(to: @player.email, subject: 'Battleship Password Reset Complete')
  end
end
