
---

# Camera Info App

Flutter를 사용하여 사용 가능한 카메라의 정보를 표시하는 앱입니다.

## 시작하기 전에

이 앱을 실행하기 전에 준비사항을 확인해주세요

### 필요한 것들

- Flutter SDK
- Dart SDK
- Android 또는 iOS 디바이스/에뮬레이터

### 의존성

이 프로젝트는 `camera` 패키지에 의존합니다. `pubspec.yaml` 파일에서 패키지이름과 버전을 확인할 수 있습니다.

## 설치

1. 저장소를 클론합니다.
   ```bash
   git clone [repository-url]
   ```

2. 디렉토리로 이동합니다.
   ```bash
   cd [directory-name]
   ```

3. Flutter 패키지를 가져옵니다.
   ```bash
   flutter pub get
   ```

4. 앱을 실행합니다.
   ```bash
   flutter run
   ```

## 플랫폼별 설정

### iOS 설정

`ios/Runner/Info.plist`에 다음 두 줄을 추가합니다:

- 키: `Privacy - Camera Usage Description` 및 사용 설명.
- 키: `Privacy - Microphone Usage Description` 및 사용 설명.

텍스트로 `Info.plist`를 편집할 경우, 다음을 추가합니다:

```xml
<key>NSCameraUsageDescription</key>
<string>여기에 사용 설명을 입력하세요</string>
<key>NSMicrophoneUsageDescription</key>
<string>여기에 사용 설명을 입력하세요</string>
```

### Android 설정

`android/app/build.gradle` 파일에서 최소 Android sdk 버전을 21(또는 그 이상)으로 변경합니다:

```
minSdkVersion 21
```

에뮬레이터에서는 정상적인 동작을 기대하기 어려우니 실기기를 사용해주세요


### 카메라 접근 권한 처리

카메라 컨트롤러를 초기화할 때 권한 오류가 발생할 수 있습니다. 이러한 오류를 적절하게 처리해야 합니다.

