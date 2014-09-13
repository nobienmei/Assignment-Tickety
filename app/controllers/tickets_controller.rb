class TicketsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_ticket, only: [:edit, :update, :destroy]

	def index
	    @tickets = Ticket.limit(10)
	end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new ticket_params
    @ticket.user = current_user
    if @ticket.save
      redirect_to @ticket, notice: "Ticket Saved!"
    else
      render :new
    end
  end

  def dummy

  end

  def show
    @ticket = Ticket.find params[:id]
  end

  def edit
  end

  def update
    if @ticket.update_attributes ticket_params
      redirect_to @ticket, notice: "Ticket Updated!"
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_path, notice: "Ticket deleted"
  end

  private

  def ticket_params
    params.require(:ticket).permit(:title, :description, :status)
  end

 def find_ticket
    @ticket = Ticket.find params[:id]
  end

end
