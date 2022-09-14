

import Foundation


struct CalculatorLogic {
    
    private var number: Double?
    
    private var interMediateCalculation: (n1:Double, calcMethod: String)?
    
    var canPressTheDot: Bool = true
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculateMethod(symbol: String) -> Double? {
        
        if let n = number {
            switch symbol  {
                case "+/-":
                    canPressTheDot = false
                    return n * -1
                case "AC":
                    canPressTheDot = true
                    return  0 
                case "%":
                    canPressTheDot = false
                    return n / 100
                case "=" :
                    return performTwoNumberCalculation(n2: n)
                default:
                    interMediateCalculation = (n1: n, calcMethod: symbol)
                    return n
                
                }
            }
        return nil
        }
    
    
    
    private func performTwoNumberCalculation(n2: Double) -> Double?{
        
        if let n1 = interMediateCalculation?.n1, let operation = interMediateCalculation?.calcMethod{
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "÷" :
                return n1 / n2
            case "×":
                return n1 * n2
            default:
                fatalError(" the operation passed in does not match any of the cases")
            }
        }
        return nil
    }
    
    
    
    }

