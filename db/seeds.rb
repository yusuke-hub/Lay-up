# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  [
    {
      profile_image: ' business-man.jpg',
      account_id: '11111111',
      email: 'test1@test.com',
      password: '111111',
      name: '田中太郎',
      phone_number: '111-1111-1111'
    },
    {
      profile_image: 'woman.png',
      account_id: '22222222',
      email: 'test2@test.com',
      password: '222222',
      name: '田中徹子',
      phone_number: '222-2222-2222'
    },
    {
      profile_image: ' business-man.jpg',
      account_id: '333333333',
      email: 'test3@test.com',
      password: '333333',
      name: '佐藤太郎',
      phone_number: '333-3333-3333'
    },
    {
      profile_image: 'woman.png',
      account_id: '44444444',
      email: 'test4@test.com',
      password: '444444',
      name: '佐藤徹子',
      phone_number: '444-4444-4444'
    },
    {
      profile_image: ' business-man.jpg',
      account_id: '55555555',
      email: 'test5@test.com',
      password: '555555',
      name: '小林太郎',
      phone_number: '555-5555-5555'
    },
    {
      profile_image: 'woman.png',
      account_id: '66666666',
      email: 'test6@test.com',
      password: '666666',
      name: '小林徹子',
      phone_number: '666-6666-6666'
    },
    {
      profile_image: ' business-man.jpg',
      account_id: '77777777',
      email: 'test7@test.com',
      password: '777777',
      name: '伊藤太郎',
      phone_number: '777-7777-7777'
    },
    {
      profile_image: 'woman.png',
      account_id: '88888888',
      email: 'test8@test.com',
      password: '888888',
      name: '伊藤徹子',
      phone_number: '888-8888-8888'
    }
  ]
)

Group.create!(
	[
		{
	  name: '田中家',
	  caption: '田中家のグループ',
		},
		{
	  name: '佐藤家',
	  caption: '佐藤家のグループ',
		},
		{
	  name: '小林家',
	  caption: '小林家のグループ',
		},
		{
	  name: '伊藤家',
	  caption: '伊藤家のグループ',
		}
	]
)
Belonging.create!(
  [
    {
      user_id: '1',
      group_id: '1',
      activation: false,
  },
  {
      user_id: '2',
      group_id: '1',
      activation: false,
  },
  {
      user_id: '3',
      group_id: '2',
      activation: false,
  },
  {
      user_id: '4',
      group_id: '2',
      activation: false,
  },
  {
      user_id: '5',
      group_id: '3',
      activation: false,
  },
  {
      user_id: '6',
      group_id: '3',
      activation: false,
  },
  {
      user_id: '7',
      group_id: '4',
      activation: false,
  },
  {
      user_id: '8',
      group_id: '4',
      activation: false,
  },
 ]
)