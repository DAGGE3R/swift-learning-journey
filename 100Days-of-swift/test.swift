extension Int {
	func isPrime() -> Bool {
		if self <= 1 {
			return false
		}
		if self <= 3 {
			return true
		}
		var i = 2
		while i*i <= self {
			if self % i == 0 {
				return false
			}
			i = i + 1
		}
		return true
	}
	
}

func checkDivisibility(aRange: ClosedRange<Int>, nRange: ClosedRange<Int>, pRange: ClosedRange<Int>) -> [(Int, Int)] {
	var result: [(Int, Int)] = []
	for a in aRange {
		for n in nRange {
			for p in pRange {
				if a % n == 0 && a % p == 0 {
					let np = n * p
					if a % np != 0 {
						result.append((n, p))
					}
				}
			}
		}
	}
	return result
}

print(checkDivisibility(aRange: 1...100, nRange: 1...100, pRange: 1...100))