# frozen_string_literal: true

class DatabaseController < ApplicationController
  def populate_from_csv
    if Database::PopulateFromCsv.call(params[:data])
      redirect_to deputies_path
    else
      redirect_to root_path, alert: 'Não foi possível extrair os dados'
    end
  end
end
