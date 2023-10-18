//
//  ResultViewController.swift
//  BMI-MVVM
//
//  Created by Kang on 10/17/23.
//

import UIKit

class ResultViewController: UIViewController {

    // MARK: -  뷰 모델 사용
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
        label.text = "BMI 결과값"
        label.font = UIFont.systemFont(ofSize: 20)
        label.backgroundColor = .lightGray
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 생성 - bmi 값 레이블
    var bmiValueLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 생성 - bmi 텍스트 레이블
    var bmiTextLable: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 생성 - 메인 스택 뷰
    var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // 생성 - 다시 계산 버튼
    var reCalculateButton: UIButton = {
        let button = UIButton()
        
        // 타이틀 설정
        button.setTitle("다시 계산하기", for: .normal)
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstSetup()
    }
    
    func firstSetup() {
        
        // 배경화면
        view.backgroundColor = .lightGray
        
        setAddView()
        setAutoLayout()
        setAddTarget()
        configureUI()
    }
    
    
    
    func setAddView() {
        mainStackView.addArrangedSubview(mainLabel)
        mainStackView.addArrangedSubview(bmiValueLabel)
        mainStackView.addArrangedSubview(bmiTextLable)
        
        view.addSubview(mainStackView)
        view.addSubview(reCalculateButton)
    }
    
    func setAutoLayout() {
        
        // 레이블 레이아웃 설정 (mainLabel, heightLabel,weightLabel
        NSLayoutConstraint.activate([
            mainLabel.heightAnchor.constraint(equalToConstant: 44),
            bmiValueLabel.heightAnchor.constraint(equalToConstant: 44),
            bmiTextLable.heightAnchor.constraint(equalToConstant: 44)
        ])

        // mainStackView 오토 레이아웃 설정
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: mainViewConstraintsValue.widthConstraintsValue),
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 140),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -mainViewConstraintsValue.widthConstraintsValue)
        ])
        
        // reCalculateButton 오토 레이아웃
        NSLayoutConstraint.activate([
            reCalculateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: mainViewConstraintsValue.widthConstraintsValue),
            reCalculateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -mainViewConstraintsValue.widthConstraintsValue),
            reCalculateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            
            reCalculateButton.heightAnchor.constraint(equalToConstant: 44)
        ])
        
    }
    
    func setAddTarget() {
        reCalculateButton.addTarget(self, action: #selector(reCalculateButtonTapped), for: .touchUpInside)
    }
    
    func configureUI() {
        bmiValueLabel.text = viewModel.bmiValueString
        bmiValueLabel.backgroundColor = viewModel.bmiColor
        
        bmiTextLable.text = viewModel.bmiAdviceString
    }
    
    @objc func reCalculateButtonTapped() {
        viewModel.reCalculateButtonTapped(fromCurrentVC: self, animated: true)
    }
}
