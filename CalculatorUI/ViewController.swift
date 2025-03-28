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
    let horizontalstackView = UIStackView() // stackView 생성
    
    private func makeButton(_ text: String) -> UIButton {
        let button = UIButton()
        
        button.setTitle(text, for: .normal)
        button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        
        horizontalstackView.addArrangedSubview(button)
        
        button.snp.makeConstraints{ make in
            make.width.height.equalTo(80)
        }
        
        return button
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        makeButton("7")
        makeButton("8")
        makeButton("9")
        makeButton("+")
    }
    
    private func configureUI() {
        view.backgroundColor = .black
        label.textColor = .white
        label.text = "12345"
        label.textAlignment = .right
        label.font = .boldSystemFont(ofSize: 60)
        
        horizontalstackView.axis = .horizontal
        horizontalstackView.backgroundColor = .black
        horizontalstackView.spacing = 10
        horizontalstackView.distribution = .fillEqually
        
        
        [label, horizontalstackView]
            .forEach { view.addSubview($0) }
        
        // view.addSubview(label)
        
        
        label.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.top.equalToSuperview().offset(200)
            make.height.equalTo(100)
        }
        
        horizontalstackView.snp.makeConstraints{ make in
            make.height.equalTo(80)
            make.top.equalTo(label.snp.bottom).offset(60)
            make.centerX.equalToSuperview()
        }
    }
    
    
}

