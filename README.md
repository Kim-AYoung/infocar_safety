# \[졸업프로젝트\]차량 운행 데이터 딥러닝 기반의 실시간 위험 운전 행동 사전 알림 시스템

**개발기간** : 21.03.01 ~ 21.12.31

**개발자** : [kimjihyeon99](https://github.com/kimjihyeon99), [Kim-AYoung](https://github.com/Kim-AYoung), [ssonghj](https://github.com/ssonghj)

**개발환경** 

📌 DB : SQLite3

📌 IDE : Jupyter notebook, IntelliJ, Android Studio

📌 Programming Language : Python, Dart

📌 Application UI Toolkit : flutter

## 0. Introduce

- 차량에서 발생하는 주행 데이터를 OBD2 기기로 수집하여 차량 운행 정보 앱으로 정보를 전송합니다.

- 이후 시스템이 위험 운전 행동의 전조증상을 분석해 위험 운전 행동을 예측한 다음, 그 결과를 앱으로 전송하여 운전자에게 알람을 제공하는 것을 목표로 프로젝트를 수행했습니다.



## 1. **Implementation**

### 1) [차량 스캐너 앱 코드](https://github.com/Kim-AYoung/infocar_safety/tree/master/FlutterCode)

### 화면구성

#### ✔ 메인

- 기존 infocar 앱에서 제공하는 menu를 기반으로 구성했다.

- 해당 앱은 `운전스타일`메뉴만 이용 가능하다.


#### ✔ 운전 스타일

- 기존 infocar 앱에서 `운전스타일`화면은 운전자의 주행스타일을 분석한 결과를 보여주는 화면이다.

- 해당 앱은 위험 운전 행동 사전 알람 기능을 사용하기 위한 알림설정 버튼을 추가했다. 

- 사전 알람 기능이 켜져있다면 앱 내에서 **차량 주행 데이터를 읽고, 위험 운전 행동을 예측하여 알람을 제공**한다. 


#### ✔ 알림 설정 

- 위험 운전 행동 사전 알람 기능을 사용하는 경우 소리와 진동, 팝업창 위치를 설정할 수 있다. 

|<img width="200" height="400" src="https://user-images.githubusercontent.com/57066971/140322985-f6479b2e-cb03-487f-96cf-f0a172685cbd.jpg">|<img width="200" height="400" src="https://user-images.githubusercontent.com/57066971/140323057-e4c3dacb-ccf6-49e3-b695-a5eec64cc7e9.jpg">|<img width="200" height="400" src="https://user-images.githubusercontent.com/57066971/140323070-3f78237b-8b96-4637-ac05-2bf30f800f2e.jpg">|<img width="200" height="400" src="https://user-images.githubusercontent.com/57066971/140323068-8b37dced-4b33-4031-b51c-9cc2d47e458f.jpg">|
|:------:|:------:|:------:|:------:|
|메인|운전 스타일(알림 전)|운전 스타일(알림 후)|알림 설정|

### 2) [학습 모델 코드](https://github.com/Kim-AYoung/infocar_safety/tree/master/Model%20Code)

