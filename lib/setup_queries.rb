# frozen-string-literal: true

# Queries to set up the database
module SetupQueries
  def enable_foreign_keys
    <<~SQL
      PRAGMA foreign_keys = ON;
    SQL
  end
end
