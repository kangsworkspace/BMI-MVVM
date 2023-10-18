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
    
    // MARK: - Output(데이터 뷰로 전달하기)
    var mainTextString: String {
        return mainText.rawValue
    }
    
    var mainLabelTextColor: UIColor {
        return mainText.textColor
    }
    
    var bmiValueString: String {
        return String(bmi?.value ?? 0.0)
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
    
    // MARK: - Input(뷰에서 입력받기)
    func setHeightValue(_ height: String) {
        self.heightString = height
    }
    
    func setWeightValue(_ weight: String) {
        self.weightString = weight
    }
    
    
    
    // MARK: - 로직
    // BMI 데이터 초기화
    func resetBMI() {
        heightString = ""
        weightString = ""
        
        bmi = nil
        mainText = .right
    }
    
    // 계산 버튼 실행 함수
    func calculateButtonTapped(fromCurrentVC: UIViewController, animated: Bool) {
        
        if self.makeBMIResult() {
            heightString = ""
            weightString = ""
            goToNextVC(fromCurrentVC: fromCurrentVC, animated: true)
        } else {
            mainText = .notRight
        }
    }
    
    // 다시 계산하기 버튼 실행 함수
    func reCalculateButtonTapped(fromCurrentVC: UIViewController, animated: Bool) {
        fromCurrentVC.dismiss(animated: true)
    }
    
    
    // BMI 결과값 만들기
    func makeBMIResult() -> Bool {
        
        do {
            bmi = try bmiCalculatorManager.calculateBMI(height: self.heightString, weight: self.weightString)
            return true
        } catch {
            let error = error as! CalculateError
            switch error {
            case .minusNumberError:
                print("마이너스 숫자 입력")
            case .noNumberError:
                print("숫자가 아닌 글자 입력")
            default:
                break
            }
            print("BMI 계산 실패")
            return false
        }
    }
    
    // 화면 이동 함수
    func goToNextVC(fromCurrentVC: UIViewController, animated: Bool) {

        // 이동할 창
        let resultVC = ResultViewController(viewModel: self)
        
        // 전체화면으로 설정
        resultVC.modalPresentationStyle = .fullScreen
        
        // resultVC로 이동
        fromCurrentVC.present(resultVC, animated: animated, completion: nil)
    }
}


