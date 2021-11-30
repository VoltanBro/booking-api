user = User.create(email: 'testdev@test.com', password: '123123123')
user.real_estates.create(price: 100.0, country: 'Ukraine', city: 'Lviv',
                         street: 'Pilenko', building: '10-a', zip: '1234567890',
                         check_in: Time.zone.now, check_out: Time.zone.now + 7.days)
