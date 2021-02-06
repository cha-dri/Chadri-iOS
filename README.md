## 🚙 Project

* <b> SW Univ, Joint Hackathon </b>
* 프로젝트 기간: 2021.02.04 ~ 02.06
> 당신만의 완벽한 드라이브 코스, 차들이.


<br>

## 🚙 차들이 WorkFlow

### `Home & 차들이 AI `  


<img width="901" alt="image" src="https://user-images.githubusercontent.com/42789819/107106525-76e04580-686f-11eb-9340-fd900a47034a.png">


* 차들이는 드라이브 코스를 제안합니다. 사용자는 현재 기분에 따라 차들이가 제안하는 코스를 추천받을 수 있습니다
* 차들이 아이콘을 클릭하게 되면 몇가지 질문을 통해 사용자의 특성을 분석하고 코스를 추천해줍니다
* 추천을 받지 않아도 기존에 키워드별로 정리되어있는 코스를 클릭하여 입맛에 맞는 코스를 찾아갈 수 있습니다


### `코스 상세 뷰`


<img width="809" alt="image" src="https://user-images.githubusercontent.com/42789819/107106783-ac396300-6870-11eb-8c0e-0d3626b160c1.png">


* 코스 상세 뷰로 진입하게 되면 해당 코스가 상단에 표시됩니다
* 코스 표시부 하단으로는 다른 사용자가 작성했던 후기와 키워드 업로드 된 사진이 표시됩니다
* 차들이는 각 코스별로 **바로 길찾기**와 **Playlist 추천** 기능을 제공합니다
    * 하단 왼쪽에 위치한 초록색 길찾기 버튼은 네이버맵 길찾기 웹사이트와 연결됩니다
    * 하단 오른쪽에 위치한 빨간색 음악추천 버튼은 유튜브 플레이 리스트와 연결됩니다


### `코스 만들기`


<img width="454" alt="image" src="https://user-images.githubusercontent.com/42789819/107106550-91b2ba00-686f-11eb-8089-967ef71d5cc5.png">


* 나만의 코스 또한 만들 수 있습니다. 차들이는 현재 위치 기준 40km이내의 명소들을 수집합니다
* 사용자는 원하는 곳의 마커를 터치하여 코스에 추가할 수 있습니다
* 완성된 코스는 "내가 스키드 마크를 남긴 곳" 페이지에 저장됩니다




## 🛠 개발 환경 및 사용한 라이브러리 (Development Environment and Using Library)

### Development Environment

