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
      csv_directory = create_csv_directory
      put_csv_on(csv_directory)
      populate_from_csv(csv_directory)
      # Expense.any? tells the controller if expenses have been created.
      Expense.any?
    rescue StandardError
      # Expense.any? tells the controller if some expense can be created.
      Expense.any?
    ensure
      FileUtils.rm_rf(csv_directory)
    end

    def create_csv_directory
      # Time.current.to_f * 1000 generates the current time in milliseconds.
      unique_name_folder = Time.current.to_f * 1000
      csv_directory = FileUtils.mkdir_p("tmp/csv/#{unique_name_folder}/")
      # The combination below generates the directory where the csv will be placed.
      csv_directory[0] + @csv.original_filename
    end

    def put_csv_on(csv_directory)
      File.open(csv_directory, 'wb') do |file|
        file.write(@csv.read)
      end
    end

    def populate_from_csv(csv_directory)
      # CSV.foreach reads one line at a time, this helps us to save RAM memory.
      CSV.foreach(csv_directory, headers: true, encoding: 'bom|utf-8', col_sep: ';') do |row|
        next if row['sgUF'] != 'SP'

        ActiveRecord::Base.transaction do
          create_records!(row)
        end
      end
    end

    def create_records!(csv_row)
      legislature = Legislature.find_or_create_by!(year: csv_row['nuLegislatura'])
      deputy = find_or_create_deputy!(csv_row, legislature)
      expense_type = ExpenseType.find_or_create_by!(description: csv_row['txtDescricao'])
      if expense_type.expense_type_specification.blank?
        ExpenseTypeSpecification.create!(
          description: csv_row['txtDescricaoEspecificacao'], expense_type_id: expense_type.id
        )
      end
      create_expense!(csv_row, deputy, expense_type)
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
