# 스파르타 코딩 클럽 내일배움캠프 3,4주차 개인 과제
<br/>

## __계산기 앱 만들기(UI 구현)__

<p align="center">
<img width="1588" alt="Image" src="https://github.com/user-attachments/assets/e2791ce2-7677-4370-abe9-b85e21a8cdcc" />
</p>

#### 입문 강의에서 배운 것들을 복습하며 지금까지 Playground에서 로직만 구현했던 계산기에 UI를 더해, 실제 앱으로 완성해봅시다. 
<br/>

## 📋 프로젝트 개요
> 이 과제에서는 간단한 약식 계산기 앱을 개발합니다.
> 
> 
>    - 소수점을 고려하지 않은, 정수형 계산만 하며
>    - 모든 연산 버튼을 클릭할때마다 계산이 이루어지도록 하지는 않으며
>    - 등호 버튼 (`=`) 을 클릭했을 때만 연산이 이루어지도록 합니다.
>    - 수식 문자열이 들어왔을 때 이를 계산해주는 Swift 의 기본 제공 기능을 활용합니다.
>
> 일반적인 계산기 앱은 구현이 꽤 복잡합니다. 예를 들어 소수점이 들어오는 경우를 고려, 입력된 값의 자릿수가 너무 커서 지정한 라벨의 영역을 넘어가는 경우를 고려해야 하며, 세자리 수 마다 쉼표를 찍어줘야하며, 모든 연산 버튼을 클릭할때마다 계산이 이루어져야 합니다. 
><br/>
<br/>

## 🛠️ 사용 기술
- 언어: Swift 5.9
- 개발 환경: Xcode 16+
- Xcode Codebase UI 활용
- SnapKit 라이브러리 사용
  <img width="879" alt="Image" src="https://github.com/user-attachments/assets/eaa2d47a-e47b-4dc0-89db-e6f69c792c69" />
<br/>

## 구현기능 가이드 공통 사항
- `UILabel` 로 숫자를 표시합니다.
- `UIButton` 으로 숫자와 연산 버튼들을 만듭니다.
- `UIStackView` 로 버튼들을 규칙성있게 배치합니다.
- `AutoLayout` 을 활용해서 레이아웃을 설정합니다.
- `backgroundColor` , `layer.cornerRadius` 등 다양한 속성들을 활용합니다.
- `UIButton` 의 `addTarget` 혹은 `IBAction` 으로 버튼을 클릭했을 때 이벤트를 설정합니다.
<br/>

## 📝 요구사항 설명
- `UILabel` 을 사용해서 수식을 표시할 수 있는 라벨을 띄웁니다. (Lv 1)
  - `backgroundColor = .black`
  - `textColor = .white`
  - 우선, 텍스트는 `12345` 로 고정
  - 텍스트 오른쪽 정렬
  - Font = 시스템 볼드체, 사이즈 60
<br/>

- `UIStackView` 을 사용해서 4개의 버튼을 모아 가로 스택뷰 생성. 왼쪽과 같이 구성해보세요. (Lv 2)
  - `UIButton` 속성
    - `font = .boldSystemFont(ofSize: 30)`
    - `backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)`
    - `height = 80`
    - `width = 80`
    - `layer.cornerRadius = 40`
  -  `horizontalStackView` 속성 
      - `axis = .horizontal`
      -  `backgroundColor = .black`
      - `spacing = 10`
      - `distribution = .fillEqually`
  - `horizontalStackView AutoLayout`
    - `height` = 80
<br/>   
    
- `UIStackView` 을 사용해서 세로 스택 뷰 생성. 왼쪽과 같이 구성해보세요. (Lv 3)
  - `verticalStackView` 속성
    - `axis = .vertical`
    - `backgroundColor = .black`
    - `spacing = 10`
    - `distribution = .fillEqually`
  - `verticalStackView AutoLayout`
    - `width` = 350
    - `top = label` 의 `bottom` 으로 부터 60 떨어지도록.
    - `centerX = superView` 와 같도록.
<br/>

- 연산 버튼 (+, -, *, /, AC, =) 들은 색상을 orange 로 설정. (Lv 4)
  - 개발 효율성을 위한 팁.
    버튼을 만드는 `func makeButton` 이라는 메서드가 있었고 인자로 `titleValue: String`, `action: Selector`, `backgroundColor: UIColor` 를 받을 수 있으면 편했겠죠.
<br/>