![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg) [![Creative Commons License](https://img.shields.io/badge/license-CC--BY--4.0-blue.svg)](http://creativecommons.org/licenses/by/4.0/) </br> 


### Using Library  
| 라이브러리(Library) | 목적(Purpose) | 버전(Version) |
|:---:|:----------:|:----:|
| NMaps   | 지도 | - |
| Alamofire   | 서버 통신 | 5.4.1 |
| Kingfisher  | 이미지 처리 | 5.15.8 |


<br>
 <br>
 
 ## 📜 Coding Convention 
 <details>
 <summary> 📂 폴더구조 </summary>
 <div markdown="1">       

<br>

**Resources**
* AppDelegate
* SceneDelegate
* Assets.xcassets
* Storyboard
* APIService
    * APIConstant
* Font

**Sources**
* VC
* Class
* Cell
* Model
    * GenericResponse
* Extension
            
**Info.plist**

<br>


<img width="228" alt="Chadri-iOS xcodeproj 2021-02-04 21-41-37" src="https://user-images.githubusercontent.com/42789819/106894097-d3d5e180-6731-11eb-9a45-33ea43f4938e.png">


<br>
 </div>
 </details>
 
 
 <details>
 <summary> ⚙️ 폴더링 규칙 </summary>
 <div markdown="1"> 
 
 <br>
 
 규칙

- 폴더링 한 후 Sources 폴더에 있는 파일들은 각 파일 하위에 자신 스토리보드 이름에 해당하는 폴더를 만들어 관리합니다. 


<img width="233" alt="Chadri-iOS xcodeproj 2021-02-04 21-39-15" src="https://user-images.githubusercontent.com/42789819/106894156-e9e3a200-6731-11eb-8f35-cb2f7d380acb.png">

- 파일 네이밍 시, 접두에 스토리보드이름을 붙여서 네이밍합니다.
    -  (ex. 스토리보드 이름이 Main, Watering이라고 가정했을 때 cell파일 생성 시 MainBlahblahCVC, WateringBlahblahTVC와 같이 네이밍합니다.)
        

 </div>
 </details>



<details>
<summary> 🖋 네이밍 </summary>
<div markdown="1">       

<br>

**Class & Struct**

- 클래스/구조체 이름은 **UpperCamelCase**를 사용합니다.

- 클래스 이름에는 접두사를 붙이지 않습니다.

 좋은 예 >

  ```swift
  class ChadriView: UIView
  ```

 나쁜 예 >

  ```swift
  struct chadriCarInfo { }
  ```

**함수 & 변수 & 상수**

- 함수와 변수에는 **lowerCamelCase**를 사용합니다.

- 버튼명에는 **Btn 약자**를 사용합니다.

- 모든 IBOutlet에는 해당 클래스명을 뒤에 붙입니다. 
    - ~~ImageView, ~~Label, ~~TextField와 같이 속성값을 붙여줍니다.


 좋은 예 >

  ```swift
  @IBOutlet weak var wateringBtn: UIButton!
  @IBOutlet weak var chadriMainView: UIView!
  @IBOutlet weak var chadriTableView: UITableView!
  ```

 나쁜 예 >

  ```swift
  @IBOutlet weak var ScrollView: UIScrollView!
  @IBOutlet weak var chadricollectionview: UICollectionView!
  @IBOutlet weak var tagcollectionview: UICollectionView!
  @IBOutlet weak var tableview: UITableView!
  ```

</div>
</details>
 
 
 
 <details>
 <summary> 🏷 주석 </summary>
 <div markdown="1">       
 
 <br>

 - `// MARK:` 를 사용해서 연관된 코드를 구분짓습니다.
 - `///` 를 사용해서 문서화에 사용되는 주석을 남깁니다. (ex. /// 사용자 프로필을 그려주는 뷰)
 <br>

 </div>
 </details>


<details>
<summary> 📎 기타 </summary>
<div markdown="1">       

<br>

- viewDidLoad() 내에는 **Function만 위치**시킵니다.
- 중복되는 부분들은 +Extension.swift로 만들어 활용합니다.
- 메인컬러와 같이 자주 쓰이는 컬러들은 Asset에 Color Set을 만들어서 사용합니다.
- , 뒤에 반드시 띄어쓰기를 합니다.
- 함수끼리 1줄 개행합니다.
- 중괄호는 아래와 같은 형식으로 사용합니다.
```swift
if (condition){

  Statements
  /*
  ...
  */
  
}
```
</div>
</details>
 
 
<br>

 다음 스타일 Guide를 참고헀습니다. 👉🏻[Style Guide](https://github.com/StyleShare/swift-style-guide)


## 💻 Github mangement

<details>
<summary> 차들이🚙 Gitflow </summary>
<div markdown="1">       


- main 브랜치

 메인(main): 메인 브랜치

 기능(차들이 뷰이름): 기능별 (뷰별) 로컬 브랜치 

- 커밋 메세지는 다른 사람들이 봐도 이해할 수 있게 써주세요.

- 풀리퀘스트를 통해 코드 리뷰를 해보아요.

<br>

```
- Main
   ├── chadriMainView(각 Local Branch)
   ├── chadriCourseMakingView    
   └── chadriMyPageView
```

<br>

**각자 자신이 맡은 기능 구현에 성공시! 브랜치 다 쓰고 병합하는 방법**

- 브랜치 만듦

```bash
git branch 기능(or 뷰)이름
```

- 원격 저장소에 로컬 브랜치 push

```bash
git push --set-upstream origin 브랜치이름(뷰이름)
```
```bash
git push -u origin 브랜치이름(뷰이름)
```


- 브랜치 전환

```bash
git checkout 뷰이름
```

- 코드 변경 (현재 **뷰이름** 브랜치)

```bash
git add .
git commit -m "커밋 메세지" origin 뷰이름
```

- 푸시 (현재 **뷰이름** 브랜치)

```bash
git push origin 뷰이름 브랜치
```

- 뷰이름 브랜치에서 할 일 다 했으면 **main** 브랜치로 전환

```bash
git checkout main
```

- 머지 (현재 **main** 브랜치)

```bash
git merge 뷰이름
```

- 다 쓴 브랜치 삭제 (local) (현재 **main** 브랜치)

```bash
git branch -d 뷰이름
```

- 다 쓴 브랜치 삭제 (remote) (현재 **main** 브랜치)

```bash
git push origin :뷰이름
```

- main pull (현재 **main** 브랜치)

```bash
git pull or git pull origin main
```

- main push (현재 **main** 브랜치)

```bash
git push or git push origin main
```
</div>
</details>
  

<br>
<br>
 

## Developer Introduction


| 팀원  | 소개 |역할 |
|:---:|:-------:|:---------------:|
| [원석](https://github.com/snowedev) | 안녕하세요 이원석 입니다!  | - |
| [재현](https://github.com/tjvm0877) | 안녕하세요 김재현 입니다!  | - |


<br>
<br>

