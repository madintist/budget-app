require "sqlite3"

class Sql
  def initialize(db=nil)
    if db
      @db = db
    else
      @db = create_db
    end
  end

  attr_reader :db

  private

  def create_db()
    db = SQLite3::Database.new "finance.db"
    create_accounts_table db
    return db
  end

  def create_accounts_table(db)
    db.execute <<-SQL
      CREATE TABLE accounts(
        id INTEGER,
        name TEXT,
        PRIMARY KEY (id)
      );
    SQL
  end
end
