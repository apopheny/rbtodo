require 'pg'

class BookshelfDatabase
  def initialize(logger)
    @db = PG.connect(dbname: "todos")
    @logger = logger
  end

  def disconnect
    @db.close
  end

  def query(statement, *params)
    @logger.info "#{statement}: #{params}"
    @db.exec_params(statement, params)
  end

  def lookup_shelf(id)
    statement = <<~SQL
              SELECT s.name, b.title
              FROM shelves_books AS sb
              JOIN shelves AS s ON s.id = sb.shelf_id
              JOIN books AS b ON b.id = sb.book_id
              WHERE s.id = $1
              GROUP BY s.name, b.title
              ORDER BY s.name, b.title
          SQL

    result = query(statement, id)
  end
end
