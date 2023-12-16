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