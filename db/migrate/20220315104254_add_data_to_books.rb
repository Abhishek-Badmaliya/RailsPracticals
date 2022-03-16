class AddDataToBooks < ActiveRecord::Migration[7.0]
  def up
    Book.create(name:"Ruby", price:100, author_id:4)
    Book.create(name:"Python", price:200, author_id:5)
    Book.create(name:"Java", price:300, author_id:6)
    Book.create(name:"PHP", price:400, author_id:7)
    Book.create(name:"Javascript", price:500, author_id:4)
  end
  def down
    Book.find_by(name:"Ruby").destroy
    Book.find_by(name:"Python").destroy
    Book.find_by(name:"Java").destroy
    Book.find_by(name:"PHP").destroy
    Book.find_by(name:"Javascript").destroy
  end
end
