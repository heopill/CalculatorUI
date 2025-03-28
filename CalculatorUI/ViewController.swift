//
//  ViewController.swift
//  CalculatorUI
//
//  Created by 허성필 on 3/28/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let label = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .black
        label.textColor = .white
        label.text = "12345"
        label.textAlignment = .right
        label.font = .boldSystemFont(ofSize: 60)
        
//        [label]
//            .forEach { view.addSubview($0) }
        
        view.addSubview(label)
        
        
        label.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.top.equalToSuperview().offset(200)
            make.height.equalTo(100)
        }
        
    }
}

