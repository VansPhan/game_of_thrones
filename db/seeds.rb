House.destroy_all
Character.destroy_all
Trait.destroy_all

houses = House.create([{ name: 'Arryn' }, { name: 'Baratheon' }, { name: 'Bolton' }, { name: 'Frey' }, { name: 'Greyjoy' }, { name: 'Lannister' }, { name: 'Martell' }, { name: 'Stark' }, { name: 'Targaryen' }, { name: 'Tully' }, { name: 'Tyrell' }])
names = ["Tyrion", "Jaime", "Cersei", "Daenerys", "Jon", "Petyr", "Jorah", "Sansa", "Arya", "Theon", "Bran", "Sandor", "Joffrey", "Catelyn"]
characters = []
names.length.times do |i|
	characters << Character.create(name: names[i], img_url: 'http://www.pngall.com/wp-content/uploads/2016/05/Game-of-Thrones-Logo.png', house: houses[rand(houses.length) - 1])
end

traits = Trait.create([{ description: 'Mean', character: characters[rand(characters.length) - 1] }, { description: 'Angry', character: characters[rand(characters.length) - 1] }, { description: 'Warm', character: characters[rand(characters.length) - 1] }, { description: 'Fierce', character: characters[rand(characters.length) - 1] }, { description: 'Joyful', character: characters[rand(characters.length) - 1] }, { description: 'Sexy', character: characters[rand(characters.length) - 1] }, { description: 'Patient', character: characters[rand(characters.length) - 1] }, { description: 'Hardy', character: characters[rand(characters.length) - 1] }, { description: 'Apathetic', character: characters[rand(characters.length) - 1] }, { description: 'Honest', character: characters[rand(characters.length) - 1] }, { description: 'Loving', character: characters[rand(characters.length) - 1] }])