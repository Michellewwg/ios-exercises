import UIKit

/*

Strings

*/

func favoriteCheeseStringWithCheese(cheese: String) -> String {
    
    return "My favorite chesse is \(cheese)"
}

let fullSentence = favoriteCheeseStringWithCheese("cheddar")
// Make fullSentence say "My favorite cheese is cheddar."

/*

Arrays & Dictionaries

*/

let numberArray = [1, 2, 3, 4]
// Add 5 to this array
var newArray = numberArray
newArray.append(5)

let numberDictionary = [1 : "one", 2 : "two", 3 : "three", 4 : "four"]
// Add 5 : "five" to this dictionary
var newNumberDictionary = numberDictionary
newNumberDictionary[5] = "five"
print(newNumberDictionary)
/*

Loops

*/

// Use a closed range loop to print 1 - 10, inclusively
// WORK HERE
for  i in 1...10  {
 
    println ("\(i)")
}

// Use a half-closed range loop to print 1 - 10, inclusively
// WORK HERE
for i in 1..<11 {
      println ("\(i)")
}

let worf = [
    "name": "Worf",
    "rank": "lieutenant",
    "information": "son of Mogh, slayer of Gowron",
    "favorite drink": "prune juice",
    "quote" : "Today is a good day to die."]

let picard = [
    "name": "Jean-Luc Picard",
    "rank": "captain",
    "information": "Captain of the USS Enterprise",
    "favorite drink": "tea, Earl Grey, hot"]

let characters = [worf, picard]

func favoriteDrinksArrayForCharacters(characters:Array<Dictionary<String, String>>) -> Array<String> {
    // return an array of favorite drinks, like ["prune juice", "tea, Earl Grey, hot"]
    // WORK HERE
    var drinkResults = [String]()
    for  a in characters
    {
        for (key,value ) in a
        {
            if (key == "favorite drink")
            {
                println("the drink is \(value)")
                drinkResults += [value]
            }
        }
    }
    return drinkResults
}

let favoriteDrinks = favoriteDrinksArrayForCharacters(characters)

favoriteDrinks

/*

Functions

*/

// Make a function that inputs an array of strings and outputs the strings separated by a semicolon

let strings = ["milk", "eggs", "bread", "challah"]


// WORK HERE - make your function and pass `strings` in

func makeAStringFromAnArray(bread: [String]) -> String {
    var rtnValue = ";".join(bread)
    
    
    
    return rtnValue
}



let expectedOutput = "milk;eggs;bread;challah"

/*

Closures

*/

let cerealArray = ["Golden Grahams", "Cheerios", "Trix", "Cap'n Crunch OOPS! All Berries", "Cookie Crisp"]

// Use a closure to sort this array alphabetically
// WORK HERE
var sorted =  cerealArray.sorted { $0.localizedCaseInsensitiveCompare($1) == NSComparisonResult.OrderedAscending }
println(sorted)



