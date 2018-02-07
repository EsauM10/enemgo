class Users::TicketsController < ApplicationController
  layout 'dashboard'
  respond_to :html, :js

  def index
    @tickets = Ticket.all.includes(:ticketable).page(params[:page]).per(10)
  end

  def new
    @ticket = @ticketable.tickets.new
  end

  def create
    @ticket = @ticketable.tickets.new ticket_params
    @ticket.user = current_user

    if @ticket.save
      flash[:success] = "Seu Ticket foi gerado com sucesso."
    else
      flash[:error] = "Não foi possível gerar um Ticket."
    end
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  private

  def ticket_params
    params.require(:ticket).permit(:motive, :message)
  end
end
