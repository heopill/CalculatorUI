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
### main.swift 
``` swift
let game = BaseballGame()
game.start() // BaseballGame 인스턴스를 만들고 start 함수를 구현하기
```
<br/>

### BaseballGame.swift 
``` swift
import Foundation

// BaseballGame.swift 파일 생성
class BaseballGame {
    private let checker = BaseballNumberChecker()
    private let number = Number()
    private let recordManager = RecordManager()
    
    func start() {
        while true {
            print("환영합니다! 원하시는 번호를 입력해주세요")
            print("1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기")
            
            guard let inputString = readLine(),
                  let inputMenu = Int(inputString) else {
                print("올바른 숫자를 입력해주세요")
                break
            }
            
            switch inputMenu {
            case 1:
                print("\n< 게임을 시작합니다 >")
                let count = startGame()
                // return된 count를 recordManager.add 함수로 전달하여 시도 횟수 저장
                recordManager.add(count)
                continue
            case 2:
                recordManager.showRecords() // 시도 횟수 출력
                continue
            case 3:
                print("\n< 숫자 야구 게임을 종료합니다 >")
            default:
                print("올바를 숫자를 입력해주세요!\n")
                continue
            }
            break
            
        } // while문 끝
        
    } // start() 끝
    
    func startGame() -> Int {
        let answer = number.makeNumber() // 정답을 만드는 함수
        var trialCount = 1
        
        while true {
            // 1. 유저에게 입력값을 받음
            print("숫자를 입력하세요")
            
            // 2. 정수로 변환되지 않는 경우 반복문 처음으로 돌아가기
            // guard 를 사용하여 옵셔널 바인딩 처리
            guard let inputString2 = readLine(),
                  let inputNumber = Int(inputString2) else {
                print("세자리 정수를 입력해주세요")
                continue
            }
            
            print("입력한 숫자 : \(inputNumber)")
            
            // 3. 세자리가 아니거나, 0을 가지거나 특정 숫자가 두번 사용된 경우 반복문 처음으로 돌아가기
            if String(inputNumber).count != 3  { // 숫자가 세자리인지 검사
                print("\n올바르지 않은 입력값입니다")
            // } else if String(inputNumber).contains("0") { // 입력값에 0 포함 검사
            //  print("숫자에 0이 포함되어 있습니다.")
            } else if checker.alreadyHasNumber(inputNumber) { // 중복 숫자 검사 함수
                print("\n중복된 입력값이 있습니다")
            } else {
                // 4. 정답과 유저의 입력값을 비교하여 스트라이크/볼을 출력하기
                // 만약 정답이라면 break 호출하여 반복문 탈출
                if checker.compareNumber(answer, inputNumber) {
                    break
                }
            }
            trialCount += 1
        }
        return trialCount
    }
}

```
<br/>

## 예외 처리
- makeAnswer() : 0부터 9까지의 중복되지 않은 3자리 랜덤 숫자 만들기
- alreadyHasNumber() : 입력받은 숫자의 중복 검사
- 입력받은 숫자가 3자리인지 검사
<br/>


## 과제 요구사항 반영 여부
* [x] Lv1 - `UILabel` 을 사용해서 수식을 표시할 수 있는 라벨을 띄웁니다.
* [x] Lv2 - `UIStackView` 을 사용해서 4개의 버튼을 모아 가로 스택뷰 생성. 왼쪽과 같이 구성해보세요.
* [x] Lv3 - `UIStackView` 을 사용해서 세로 스택 뷰 생성. 왼쪽과 같이 구성해보세요.
* [ ] Lv4 - 연산 버튼 (+, -, *, /, AC, =) 들은 색상을 orange 로 설정.
* [ ] Lv5 - 모든 버튼들을 원형으로 만들기.
* [ ] Lv6 - 버튼을 클릭하면 라벨에 표시되도록 합니다.
* [ ] Lv7 - 초기화 버튼 (`AC`) 을 구현합니다.
* [ ] Lv8 - 등호 (=) 버튼을 클릭하면 연산이 수행되도록 구현합니다.

