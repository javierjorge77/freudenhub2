class ToolsController < ApplicationController

  def new
    @tool= Tool.new
  end

  def create
    @tool = Tool.new(tool_params)
    @tool.user = current_user
    fill_blanks

      if @tool.save
        redirect_to tools_path, notice: "Successfully created "
      else
        render :new
      end
  end

  def index
    @tools = Tool.all
    @tools = Tool.order(params[:sort])
  end

  def show
    @tool = Tool.find(params[:id])
  end


  def edit
    @tool = Tool.find(params[:id])

  end

  def update
    @tool = Tool.find(params[:id])
    @tool.update(tool_params) #strong params
    fill_blanks
    @tool.user = current_user
    @tool.save
    redirect_to tool_path(@tool)
  end

  def destroy
    @tool = Tool.find(params[:id])
    @tool.destroy
    # No need for app/views/tools/destroy.html.erb
    redirect_to tools_path, status: :see_other
  end


private


  def tool_params
    params.require(:tool).permit(:alias, :sap, :layout, :plant, :bu, :technology, :volume, :customer, :max, :damaged, :blocked, :active, :spares, :segment, :available)
  end

  def fill_blanks
    if @tool.volume
      if @tool.volume < 50000
        @tool.segment = "LV"
      elsif @tool.volume < 500000
        @tool.segment = "MV"
      else
        @tool.segment = "HV"
      end
        @tool.active = @tool.max - @tool.damaged - @tool.blocked
        @tool.available = @tool.active.to_f / @tool.max.to_f
    end
  end


end
