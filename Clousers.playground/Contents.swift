import UIKit

//  Тут я практикую функції

// Зробити композицію валідаторів

func composeValidators<T>(validators: [(T) -> Bool]) -> (T) -> Bool {
    return {value in
        
         for validator in validators {
            if(!validator(value)) {
                return false
            }
        }
        return true
    }
}

func isEven(number:Int) -> Bool { number % 2 == 0 }
func isPositive<T:Numeric & Comparable>(number: T) -> Bool {number >= 0}


var isPasesValidations = composeValidators(validators: [isEven,isPositive])

print(isPasesValidations(4))
print(isPasesValidations(-4))

