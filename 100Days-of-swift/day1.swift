
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