- 모든 버튼들을 원형으로 만들기. (Lv 5)
  - `HorizontalStackView` 의 높이 = 80
  - `VerticalStackView` 의 가로 = 350.
  - `VerticalStackView` 의 Spacing = 10
  - 그렇기 때문에 `VerticalStackView` 에 들어가는 모든 버튼은 가로 길이가 (350 - 10 * 3) / 4 = 80 이 됨.
  - 즉 모든 버튼은 정사각형이 됨.
  - 버튼을 원형으로 만들기 위해서는 정사각형 버튼을 만들고, `cornerRadius` 를 한 변 길이의 절반으로 설정하면 됩니다.
  - 여기까지 했으면 필수 구현들을 마쳤습니다.
  - 기본적인 UI 구성이었습니다.
  - 이 다음 스텝들은 본격적인 로직의 영역입니다.
<br/>

- 버튼을 클릭하면 라벨에 표시되도록 합니다. (Lv 6)
  - 이제 기본 텍스트는 “12345” 가 아닌 “0” 이 되도록 합니다.
  - 기본으로 라벨에 노출되어있던 텍스트 오른쪽에 버튼을 클릭하면 그 버튼의 값이 추가되도록 합니다.
    - 예를들어 설명하면
      1. 맨처음 기본값 `0` 
      2. 그 다음 `1` 클릭했음 → 표시되는 값은 `01` 
      3. 그 다음 `2` 클릭했음 → 표시되는 값은 `012` 
      4. 그 다음 `+` 클릭했음 → 표시되는 값은 `012+` 
      5. 그 다음 `3` 클릭했음 → 표시되는 값은 `012+3`
  - 하지만 `012` 라는 값은 이상합니다. 맨 앞자리가 `0` 인 숫자라면, 0을 지우고 표현하도록 합니다.
    - 예를들면, `012 → 12` 가 되어야 합니다.
 <br/>
 
 - 초기화 버튼 (`AC`) 을 구현합니다. (Lv 7)
   - AC 버튼을 클릭하면 모든 값을 지우고 “0” 으로 초기화 되도록 구현합니다.
 <br/>  
    
 - 등호 (=) 버튼을 클릭하면 연산이 수행되도록 구현합니다. (Lv 8)
    - `1+2+3` 을 입력 후, `=` 을 클릭하면 결과값인 `6` 이 출력되도록 해주세요.
    - `123*456` 을 입력 후, `=` 을 클릭하면 결과값인 `56088` 이 출력되도록 해주세요.
    - 연산에 필요한 메서드를 제공해드리겠습니다. 이 메서드를 활용해주세요.
       ``` swift
      /// 수식 문자열을 넣으면 계산해주는 메서드.
      ///
      /// 예를 들어 expression 에 "1+2+3" 이 들어오면 6 을 리턴한다.
      /// 잘못된 형식의 수식을 넣으면 앱이 크래시 난다. ex) "1+2++"
      func calculate(expression: String) -> Int? {
      	    let expression = NSExpression(format: expression)
          if let result = expression.expressionValue(with: nil, context: nil) as? Int {
              return result
          } else {
              return nil
          }
      }
      ```
    - 주석의 설명대로, 잘못된 형식의 수식을 넣으면 동작하지 않습니다.
    - 예를들어 `1+2++` 라는 수식은 잘못된 수식입니다.
          
  <br>
  
## 🧑‍💻 코드 예시
### makeHorizontalStackView.swift 
``` swift
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
```
<br/>

### makeButton.swift 
``` swift
private func makeButton(_ text: String) -> UIButton { // 버튼을 만드느 함수
        let button = UIButton()
        
        button.setTitle(text, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.layer.cornerRadius = 40
        
        // 해당 text가 들어오면 backgroundColor를 orange색으로 변경
        if ["+", "-", "*", "/", "=", "AC"].contains(text) {
            button.backgroundColor = .orange
        } else {
            button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
        }
        
        button.snp.makeConstraints{ make in
            make.width.height.equalTo(80)
        }
        
        return button
    }

```
<br/>

## 예외 처리
- 연산자 두개 입력 시 오류 발생
<br/>


## 과제 요구사항 반영 여부
* [x] Lv1 - `UILabel` 을 사용해서 수식을 표시할 수 있는 라벨을 띄웁니다.
* [x] Lv2 - `UIStackView` 을 사용해서 4개의 버튼을 모아 가로 스택뷰 생성. 왼쪽과 같이 구성해보세요.
* [x] Lv3 - `UIStackView` 을 사용해서 세로 스택 뷰 생성. 왼쪽과 같이 구성해보세요.
* [x] Lv4 - 연산 버튼 (+, -, *, /, AC, =) 들은 색상을 orange 로 설정.
* [x] Lv5 - 모든 버튼들을 원형으로 만들기.
* [ ] Lv6 - 버튼을 클릭하면 라벨에 표시되도록 합니다.
* [ ] Lv7 - 초기화 버튼 (`AC`) 을 구현합니다.
* [ ] Lv8 - 등호 (=) 버튼을 클릭하면 연산이 수행되도록 구현합니다.

