# frozen_string_literal: true

require 'csv'

module Database
  class PopulateFromCsv
    def initialize(csv)
      @csv = csv
    end

    def self.call(csv)
      new(csv).call
    end

    def call
      populate
    end

    private

    def populate
      directory = create_csv_directory
      populate_from_csv(directory)
      true
    rescue StandardError
      false
    ensure
      FileUtils.rm_rf(directory)
    end

    def create_csv_directory
      csv_folder = FileUtils.mkdir_p("tmp/csv/#{Time.current.to_f * 1000}/")
      csv_directory = csv_folder[0]
      File.open(csv_directory + @csv.original_filename, 'wb') do |file|
        file.write(@csv.read)
      end
      csv_directory
    end

    def populate_from_csv(csv_directory)
      ActiveRecord::Base.transaction do
        CSV.foreach(csv_directory + @csv.original_filename, headers: true, col_sep: ';') do |row|
          next if row['sgUF'] != 'SP'

          legislature = Legislature.find_or_create_by!(year: row['nuLegislatura'])
          deputy = find_or_create_deputy!(row, legislature)
          expense_type = ExpenseType.find_or_create_by!(description: row['txtDescricao'])
          ExpenseTypeSpecification.find_or_create_by!(
            description: row['txtDescricaoEspecificacao'], expense_type_id: expense_type.id
          )
          create_expense!(row, deputy, expense_type)
        end
      end
    end

    def find_or_create_deputy!(csv_row, legislature)
      Deputy.find_or_create_by!(
        name: csv_row['txNomeParlamentar'],
        deputy_id: csv_row['ideCadastro'],
        card_number: csv_row['nuCarteiraParlamentar'],
        federal_id: csv_row['cpf'],
        state: csv_row['sgUF'],
        political_party: csv_row['sgPartido'],
        legislature_id: legislature.id
      )
    end

    def create_expense!(csv_row, deputy, expense_type)
      Expense.create!(
        document_number: csv_row['txtNumero'],
        provider: csv_row['txtFornecedor'],
        federal_id: csv_row['txtCNPJCPF'],
        kind: csv_row['indTipoDocumento'],
        issue_date: csv_row['datEmissao'],
        document_value: csv_row['vlrDocumento'],
        gloss_value: csv_row['vlrGlosa'],
        net_value: csv_row['vlrLiquido'],
        month: csv_row['numMes'],
        year: csv_row['numAno'],
        portion: csv_row['numParcela'],
        passenger: csv_row['txtPassageiro'],
        part: csv_row['txtPassageiro'],
        batch: csv_row['numLote'],
        refund: csv_row['numRessarcimento'],
        restitution: csv_row['vlrRestituicao'],
        document_url: csv_row['urlDocumento'],
        expense_type_id: expense_type.id,
        deputy_id: deputy.id
      )
    end
  end
end
