require 'database_connection'

describe DatabaseConnection do

  describe '#setup' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')

      DatabaseConnection.setup('chitter_test')
    end

    it 'this connection is persisent' do
      connection = DatabaseConnection.setup('chitter_test')
      expect(DatabaseConnection.connection).to eq connection
    end
  end
end
