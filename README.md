# \[졸업프로젝트\]차량 데이터 딥러닝을 통한 실시간 위험예측 시스템

**개발기간** : 21.03.01 ~ 21.06.17

**개발자** : [kimjihyeon99](https://github.com/kimjihyeon99), [Kim-AYoung](https://github.com/Kim-AYoung), [ssonghj](https://github.com/ssonghj)

**개발환경** 

📌 DB : SQLite3

📌 IDE : Jupyter notebook, IntelliJ, Android Studio

📌 Programming Language : Python, Dart

📌 Application UI Toolkit : flutter

## 0. Introduce

- 차량에서 발생하는 데이터를 OBD 기기로 수집하여 차량 스캐너 앱으로 정보를 전송합니다.

- 이후 시스템이 위험 운전 행동의 전조증상을 분석하고, 위험 운전 행동을 예측한 다음, 그 결과를 앱으로 전송하여 운전자에게 알람을 제공하는 것을 목표로 프로젝트를 수행하였습니다.



**개발코드**

### [📌 차량 스캐너 앱 코드](https://github.com/Kim-AYoung/infocar_safety/tree/master/Flutter%20Code)

### [📌 학습 모델 코드](https://github.com/Kim-AYoung/infocar_safety/tree/master/Model%20Code)

### 화면구성

#### 1. mainmenu view

- 기존 infocar 앱에서 제공하는 menu를 기반으로 구성하였다.

- 해당 앱은 `운전스타일`메뉴만 이용 가능하다.


#### 2. drivestyle view

- 기존 infocar 앱에서 `운전스타일`화면은 운전자의 주행스타일을 분석한 결과를 보여주는 화면이다.

- 해당 앱은 알림설정 버튼을 추가하였다. 해당 버튼을 누르면 `alarm_config view`로 넘어가고

- 추가기능인 위험운전행동 사전알림 기능을 이용할지 결정할 수 있다. 


#### 3. alarm_config view

- 알림을 켠다면 소리, 진동, 팝업창 위치를 설정할 수 있다. 

