class AddDataInAuthor < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up do
        Author.create(first_name:"Abhishek", last_name: "Badmaliya", dob: "9 Dec 2000", email: "abhi@gmail.com")
        Author.create(first_name:"Chirag", last_name: "Rathod", dob: "19 Aug 2001", email: "chirag@gmail.com")
        Author.create(first_name:"Khanjan", last_name: "Marthak", dob: "19 Aug 2000", email: "khanjan@gmail.com")
        Author.create(first_name:"Chitrak", last_name: "Bhatt", dob: "09 Aug 2000", email: "chitrak@gmail.com")
        Author.create(first_name:"Keyur", last_name: "Patel", dob: "1 Aug 2001", email: "keyur@gmail.com")
      end
      dir.up do
        Author.find_by(first_name:"Abhishek").destroy
        Author.find_by(first_name:"Chirag").destroy
        Author.find_by(first_name:"Khanjan").destroy
        Author.find_by(first_name:"Chitrak").destroy
        Author.find_by(first_name:"Keyur").destroy
      end
    end
  end  
end
