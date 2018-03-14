//
//  ViewController.swift
//  CALC
//
//  Created by VitKet team on 10/03/18.
//  Copyright © 2018 vitket/Xcode. All rights reserved.
//
// Include frameworks.
import UIKit
import Foundation

// Declare variables.
var firstNumeral = ""
var secondNumeral = ""
var myOperator = 0

// Beginning. Create class ViewController.
class ViewController: UIViewController {
    // Display.
    @IBOutlet weak var display: UILabel!

    //  0,1,2,3,4,5,6,7,8,9 buttons.
    @IBAction func myNumbers(_ sender: UIButton) {
        display.text = display.text! + String(sender.tag)      // Cancatenate input character with output string, for output.
        if myOperator == 0 {
            firstNumeral = firstNumeral + String(sender.tag)   // If dont press one of operations button, firstNumeral assign input value.
        }else {
            secondNumeral = secondNumeral + String(sender.tag) // If press one of the operations button, secondNumeral assign second input value.
        }
    }

    //  "-", "+", "*", "/", "Power()"  buttons.
    @IBAction func arithmeticOperations(_ sender: UIButton) {
        // If we have second input value, we do math.
        if secondNumeral != ""{
            switch myOperator{
                case 1001:
                    firstNumeral = String(Double(firstNumeral)! + Double(secondNumeral)!)
                case 1002:
                    firstNumeral = String(Double(firstNumeral)! - Double(secondNumeral)!)
                case 1003:
                    firstNumeral = String(Double(firstNumeral)! * Double(secondNumeral)!)
                case 1004:
                    firstNumeral = String(Double(firstNumeral)! / Double(secondNumeral)!)
                default:
                    print("")
            }
            // After math we must clear secondNumeral variable, fo other math-operations.
            secondNumeral = ""
        }
        // We will get here when we don't have second input value, and after save operator input tag value in myOperator variable, and clear displaye. Each button has its own tag integer value.
        if firstNumeral != "" {
            myOperator = Int(sender.tag)
            display.text = ""
        }
    }

    // "." dot-button.
    @IBAction func decimal(_ sender: Any) {
        if Int(display.text!) != nil {
            display.text = display.text! + "."       // If we have input integer Int value we cancatenate dot to this value.
            if secondNumeral == "" {
                firstNumeral = firstNumeral + "."    // If we don't have second value, we save first input value to firstNumeral variable.

            }else {
                secondNumeral = secondNumeral + "."  // If we have second input value, we save this in secondNumeral variable.

            }
        }
    }

    // "=" button.
    @IBAction func myResult(_ sender: UIButton) {
        // If we have second input value, we do the math.
        if secondNumeral != ""{
            switch myOperator{
                case 1001:
                    firstNumeral = String(Double(firstNumeral)! + Double(secondNumeral)!)
                case 1002:
                    firstNumeral = String(Double(firstNumeral)! - Double(secondNumeral)!)
                case 1003:
                    firstNumeral = String(Double(firstNumeral)! * Double(secondNumeral)!)
                case 1004:
                    firstNumeral = String(Double(firstNumeral)! / Double(secondNumeral)!)
                case 1005:
                    firstNumeral = String(pow(Double(firstNumeral)!, Double(secondNumeral)!))
                default:
                print("")
            }
            // After math clear myOperator, secondNumeral variables for other math operations.
            myOperator = 0
            secondNumeral = ""
        }

        // If we have first input value, here we check(compare) to determine, how!!!  output this value on display, with dot(if value have some integers(and not ZERO too) in exponential part), or output integer value, without dot.
        if firstNumeral != "" {
            if Double(firstNumeral) == Double(Int(Double(firstNumeral) ?? 0)) {
                display.text = String(Int(Double(firstNumeral) ?? 0))
            } else {
                display.text = firstNumeral // We will get here if we have value with dot.

            }
         }
    }

    // "C/AC (Clear/AllClear)" button.
    @IBAction func myDelete(_ sender: UIButton) {
        // Clear all variables, operators and clear display.
        firstNumeral = ""
        secondNumeral = ""
        display.text = ""
        myOperator = 0
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
// Game Over,  =)
