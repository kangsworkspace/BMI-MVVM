//
//  ViewController.swift
//  BMI-MVVM
//
//  Created by Kang on 10/16/23.
//

import UIKit

class ViewController: UIViewController {

    // 생성 - 메인 레이블
    var mainLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 생성 - 키 레이블
    var heightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 생성 - 키 텍스트 필드
    var heightTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    // 생성 - 키 스택뷰
    var heightStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // 생성 - 몸무게 레이블
    var weightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 생성 - 몸무게 텍스트 필드
    var weightTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    // 생성 - 몸무게 스택뷰
    var weightStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // 생성 - 메인 스택뷰
    var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // 생성 - 계산 버튼
    var calculateButton: UIButton = {
        let button = UIButton()
        
        // 타이틀 설정
        button.setTitle("BMI 계산하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        
        // 백그라운드 컬러
        button.backgroundColor = .blue
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // 생성 - leadingAnchor 설정
    var leadingConstraint: NSLayoutConstraint?
    
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstSetup()
    }

    // 셋업 - 초기 셋업
    func firstSetup() {
        setAddView()
        setAutoLayout()
    }
    
    func setAddView() {
        
//        // 키 스택 뷰
//        heightStackView.addArrangedSubview(heightLabel)
//        heightStackView.addArrangedSubview(heightTextField)
//        
//        // 몸무게 스택 뷰
//        weightStackView.addArrangedSubview(weightLabel)
//        weightStackView.addArrangedSubview(weightTextField)
//
//        // 메인 스택 뷰
//        mainStackView.addArrangedSubview(mainLabel)
//        mainStackView.addArrangedSubview(heightStackView)
//        mainStackView.addArrangedSubview(weightStackView)
//        
//        // 메인 스택 뷰
//        view.addSubview(mainStackView)
        // 계산 버튼
        view.addSubview(calculateButton)
    }
    
    func setAutoLayout() {
        
        // calculateButton 오토 레이아웃
        NSLayoutConstraint.activate([
            // calculateButton.leadingAnchor.constraint(equalTo: constant: )
        
        
        ])
        
        
        
    }
}

