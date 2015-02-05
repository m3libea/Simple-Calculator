//
//  ViewController.swift
//  Calculator
//  You can do additions, substractions, multiplications and divisions. It is working with float(for the division) 
//  but you can not introduce a decimal number yet.
//
//  Created by m3libea on 02/03/15.
//  Copyright (c) 2015 ccsf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tView: UITextField!
    @IBOutlet var label: UILabel?
    var num1: Float = 0
    var num2: Float = 0
    //To control if it is the first number or not
    var unit: Bool = true
    //To store the operator
    var oper: String = ""
    //To Control if there is an operator already or not
    var operC: Bool = false
    
    //Portrait mode locked
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.Portrait.rawValue)
    }

    //Numbers buttons
    @IBAction func btnAction(button:UIButton!){
        
        //Value marked on the button
        var value: NSString = button.titleLabel!.text!
        var valueF: Float = value.floatValue
        
        if(!operC){
            //If we don't have any operator, we modify the first number
            if(unit){
                //First digit
                num1 = valueF
                unit = false
            }else{
                //More than one digit
                num1*=10
                num1+=valueF
            }
            tView.text = "\(num1)"
            
        }else{
            if(unit){
                //First digit
                num2 = valueF
                unit = false
            }else{
                //More than one digit
                num2*=10
                num2+=valueF
            }
            tView.text = "\(num2)"
        }
    
    }
    
    //Operators buttons
    @IBAction func btnActionOperator(button:UIButton){
        
        if(!operC){
            operC = true
            unit = true
            
            //Store the clicked operator
            oper = button.titleLabel!.text!
        }
        
        //Write the operator in the label
        label?.text = oper
    }
    
    //C button
    @IBAction func btnC(){
        //Clear button, we need to reset the calculator
        num1 = 0
        resetValues()
        tView.text = "0"
    }
    
    //Equal button
    @IBAction func btnEqual(){
        
        //To Store the final result
        var total:Float = num1
        
        if(operC){
        
            //Check which operator we have, and do the correct operation
            if(oper == "+"){
                total+=num2
            }else if(oper == "-"){
                total-=num2
            }else if(oper == "*"){
                total*=num2
            }else{
                total/=num2
            }
        }
        
        tView.text = "\(total)"
        num1 = total
        resetValues()
        label?.text = ""
    }
    
    func resetValues(){
        num2 = 0
        oper = ""
        operC = false
        unit = true
    }
}

