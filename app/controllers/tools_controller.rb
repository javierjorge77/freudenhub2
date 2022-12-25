class ToolsController < ApplicationController
  before_action :set_tool, only: [:show, :edit, :update, :destroy]

  def new
    @tool= Tool.new
    @tool.user = current_user
  end

  def create
    @tool = Tool.new(tool_params)
    @tool.user = current_user
    fill_blanks
    @tool.save
    redirect_to tools_path

  end

  def index
    @tools = Tool.all
    @tools = Tool.order(params[:sort])
  end



private

def set_tool
  @tool = Tool.find(params[:id])
end

def tool_params
  params.require(:tool).permit(:alias, :sap, :layout, :plant, :bu, :technology, :volume, :customer, :max, :damaged, :blocked, :active, :spares, :segment, :available)
end

def fill_blanks
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
