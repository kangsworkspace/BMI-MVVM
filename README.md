# BMI

## 🖥️ 프로젝트 소개

- 기존에 진행하였던 BMI 계산기를 클론 코딩한 내용을 MVC 패턴을 적용해서 리팩토링 하였습니다.
[기존에 진행한 내용](https://github.com/kangsworkspace/BMI)
- 강의를 따라가며 앱을 한번 제작했고 현재의 프로젝트는 동일한 앱을 처음부터 가급적 혼자서 내용을 되새기며 구현해봤습니다.
<br>

## 👀 파일 구성
![파일 정리](https://github.com/kangsworkspace/BMI-Refectoring/assets/141600830/a980c39d-1370-4f0e-a9ba-57fb533e0470)

-  파일의 구성을 크게 "Models", "Views", "Controllers"로 하였습니다.
- "Models" 에서는 BMI 계산과 관련된 로직을, "Views"에서는 스토리 보드를, "Controllers"에는 값을 받아오고 뷰로 보내는 등의 처리하였습니다.
<br>

## 📌 학습한 주요 내용
#### MVVM 패턴 적용



#### 의존성 주입




## 🎬 완성된 모습 (기존의 프로젝트와 동일합니다)

![GIFMaker_me](https://github.com/kangsworkspace/BMI/assets/141600830/0f298d1d-f275-4bce-95bd-949973f6d400)


## 🙉 문제점 및 해결

코드를 최대한 깔끔하게, 유지보수, 수정, 확장 가능하도록.

AutoLayOut 설정 겹치는 부분 변수 하나로 관리
로직이 아니니까 View

애매하게 설정하니 더 분산된 느낌 

양 사이드만 설정

파일을 분리하나?

일단은 static let으로 외부에서 관리...
깔끔하진 않다.
프로젝트 규모가 커져봐야 알겠다.
   

