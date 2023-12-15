
let a = 21 ; // Define a constant 'a' with a value of 21
let b = 2 ; // Define a constant 'b' with a value of 2

print(a+b) // Print the sum of 'a' and 'b'

// create an array of 5 elements
var arr : [Int] = [1,2,3,4,5]

// map the array to a new array with each element multiplied by 2
var arr2 : [Int] = arr.map({$0 * 2})
print(arr2) // Print the new array 'arr2' with each element multiplied by 2


func sum(_ num1: Int, _ num2: Int) -> Int {
    return num1 + num2
}

print(sum(1,2)) // Print the sum of 1 and 2

