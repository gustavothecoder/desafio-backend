# frozen_string_literal: true

class DeputiesController < ApplicationController
  def index
    @deputies = Deputy.all
  end

  def show
    @deputy = DeputyPresenter.new(Deputy.find(params[:id]))
    @expenses = @deputy.expenses.page(params[:page]).per(50)
  end
end
