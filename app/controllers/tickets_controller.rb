class TicketsController < ApplicationController
  before_action :set_project
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :require_signin!, except: [:show, :index]

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
    if @ticket.update(ticket_params)
      flash[:notice] = "Ticket has been updated."
      redirect_to [@project, @ticket]
    else
      flash[:alert] = "Ticket has not been updated."
      render 'edit'
    end
  end

  def destroy
    if @ticket.destroy
      flash[:notice] = "Ticket has been deleted."
      redirect_to @project
    else
      flash[:notice] = "Ticket has not been deleted."
      redirect_to @project
    end
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
