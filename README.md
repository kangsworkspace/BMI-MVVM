# BMI

## 🖥️ 프로젝트 소개

- 기존에 진행했던 [BMI를 계산해주는 프로젝트](https://github.com/kangsworkspace/BMI-Refectoring) 를 MVVM 패턴으로 리펙토링 하였습니다.

<br>

## 👀 파일 구성

- UI와 관련된 상수를 담은 Constants
- 데이터 구조와 관련 로직을 담은 BMI, BMICalculatorManager
- 뷰 모델인 BMIViewModel
- 사용자로부터 값을 입력받을 첫번째 뷰 ViewController
- 결과값을 알려주는 두번째 뷰 ResultViewContoller


<br>

## 📌 학습한 주요 내용
#### MVVM 패턴 적용
파일을 Models, ViewModels, Views 로 나누어 MVVM 패턴을 적용했습니다.
특히, Views에서 최대한 로직을 빼서 ViewModels에서 처리하도록 하였습니다.
프로젝트의 크기가 너무 작아서인지 아직 MVC 패턴에 비해 유지/보수가 쉬울 것이다라는 느낌은 받지 못했습니다.
하지만 기존 MVC패턴에서 뷰에서 처리할 것인지 컨트롤러에서 처리할 것인지 애매했던 부분은 명확해진 느낌을 받았습니다. 

#### 의존성 주입
프로토콜을 활용해서 ViewModel에 의존성 주입을 했습니다.
Model인 BMICalculatorManager의 클래스 타입을 별도의 프로토콜 CalculatorType으로 선언했습니다.
그리고 ViewModel인 BMIViewModel에서 CalculatorType으로 bMICalculatorManager를 선언했습니다.
때문에 BMIViewModel에서 BMICalculatorManager를 의존하지 않게 되었습니다.


## 🎬 완성된 모습 (기존의 프로젝트와 거의 동일합니다)
![1](https://github.com/kangsworkspace/DataStorage/assets/141600830/bf43bed3-c95a-400c-84c1-eafe79607267)
![2](https://github.com/kangsworkspace/DataStorage/assets/141600830/f608ee53-0bd7-4a03-85b0-94db0fc48f41)
![3](https://github.com/kangsworkspace/DataStorage/assets/141600830/dfb0e042-7ab6-49f9-9896-e67a6f88938e)
![4](https://github.com/kangsworkspace/DataStorage/assets/141600830/68567437-0b66-4b75-9d75-b7ba9b2fe2e6)



## 🙉 문제점 및 해결

아키텍처를 변경해본 만큼 기존보다 코드가 깔끔한지, 유지보수가 쉬울 것인지 등을 고려해봤으나 학습이 부족한 것 같습니다.
AutoLayOut을 잡을 때 겹치는 설정을 관리하기 위해 따로 상수 파일을 만들어서 선언했으나
파일이 분리되어 더 분산된 느낌을 받았습니다. 
이러한 문제는 페이지가 많고 규모가 더 큰 프로젝트르 진행해봐야 좋은 방법을 찾을 수 있을 것 같습니다.

<br>
<br>
ViewController에서 ViewModel인 BMIViewModel을 받아오는데 오류가 계속해서 발생하였습니다.
필수 생성자와 관련된 "init(coder:) has not been implemented" 오류가 발생하여
생성자와 관련된 코드인줄 알았으나 스토리 보드와 관련된 설정이 남아있어 ViewController의 인스턴스를 생성하다 충돌이 발생한 문제였습니다.
스토리 보드와 관련된 설정을 삭제하고 해결하였습니다.


