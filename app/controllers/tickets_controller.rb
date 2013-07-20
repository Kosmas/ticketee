class TicketsController < ApplicationController
  before_action :set_project
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @ticket = @project.tickets.build
  end

  def edit
  end

  def create
    @ticket = @project.tickets.build(ticket_params)
    if @ticket.save
      flash[:notice] = "Ticket has been created."
      redirect_to [@project, @ticket]
    else
      flash[:alert] = "Ticket has not been created."
      render 'new'
    end
  end

  def update
  end

  def destroy
  end


  private

    def ticket_params
      params.require(:ticket).permit(:title, :description)
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_ticket
      @ticket = @project.tickets.find(params[:id])
    end
end