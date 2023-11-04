//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Ujjwal Singh on 26/07/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit
struct CalculatorBrain {
    var bmi : BMI?
    
    func getBMIValue() -> String {
        return String(format : "%.1f", bmi?.value ?? 0.0)
    }

    mutating func calculateBMI(h: Float, w: Float){
        let bmiValue = w/(h*h)
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: UIColor.blue)
        }else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: UIColor.green)
        }else{
            bmi = BMI(value: bmiValue, advice: "Eat less pies", color: UIColor.red)
        }
    }
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.white
    }
}
