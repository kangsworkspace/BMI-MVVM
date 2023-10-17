//
//  ViewController.swift
//  BMI-MVVM
//
//  Created by Kang on 10/16/23.
//

import UIKit

class ViewController: UIViewController {
    
    var viewModel: BMIViewModel
    
    init(viewModel: BMIViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 인터페이스
    // 생성 - 메인 레이블
    var mainLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        label.backgroundColor = .lightGray
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 생성 - 키 레이블
    var heightLabel: UILabel = {
        let label = UILabel()
        label.text = "키"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 생성 - 키 텍스트 필드
    var heightTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 5
        textField.clipsToBounds = true
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.placeholder = " cm단위로 입력해주세요"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    // 생성 - 키 스택뷰
    var heightStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // 생성 - 몸무게 레이블
    var weightLabel: UILabel = {
        let label = UILabel()
        label.text = "몸무게"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 생성 - 몸무게 텍스트 필드
    var weightTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 5
        textField.clipsToBounds = true
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.placeholder = " kg단위로 입력해주세요"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    // 생성 - 몸무게 스택뷰
    var weightStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // 생성 - 메인 스택뷰
    var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.spacing = 10
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
        button.backgroundColor = .systemBlue
        
        // 둥글게 깎기
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 백그라운드 색상 설정
        view.backgroundColor = .lightGray
        
        firstSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // BMI 데이터 초기화
        viewModel.resetBMI()
        // 메인 텍스트 초기화
        setupMainText()
    }
        
    // 다른 창 눌렀을 때 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // 셋업 - 초기 셋업
    func firstSetup() {
        setAddView()
        setAutoLayout()
        setDelegate()
        setAddTarget()
    }
    
    func setAddView() {
        
        // 키 스택 뷰
        heightStackView.addArrangedSubview(heightLabel)
        heightStackView.addArrangedSubview(heightTextField)
        
        // 몸무게 스택 뷰
        weightStackView.addArrangedSubview(weightLabel)
        weightStackView.addArrangedSubview(weightTextField)
        
        // 메인 스택 뷰
        mainStackView.addArrangedSubview(mainLabel)
        mainStackView.addArrangedSubview(heightStackView)
        mainStackView.addArrangedSubview(weightStackView)
        
        // 메인 스택 뷰
        view.addSubview(mainStackView)
        
        // 계산 버튼
        view.addSubview(calculateButton)
    }
    
    func setAutoLayout() {
        
        // 레이블 레이아웃 설정 (mainLabel, heightLabel,weightLabel
        NSLayoutConstraint.activate([
            mainLabel.heightAnchor.constraint(equalToConstant: mainViewConstraintsValue.heightValue),
            heightLabel.heightAnchor.constraint(equalToConstant: mainViewConstraintsValue.heightValue),
            weightLabel.heightAnchor.constraint(equalToConstant: mainViewConstraintsValue.heightValue),
            
            heightLabel.widthAnchor.constraint(equalToConstant: mainViewConstraintsValue.labelWidth),
            weightLabel.widthAnchor.constraint(equalToConstant: mainViewConstraintsValue.labelWidth)
        ])
        
        
        // mainStackView 오토 레이아웃
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: mainViewConstraintsValue.widthConstraintsValue),
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 140),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -mainViewConstraintsValue.widthConstraintsValue),
        ])
        
        
        // calculateButton 오토 레이아웃
        NSLayoutConstraint.activate([
            calculateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: mainViewConstraintsValue.widthConstraintsValue),
            calculateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -mainViewConstraintsValue.widthConstraintsValue),
            calculateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            
            calculateButton.heightAnchor.constraint(equalToConstant: mainViewConstraintsValue.heightValue)
        ])
    }
    
    func setDelegate() {
        heightTextField.delegate = self
        weightTextField.delegate = self
    }
    
    func setAddTarget() {
        calculateButton.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
    }
    
   
    @objc func calculateButtonTapped() {
        print("calculateButtonTapped")
    }
    
    func setupMainText() {
        mainLabel.text = viewModel.mainTextString
        mainLabel.textColor = viewModel.mainLabelTextColor
    }
}

extension ViewController: UITextFieldDelegate {
    
    
    
    
    
    
    
    
    
}

