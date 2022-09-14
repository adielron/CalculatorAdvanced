
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    var didPressDot: Bool = false
    
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!)  else {
                
                fatalError("cannot convert display label text into double")
            }

            return number
        }
        set {
            displayLabel.text = returnString(number: newValue) 
        }
    }
    
    private var calculator = CalculatorLogic()



    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
        

        
        calculator.setNumber(displayValue)
        
        if let pressedValue = sender.currentTitle {
            
            guard let result = calculator.calculateMethod(symbol: pressedValue) else {
                fatalError("the result of calculation is nil")
            }
            displayValue = result
            
            if pressedValue == "%" || pressedValue == "+/-"{
                return
            }
            didPressDot = false

        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        //What should happen when a number is entered into the keypad
        if let numValue = sender.currentTitle {
    
             if isFinishedTypingNumber {
                 
                 if didPressDot {
                     return
                 }

                 displayLabel.text = numValue
                 isFinishedTypingNumber = false
                 
                 if sender.currentTitle == "." {
                     didPressDot = true
                 }
             } else {
                 
                 if numValue == "." {
                     if didPressDot {
                         return
                     }
                     let isInt = floor(displayValue) == displayValue
                     if !isInt {
                         return
                     }
                     didPressDot = true
                 }
                 displayLabel.text = displayLabel.text! + numValue
             }
             }
         }
    
    
    func returnString(number: Double) -> String {
        
        if floor(number) == number{
            return String(format: "%.0f", number)
        }
        return String(format: "%.2f", number)

    }
    
    
    
    
}

