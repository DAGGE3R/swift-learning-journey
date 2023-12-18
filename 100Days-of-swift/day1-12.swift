
let a : Int = 21 ; // Define a constant 'a' with a value of 21
//! a = 10 Error: Cannot assign to value: 'a' is a 'let' constant


// create an array of 5 elements
var arr : [Int] = [1,2,3,4,5]
print(arr.map({$0 * 2})) // Print each element multiplied by 2


func sum(_ num1: Int, _ num2: Int) -> String {
    return( "your sum is \(num1 + num2) " ) // this is string interpolation
}
print(sum(1,2)) // Print the sum of 1 and 2

//tuple
var name = (first: "Taylor", last: "Swift")

print(name.first)


func premier(_ num1 : Int) -> Bool {
    if (num1 % 2 == 0) {
        return false
    }else {return true}
}

func range(_ num1 : Int) -> Void {
    for i : Int in 0...num1 {
      premier(i) ? print(i) : print("")
    }
}
range(100)


//Dictionaries

let heights = [
    "Taylor Swift": 1.78,
    "Ed Sheeran": 1.73
]

let favoriteIceCream = [
    "Paul": "Chocolate",
    "Sophie": "Vanilla"
]


//Enums

enum Result {
    case success
    case failure
}

let result = Result.failure

//Enums with values

enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}

let talking : Activity = Activity.talking(topic: "football")


//loop 

for _ in 1...5 {
    print("play")
} // no extra needless values created 

outerLoop: for i in 1...10 { //outerLoop is a label 🤯
    for j in 1...10 {
        let product = i * j
        print ("\(i) * \(j) is \(product)")

        if product == 50 {
            print("It's a bullseye!")
            break outerLoop
        }
    }
} // add our condition inside the inner loop, then use break outerLoop to exit both loops at the same time


func name(awa num : Int) -> Int {
    return (num * num)
}

print(name( awa : 8))


func square(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}




//Throwing functions

enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    } else {
        return true
    }
}

//try and catch
do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}


// inout parameters

func doubleInPlace(number: inout Int) {
    number *= 2
}
var myNum = 10
// *  & :  an explicit recognition that you’re aware it is being used as inout.
doubleInPlace(number: &myNum)


//closures

let driving = {
    print("I'm driving in my car")
}
driving() // call the closure

//accepting parameters in a closure 

let driving2 = { (place: String) in
    print("I'm going to \(place) in my car")
}
driving2("London")

//returning values from a closure

let drivingWithReturn = { (place: String) -> String in
    return "I'm going to \(place) in my car"
}
let message = drivingWithReturn("London")
print(message)

//closures as parameters

let driving3 = {
    print("I'm driving in my car")
}

func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}
travel(action: driving3)

//trailing closure syntax

travel() { // we can get rid of the parentheses if there aren't any other parameters
    print("I'm driving in my car")
}

// Using closures as parameters when they accept parameters

func travel2(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived!")
}

travel2 { (place: String) in
    print("I'm going to \(place) in my car")
}

// Using closures as parameters when they return values

func travel3(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}

travel3 { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

// Shorthand parameter names(we have one parametrer and we can use $0 instead of place in the closure)
travel3 { 
    return "I'm going to \($0) in my car"
}

//closure with multiple parameters

func travel4(action: (String, Int) -> String) {
    print("I'm getting ready to go.")
    let description = action("London", 60)
    print(description)
    print("I arrived!")
}
travel4 {
    return "I'm going to \($0) at \($1) miles per hour."
}

//Returning closures from functions

func travel5() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}
let result2 = travel5()
result2("London")

//Capturing values

func travel6() -> (String) -> Void {
    var counter = 1
    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}
let result3 = travel6()
let result3 = travel6()
let result3 = travel6()

// The counter value will be different each time we call result(), because Swift sees it needs to be captured by the closure so it moves it to a safe place


// * You can assign closures to variables, then call them later on.
// * Closures can accept parameters and return values, like regular functions.
// * You can pass closures into functions as parameters, and those closures can have parameters of their own and a return value.
// * If the last parameter to your function is a closure, you can use trailing closure syntax.
// * Swift automatically provides shorthand parameter names like $0 and $1, but not everyone uses them.
// * If you use external values inside your closures, they will be captured so the closure can refer to them later.


// Structs

struct Sport {
    var name: String
    var isOlympicSport: Bool

    var olympicStatus: String { // computed property
        if isOlympicSport {
            return "\(name) is an Olympic sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }

    var sportNumber : Int {
        didSet{
            print("The number of sports is \(sportNumber)")
        }
    }

    var mutateName :String

    mutating func calculatePrice()-> Int {
        mutateName = "hello"
        return sportNumber * 10
    }
}

var chessBoxing = Sport(name: "Chessboxing", isOlympicSport: false , sportNumber: 100 , mutateName: "world") // create an instance of the Sport struct
print(chessBoxing.olympicStatus) // access the computed property
chessBoxing.calculatePrice() // call the method


// initializers

struct User {
    var username: String

    init(username: String) {
        print("Creating a new (\(username))!")
        self.username = username  // the self.username refers to the property, whereas username refers to the parameter
    }
}

var user = User()
user.username = "twostraws"

//lazy properties

struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}

struct Person {
    var name: String
    lazy var familyTree = FamilyTree()

    init(name: String) {
        self.name = name
    }
}

var ed = Person(name: "Ed")
ed.familyTree // the familyTree property won't be created until it's accessed for the first time


// Classes

class Dog {
    var name: String
    var breed: String

    //functions 
     func makeNoise() {
        print("Woof!")
    }

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

// Inheritance

class Poodle: Dog {
    init(name: String) {
        super.init(name: name, breed: "Poodle")
    }

    override func makeNoise() { // override the makeNoise() method
        print("Yip!")
    }
}

let poppy = Poodle("Poppy")
poppy.makeNoise()

//* Classes don’t enforce constants as strongly as structs – if a property is declared as a variable, it can be changed regardless of how the class instance was created.

// Protocols

protocol Identifiable {
    var id: String { get set }
}

struct User: Identifiable {
    var id: String
}

func displayID(thing: Identifiable) {
    print("My ID is \(thing.id)")
}


//? Protocol inheritance
protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

protocol Employee: Payable, NeedsTraining, HasVacation { }

// Extensions
extension Int {
    func squared() -> Int {
        return self * self
    }
        var isEven: Bool {
        return self % 2 == 0
    }
}

// Protocol extensions
//* Swift’s arrays and sets both conform to a protocol called Collection

let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set(["John", "Paul", "George", "Ringo"])

extension Collection {
    func summarize() {
        print("There are \(count) of us:")

        for name in self {
            print(name)
        }
    }
}

pythons.summarize()
beatles.summarize()

// Protocol-oriented programming

protocol Identifiable2 {
    var id: String { get set }
    func identify()
}

extension Identifiable2 {
    func identify() {
        print("My ID is \(id).")
    }
}

struct User2: Identifiable2 {
    var id: String
}

let twostraws = User2(id: "twostraws");
twostraws.identify()