# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create([{username: 'Hayle', email:'hcayaga@gmail.com', password: '12345'}, {username: 'Kyren', email:'kyrenbarrios@gmail.com', password: '12345'}, {username: 'Dax', email:'daxislame@gmail.com', password: '12345'}])

Category.create([{category_name: 'Clean Energy'}, {category_name: 'Automotive'}, {category_name: 'Entertainment'}, {category_name: 'Industrial'}, {category_name: 'Canabis'}])

Stock.create([{category_id: 1, user_id: 1, name: 'TESLA', content: 'American number 1 electric vehical right now'},{category_id: 3, user_id: 2, name: 'AMAZON', content: 'Online mall'},{category_id: 3, user_id: 3, name: 'CATAPILLER', content: 'manufacture of construction and mining equipment'},{category_id: 4, user_id: 3, name: 'HIVE', content: 'Marijuana Delevery buisness based in Northern Cal.'},
{category_id: 3, user_id: 2, name: 'AMC', content: 'One of the biggest movie theaters in America'}])

Comment.create([{user_id: 1, stock_id: 1, content:" 1st comment yayyy!"},{user_id: 2, stock_id: 1, content:" 2nd comment dope!"},{user_id: 3, stock_id: 1, content:" 3rd comment, I'm late!"},
{user_id: 2, stock_id: 4, content:"This stock is LIT!"},{user_id: 3, stock_id: 3, content:"I lost so much money on this stock:("},{user_id: 1, stock_id: 5, content:"Too the MOOON with this stock"}])
