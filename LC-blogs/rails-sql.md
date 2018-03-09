# How to write the Query

Below are three different ways to write a SQL query. I personally prefer the latter because ruby provides syntax highlighting, though any one of them do the job effectively.


```rb
  sql = "SELECT * FROM books JOIN authors ON books.author_id = authors.id;"
```

```rb
  sql = """
    SELECT *
    FROM books
    JOIN authors
    ON books.author_id = authors.id;
  """
```

```rb
  sql = <<-SQL
      SELECT *
      FROM books
      JOIN authors
      ON books.author_id = authors.id;
    SQL
```

# Different Ways to Write SQL in Rails

The different ways to write SQL in Rails are divided into two main categories: Speed vs Convenience.

The first 3 described below use ActiveRecord::Base.connection and result in two classes that are ultimately stringified hashes. The benefit here is that ActiveRecord doesn't have to do the work of instantiating a new model object for each row in the results. This results in improved performance.

But where ActiveRecord::Base.connection offers speed, Model.find_by_sql offers convenience. Here, ActiveRecord instantiates new `ActiveModel` objects which have the typical ActiveRecord functionality such as associations and dot notation, shortening our work.

## Speed

1) Using ActiveRecord::Base.connection.execute()

  ```rb
    sql = <<-SQL
        SELECT *
        FROM books
        JOIN authors
        ON books.author_id = authors.id;
      SQL

    records_array = ActiveRecord::Base.connection.execute(sql)
  ```

  This produces a PG::Result object https://deveiate.org/code/pg/PG/Result.html. PG::Result includes a set of methods you can use on the dataset. In addition, the PG::Result object is an array of stringified hashes, the normal Ruby and Rails methods for arrays and hashes work on this dataset as well.

  Use `records_array.values` to see the values

2) Using ActiveRecord::Base.connection.exec_query()

  ```rb
    records_array = ActiveRecord::Base.connection.exec_query(sql)
  ```

  This produces a ActiveRecord::Result object http://api.rubyonrails.org/classes/ActiveRecord/Result.html. Ironically, ActiveRecord::Result does not offer the ActiveRecord conveniences of associations and dot notation. ActiveRecord::Result is more like PG::Result; and though it has fewer methods than PG::Result, they are arguably more useful for viewing the resulting data in rails console. People tend to favor `.exec_query` since you can use `result.columns` and `result.rows` to view the data better. Another perk is that you can convert the result to a more readable hash with `.to_hash`.

  Like PG::Result, ActiveRecord::Result is an array of stringified hashes, so the Ruby and Rails methods apply here as well.

3) Using ActiveRecord::Base.connection.select_all
  ```rb
    ActiveRecord::Base.connection.select_all(sql)
  ```

  This produces an ActiveRecord::Result instance like in (2) above, and so is utilized in the same way.

## Convenience

1) Using Model.find_by_sql

  ```rb
    Book.find_by_sql(sql)
  ```

  Unlike with ActiveRecord::Base, calling `.find_by_sql` on a one of your active record models provides an ActiveModel result object. As mentioned above, this gives you all the conveniences of ActiveRecord. The tradeoff is the additional time it takes ActiveRecord to instantiate the models.

  Another downside of `find_by_sql` that is not present in the `ActiveRecord::Base` methods is that if you are joining other tables and trying to view the results in rails console, the return value doesn't show any columns from joined tables. However, those columns are still part of the results and can be accessed, as demonstrated below.

  ```rb
  books = <<-SQL
      SELECT books.id, books.title, authors.name
      FROM books
      JOIN authors
      ON books.author_id = authors.id;
    SQL

  => ```[#<Book:0x007f32241v810 id: 1, title: "Lord of the Rings">,
        [#<Book:0x007f32241v930 id: 2, title: "The Dark Tower">,
        ...
     ```

  books.first.name
  => "J. R. R. Tolkien"
  ```

## Further Reading
  - http://patshaughnessy.net/2010/9/4/activerecord-with-large-result-sets---part-1-select_all-vs--find
