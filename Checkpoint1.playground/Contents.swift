import UIKit

let celcius = 35.0
let fahrenheit = ((celcius * 9)/5) + 32

print("Celcius = \(celcius)C°.")
print("\(celcius)C° = \(fahrenheit)F°")

//option + shift + 8 = ° symbol

var beatles = ["John", "Paul", "George", "Ringo"]
print(beatles)

var scores = Array<Int>()
scores.append(100)
scores.append(80)
scores.append(85)
print(scores[1])

var albums = Array<String>() //alternate way = [String]()
albums.append("Foklore")
albums.append("Fearless")
albums.append("Red")

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)

characters.remove(at: 2)
print(characters.count)

characters.removeAll()
print(characters.count)

let bondMovies = ["Casino Royale", "Spectre", "No Time to Die"]
print(bondMovies.contains("Frozen"))

let cities = ["London", "Toyoko", "Rome", "Budapest"]
print(cities.sorted())

let presidents = ["Bush", "Obama", "Trump", "Biden"]
let reversedPresidents = presidents.reversed()
print(reversedPresidents)

//using swift dictionaries
let employee2 = [
    "name" : "Taylor Swift",
    "job": "singer",
    "location" : "Nashville"
]

print(employee2["name"])
print(employee2["job"])
print(employee2["location"])

//the above is valid but the below is what I should do in order to get my value back
print(employee2["name", default : "Unknown"])
print(employee2["job", default : "Unknown"])
print(employee2["location", default: "Unknown"])

let hasGraduated = [
    "Eric" : false,
    "Maeve": true,
    "Otis" : false
]

let olympics = [
    2012 : "London",
    2016 : "Rio de Jeniro",
    2020 : "Tokoyo"
]

print(olympics[2012, default: "Unknown"])

var heights = [String : Int]()
heights["Yao Ming"] = 229
heights["Shaquille O'Neal"] = 216
heights["LeBron James"] = 206

//swift sets
//sets have no order
//insert data instead of appending
let actors = Set([
    "Denzel Washington",
    "Tom Cruise",
    "Nicolas Cage",
    "Samuel L Jackson"
])

print(actors)

//Enums in swift
//fixed data
enum weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}

var day = weekday.monday
day = weekday.tuesday
day = weekday.friday

//can also use the below when using enums
day = .wednesday
day = .thursday

//type annotations
//specify the type that you want
let surname: String = "Lasso"
var score: Int = 0
var score2: Double = 0

let playerName: String = "Roy"
var luckyNumber: Int = 13
let pi: Double = 3.141
var isAuthenticated: Bool = true

//arrays and sets are below
var albums1: [String] = ["Red", "Fearless"]
var user: [String : String] = ["id" : "@twostraws"]
var books: Set<String> = Set (["The Bluest Eye", "Foundation", "Girl, Woman, Other"])

var soda: [String] = ["Coke", "Pepsi", "Irn-Bru"]
var teams: [String] = [String]()
var cities1: [String] = []
var clues = [String]()

//enum type annotations
enum UIStyle {
    case light, dark, system
}

var style = UIStyle.light
//can use the below as the variable name has the type
style = .dark



