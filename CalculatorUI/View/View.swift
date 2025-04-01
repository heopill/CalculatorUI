//
//  View.swift
//  CalculatorUI
//
//  Created by 허성필 on 4/1/25.
//

import UIKit

class View: UIView {
    
    let label = UILabel() // label 생성
    let verticalStackView = UIStackView()
    private var result: String = "0"
    
    let buttonLabels = [["7", "8", "9", "+"],["4", "5", "6", "-"],
                        ["1", "2", "3", "*"], ["AC", "0", "=", "/"]]

    override init(frame: CGRect) {
        super.init(frame: frame)
        makeLabelUI() // 라벨 생성
        makeVerticalStackView() // 1개의 Vertical 스택 뷰를 생성
        for i in buttonLabels { // 4개의 Horizontal 스택 뷰를 생성
            makeHorizontalStackView(i) //
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // 숫자 라벨 만들기
    private func makeLabelUI() { // 숫자 라벨 만들기
        self.backgroundColor = .black
        label.textColor = .white
        label.text = result // Lv6 기본 텍스트 변경
        label.textAlignment = .right
        label.font = .boldSystemFont(ofSize: 60)
        
        self.addSubview(label)
        
        label.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.top.equalToSuperview().offset(200)
            make.height.equalTo(100)
        }
    }
    
    private func makeVerticalStackView() { // Vertical 스택 뷰를 생성 함수
        verticalStackView.axis = .vertical
        verticalStackView.backgroundColor = .black
        verticalStackView.spacing = 10
        verticalStackView.distribution = .fillEqually
        
        self.addSubview(verticalStackView)
        
        verticalStackView.snp.makeConstraints{ make in
            make.width.equalTo(350)
            make.top.equalTo(label.snp.bottom).offset(60)
            make.centerX.equalToSuperview()
        }
    }
    
    private func makeButton(_ text: String) -> UIButton { // 버튼을 만드는 함수
        let button = UIButton()
        
        button.setTitle(text, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.layer.cornerRadius = 40
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchDown)
        
        // 해당 text가 들어오면 backgroundColor를 orange색으로 변경
        if ["+", "-", "*", "/", "="].contains(text) {
            button.backgroundColor = .orange
        } else if ["AC"].contains(text) {
            button.backgroundColor = .red
        } else {
            button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
        }
        
        button.snp.makeConstraints{ make in
            make.width.height.equalTo(80)
        }
        
        return button
    }
    
    // 버튼 클릭 이벤트
    @objc
    private func buttonTapped(_ sender: UIButton) {
        let viewController = ViewController()
        if let buttonText = sender.currentTitle {
            if buttonText == "AC" {
                result = "0"
                label.text = result
                label.textColor = .white
            } else if buttonText == "=" { // 함수 사용전에 입력 받아져있는 값을 검증
                if ["+", "-", "*", "/"].contains(result.suffix(1)) {
                    label.text = "Error!"
                    label.textColor = .yellow
                } else {
                    if let result = viewController.calculate(expression: result) {
                        label.text = "\(result)"
                        label.textColor = .white
                    } else {
                        label.text = "0"
                        label.textColor = .white
                    }
                }
            } else if label.text == "0" {
                result = buttonText
                label.text = result
                label.textColor = .white
            } else {
                result = (label.text ?? "") + buttonText
                label.text = result
                label.textColor = .white
            }
        }
    }
    
    // Horizontal 스택 뷰를 생성 함수
    private func makeHorizontalStackView(_ buttonLabel: [String]) {
        
        let horizontalStackView = UIStackView()
        
        verticalStackView.addArrangedSubview(horizontalStackView)
        
        horizontalStackView.axis = .horizontal
        horizontalStackView.backgroundColor = .black
        horizontalStackView.spacing = 10
        horizontalStackView.distribution = .fillEqually
        
        horizontalStackView.snp.makeConstraints{ make in
            make.height.equalTo(80)
        }
        
        for i in buttonLabel {
            horizontalStackView.addArrangedSubview(makeButton(i)) // 4번 반복
        }

    }
}
