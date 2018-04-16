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

    // MARK: Outlets buttons
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var display2: UILabel!
    @IBOutlet weak var display3: UILabel!
    @IBOutlet weak var appleButton: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var buttonPlus: UIButton!
    @IBOutlet weak var buttonMinus: UIButton!
    @IBOutlet weak var buttonAsterisk: UIButton!

    //  0,1,2,3,4,5,6,7,8,9 buttons.
    // MARK: myNumbers @IBAction
    @IBAction func myNumbers(_ sender: UIButton) {
        if myOperator != 0 && secondNumeral == "" && myOperator != 1005 {
            display.text = ""                                               // Cleaning the display before displayning the secondNumeral
        }
        if myOperator == 1005 {
                display3.text = display3.text! + String(sender.tag)
        } else {
            display.text = display.text! + String(sender.tag)               // Cancatenate input character with output string, for output.
        }
        if myOperator == 0 {
            firstNumeral = firstNumeral + String(sender.tag)                // If dont press one of operations button, firstNumeral assign input value.
        } else {
            secondNumeral = secondNumeral + String(sender.tag)              // If press one of the operations button, secondNumeral assign second input value.
        }
    }

    //  "-", "+", "*", "/", "" —  buttons.
    // MARK: arithmeticOperations @IBAction
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
                case 1004: // Check division by zero.
                    if Int(Double(secondNumeral)!) != 0 {
                        firstNumeral = String(Double(firstNumeral)! / Double(secondNumeral)!)
                    } else {
                        display.text = "Error";
                        firstNumeral = "";
                        secondNumeral = "";
                        myOperator = 0 }
                case 1005: // ""
                    firstNumeral = String(pow(Double(firstNumeral)!, Double(secondNumeral)!))
                    display3.text = ""
                    display3.isHidden = true
                default:
                    display.text = "Error 2"
            }
        // If we have first input value, here we check(compare) to determine, how!!!  output this value on display, with dot(if value have some integers, and not zero, in exponential part), or output integer value, without dot. And we checking if the number exceeds the int.
            if Double(firstNumeral) ?? 0 <= Double(Int.max) && Double(firstNumeral) == Double(Int64(Double(firstNumeral) ?? 0)) {
                firstNumeral = String(Int64(Double(firstNumeral) ?? 0))
            }
            secondNumeral = "" // After math we must clear secondNumeral variable, fo other math-operations.
        }
        // We will get here when we don't have second input value, and after save operator input tag value in myOperator variable, and clear display. Each button has its own tag integer value.
        if firstNumeral != "" {
            myOperator = Int(sender.tag)
            display.text = firstNumeral  // Outputing the result after each arithmetic operation.
            if myOperator == 1005 {
                display3.isHidden = false
            }
        }

    }


    // "." dot-button.
    // MARK: decimal @IBAction
    @IBAction func decimal(_ sender: Any) {
        if Int(firstNumeral) != nil && myOperator == 0 {
            display.text =  display.text! + "."               // If we have input integer Int value we cancatenate dot to this value.
            firstNumeral = String(Int(firstNumeral)!) + "."   // If we don't have second value, we save first input value to firstNumeral variable.
        }else if Int(secondNumeral) != nil{
            display.text = display.text! + "."                // If we have input integer Int value we cancatenate dot to this value.
            secondNumeral = String(Int(secondNumeral)!) + "." // If we have second input value, we save this in secondNumeral variable.

        }
    }


    // "=" button.
    // MARK: myResult @IBAction
    @IBAction func myResult(_ sender: UIButton) {
        // team members birthdays, hidden surprise :)
        if secondNumeral == "28071985" && firstNumeral == "01051998" || firstNumeral == "28071984" && secondNumeral == "01051998" {
            display.text = "VitKet team!"

            firstNumeral = ""
            secondNumeral = ""
            myOperator = 0

        }else if firstNumeral == "28071984" || secondNumeral == "28071984" {
            display.text = "Vit"

            firstNumeral = ""
            secondNumeral = ""
            myOperator = 0

        }else if firstNumeral == "01051998" || secondNumeral == "01051998" {
            display.text = "Ket"

            firstNumeral = ""
            secondNumeral = ""
            myOperator = 0

        }else if firstNumeral == "26091980" || secondNumeral == "26091980" {
            display.text = "Pavel"

            firstNumeral = ""
            secondNumeral = ""
            myOperator = 0
        // birthday of man to whom this program dedicated
        }else if firstNumeral == "08011942" || secondNumeral == "08011942" {
            display.text = "Stephen Hawkin"
            display3.isHidden = false
            display3.text = "g"

            firstNumeral = ""
            secondNumeral = ""
            myOperator = 0

            button1.setBackgroundImage(UIImage(named: "Steve-Hawking_01.png"), for: .normal)
            button2.setBackgroundImage(UIImage(named: "Steve-Hawking_02.png"), for: .normal)
            button3.setBackgroundImage(UIImage(named: "Steve-Hawking_03.png"), for: .normal)
            buttonAsterisk.setBackgroundImage(UIImage(named: "Steve-Hawking_04.png"), for: .normal)
            button4.setBackgroundImage(UIImage(named: "Steve-Hawking_05.png"), for: .normal)
            button5.setBackgroundImage(UIImage(named: "Steve-Hawking_06.png"), for: .normal)
            button6.setBackgroundImage(UIImage(named: "Steve-Hawking_07.png"), for: .normal)
            buttonMinus.setBackgroundImage(UIImage(named: "Steve-Hawking_08.png"), for: .normal)
            button7.setBackgroundImage(UIImage(named: "Steve-Hawking_09.png"), for: .normal)
            button8.setBackgroundImage(UIImage(named: "Steve-Hawking_10.png"), for: .normal)
            button9.setBackgroundImage(UIImage(named: "Steve-Hawking_11.png"), for: .normal)
            buttonPlus.setBackgroundImage(UIImage(named: "Steve-Hawking_12.png"), for: .normal)
        }

        // If we have second input value, we do the math.
        if secondNumeral != ""{
            switch myOperator{
                case 1001:
                    firstNumeral = String(Double(firstNumeral)! + Double(secondNumeral)!)
                case 1002:
                    firstNumeral = String(Double(firstNumeral)! - Double(secondNumeral)!)
                case 1003:
                    firstNumeral = String(Double(firstNumeral)! * Double(secondNumeral)!)
                case 1004: // Check division by zero.
                    if Int(Double(secondNumeral)!) != 0 {
                        firstNumeral = String(Double(firstNumeral)! / Double(secondNumeral)!)
                    } else {
                        display.text = "Error";
                        firstNumeral = "";
                        secondNumeral = "" ;
                        myOperator = 0}
                case 1005: // ""
                    firstNumeral = String(pow(Double(firstNumeral)!, Double(secondNumeral)!))
                    display3.text = ""
                    display3.isHidden = true
                default:
                    print("")
            }
            // If we have first input value, here we check(compare) to determine, HOW output this value on display, with dot(if value have some integers(and not ZERO too) in exponential part), or output integer value, without dot. And we checking if the number exceeds the int.
            if Double(firstNumeral) ?? 0 <= Double(Int.max) && Double(firstNumeral) == Double(Int64(Double(firstNumeral) ?? 0)) {
                firstNumeral = String(Int64(Double(firstNumeral) ?? 0))
            }
            // After math clear myOperator, secondNumeral variables for other math operations.
            myOperator = 0
            secondNumeral = ""
        }


        if firstNumeral != "" {
                display.text = firstNumeral // Print result.
                myOperator = 0
         }
    }

    
    // "C/AC (Clear/AllClear)" button.
    // MARK: myDelete @IBAction
    @IBAction func myDelete(_ sender: UIButton) {
            // Clear all variables, operators and clear display.
            firstNumeral = ""
            secondNumeral = ""
            display.text = ""
            myOperator = 0
            display3.text = ""
            display3.isHidden = true

            // reset button image
            button1.setBackgroundImage(nil, for: .normal)
            button2.setBackgroundImage(nil, for: .normal)
            button3.setBackgroundImage(nil, for: .normal)
            button4.setBackgroundImage(nil, for: .normal)
            button5.setBackgroundImage(nil, for: .normal)
            button6.setBackgroundImage(nil, for: .normal)
            button7.setBackgroundImage(nil, for: .normal)
            button8.setBackgroundImage(nil, for: .normal)
            button9.setBackgroundImage(nil, for: .normal)
            buttonPlus.setBackgroundImage(nil, for: .normal)
            buttonMinus.setBackgroundImage(nil, for: .normal)
            buttonAsterisk.setBackgroundImage(nil, for: .normal)
        }



    override func viewDidLoad() {
        super.viewDidLoad()
        display3.isHidden = true

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// THE END







