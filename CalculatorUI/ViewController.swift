//
//  ViewController.swift
//  CalculatorUI
//
//  Created by 허성필 on 3/28/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let label = UILabel() // label 생성
    let verticalStackView = UIStackView()
    
    let buttonLabels = [["7", "8", "9", "+"],["4", "5", "6", "-"],
                        ["1", "2", "3", "*"], ["AC", "0", "=", "/"]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeLabelUI() // 라벨 생성
        makeVerticalStackView() // 1개의 Vertical 스택 뷰를 생성
        for i in buttonLabels { // 4개의 Horizontal 스택 뷰를 생성
            makeHorizontalStackView(i) //
        }
    }
    
    private func makeLabelUI() { // 숫자 라벨 만들기
        view.backgroundColor = .black
        label.textColor = .white
        label.text = "12345"
        label.textAlignment = .right
        label.font = .boldSystemFont(ofSize: 60)
        
        view.addSubview(label)
        
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
        
        view.addSubview(verticalStackView)
        
        verticalStackView.snp.makeConstraints{ make in
            make.width.equalTo(350)
            make.top.equalTo(label.snp.bottom).offset(60)
            make.centerX.equalToSuperview()
        }
    }
    
    private func makeButton(_ text: String) -> UIButton { // 버튼을 만드느 함수
        let button = UIButton()
        
        button.setTitle(text, for: .normal)
        button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        
        button.snp.makeConstraints{ make in
            make.width.height.equalTo(80)
        }
        
        // 해당 text가 들어오면 backgroundColor를 orange색으로 변경
        if ["+", "-", "*", "/", "=", "AC"].contains(text) {
            button.backgroundColor = .orange
        }
        
        return button
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
            // for문
            horizontalStackView.addArrangedSubview(makeButton(i)) // 4번 반복
            // 메이크 버튼
        }
        
        
    }
}

