//
//  BMIViewModel.swift
//  BMI-MVVM
//
//  Created by Kang on 10/17/23.
//

import Foundation
import UIKit.UIColor

enum ValidationText: String {
    case right = "키와 몸무게를 입력하세요"
    case notRight = "키와 몸무게를 입력하셔야만 합니다!"
    
    var textColor: UIColor {
        switch self {
        case .right:
            return .black
        case .notRight:
            return .red
        }
    }
}

class BMIViewModel {
    
    // 의존성 주입
    var bmiCalculatorManager: CalculatorType
    
    // 뷰에 전달할 데이터
    private var mainText: ValidationText = .right
    
    private var heightString: String = ""
    private var weightString: String = ""
    
    private var bmi: BMI?
    
    // MARK: - Output
    var mainTextString: String {
        return mainText.rawValue
    }
    
    var mainLabelTextColor: UIColor {
        return mainText.textColor
    }
    
    var bmiAdviceString: String {
        return bmi?.advice ?? ""
    }
    
    var bmiColor: UIColor {
        return bmi?.matchColor ?? UIColor.white
    }
    
    // MARK: - Init
    init(bmiCalculatorManager: CalculatorType) {
        self.bmiCalculatorManager = bmiCalculatorManager
    }
    
    // BMI 데이터 초기화
    func resetBMI() {
        heightString = ""
        weightString = ""
        
        bmi = nil
        mainText = .right
    }
}
