House.destroy_all
Character.destroy_all

houses = House.create([{ name: 'Arryn' }, { name: 'Baratheon' }, { name: 'Bolton' }, { name: 'Frey' }, { name: 'Greyjoy' }, { name: 'Lannister' }, { name: 'Martell' }, { name: 'Stark' }, { name: 'Targaryen' }, { name: 'Tully' }, { name: 'Tyrell' }])
names = ["Tyrion", "Jaime", "Cersei", "Daenerys", "Jon", "Petyr", "Jorah", "Sansa", "Arya", "Theon", "Bran", "Sandor", "Joffrey", "Catelyn"]

names.length.times do |i|
	Character.create(name: names[i], img_url: 'http://www.pngall.com/wp-content/uploads/2016/05/Game-of-Thrones-Logo.png', house: houses[rand(houses.length) - 1])
end