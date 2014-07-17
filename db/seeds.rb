
location1 = Location.create name: "Home", city: "Barcelona", country: "Spain", zip_code: 8001, street: "Carrer Tallers 48"
location2 = Location.create name: "Party", city: "Barcelona", country: "Spain", zip_code: 00000, street: "Tell Me Where"
location3 = Location.create name: "Birthplace", city: "Klaipeda", country: "Lithuania", zip_code: 0, street: "Have to ask my mom"

location1.visits.create user_name: "Martin", from_date: Time.now + 1.day, to_date: Time.now + 1.day + 1.hour
location2.visits.create user_name: "Martin", from_date: Time.now + 1.day, to_date: Time.now + 1.day + 1.hour
location3.visits.create user_name: "Martin", from_date: Time.now + 1.day, to_date: Time.now + 1.day + 1.hour

