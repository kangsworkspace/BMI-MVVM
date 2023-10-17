//
//  BMICalculator.swift
//  BMI-MVVM
//
//  Created by Kang on 10/17/23.
//

import UIKit

enum CalculateError: Error {
    case noNumberError
    case minusNumberError
    case notAnError
}

protocol CalculatorType {
    // BMI 계산하기
    func calculateBMI(height: String, weight: String) throws -> BMI
}

struct BMICalculatorManager: CalculatorType {
    
    // BMI 계산하기
    func calculateBMI(height: String, weight: String) throws -> BMI {
        
        // String -> Double
        guard let height = Double(height), let weight = Double(weight) else {
            throw CalculateError.noNumberError
        }
        
        // 0 이상인지 확인
        guard height > 0, weight > 0 else {
            throw CalculateError.minusNumberError
        }
        
        // BMI 계산
        var bmiNum = weight / (height * height) * 10000
        bmiNum = round(bmiNum * 10) / 10
        
        switch bmiNum {
        case ..<18.6:
            let color = UIColor(displayP3Red: 22/255,
                                green: 231/255,
                                blue: 207/255,
                                alpha: 1)
            return BMI(value: bmiNum, advice: "저체중", matchColor: color)
            
        case 18.6..<23.0:
            let color = UIColor(displayP3Red: 212/255,
                                green: 251/255,
                                blue: 121/255,
                                alpha: 1)
            return BMI(value: bmiNum, advice: "표준", matchColor: color)
            
        case 23.0..<25.0:
            let color = UIColor(displayP3Red: 218/255,
                                green: 127/255,
                                blue: 163/255,
                                alpha: 1)
            return BMI(value: bmiNum, advice: "과체중", matchColor: color)
            
        case 25.0..<30.0:
            let color = UIColor(displayP3Red: 255/255,
                                green: 150/255,
                                blue: 141/255,
                                alpha: 1)
            return BMI(value: bmiNum, advice: "중도비만", matchColor: color)
            
        case 30.0...:
            let color = UIColor(displayP3Red: 255/255,
                                green: 100/255,
                                blue: 78/255,
                                alpha: 1)
            return BMI(value: bmiNum, advice: "고도비만", matchColor: color)
            
        default:
            throw CalculateError.notAnError
        }
    }
}


