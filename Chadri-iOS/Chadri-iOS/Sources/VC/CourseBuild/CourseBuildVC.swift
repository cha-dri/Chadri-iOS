//
//  CourseBuildVC.swift
//  Chadri-iOS
//
//  Created by 이원석 on 2021/02/05.
//

import UIKit
import NMapsMap
import CoreLocation

class CourseBuildVC: UIViewController,CLLocationManagerDelegate {
    @IBOutlet weak var mapView: NMFNaverMapView!{
        didSet{
            mapView.showLocationButton = true
        }
    }
    @IBOutlet weak var buildCompleteBtn: UIButton!{
        didSet{
            buildCompleteBtn.makeRounded(cornerRadius: 34.0)
        }
    }
    
    
    var locationManager: CLLocationManager!{
        didSet{
            locationManager.delegate = self
        }
    }
    var latitude: Double?
    var longtitude: Double?
    var camera: NMFCameraUpdate!
    var markers = [NMFMarker]()
    var markerList : [Markers] = []
    var courseList : [CourseBuild] = []
    var coord = NMGLatLng()
    var sendIdx : Int = 0
    var sendStatus : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myLocationSetting()
        markerData()
        setCamera()
        setMarker()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        markerList[sendIdx].status = sendStatus
    }
    
    @IBAction func completeBtn(_ sender: Any) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "CourseCompleteVC") as? CourseCompleteVC{
            vc.modalPresentationStyle = .overFullScreen
            vc.modalTransitionStyle = .crossDissolve
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    func myLocationSetting(){
        // CLLocationManager클래스의 인스턴스 locationManager를 생성
        locationManager = CLLocationManager()
        // 포그라운드일 때 위치 추적 권한 요청
        locationManager.requestWhenInUseAuthorization()
    }
    
    // MARK : 위치 허용 선택했을 때 처리
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined :
            manager.requestWhenInUseAuthorization()
            break
        case .authorizedWhenInUse:
            setCamera()
            break
        case .authorizedAlways:
            setCamera()
            break
        case .restricted :
            break
        case .denied :
            break
        default:
            break
        }
    }
    
    // 현재 위치 계속 출력
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1]
        print(location)
    }
    
    // 마커 fake data
    func markerData(){
        markerList.append(contentsOf: [
            Markers(lat: 37.504147, lng: 126.956954, status: false, imagename : "chungangroad", spacename:"중앙로", description: "은행나무 조성, 아름다운 단풍을 느낄수 있음"),
            Markers(lat: 37.454013, lng: 126.876365, status: false, imagename : "groomsan", spacename:"구름산산림욕장", description: "피크닉장, 황토길, 세족장, 야외소공연장, 놀이시설"),
            Markers(lat: 37.67877, lng: 127.02263, status: false, imagename : "sebit", spacename:"세빛섬, 반포대교 달빛무지개분수", description: "미디어아트갤러리, 전망대"),
            Markers(lat: 37.8893177, lng: 126.740081, status: false, imagename : "imjin", spacename:"임진각관광지", description: "기념비공원 6.25납북자기념관"),
            Markers(lat: 37.73131118, lng: 126.9488973, status: false, imagename : "jangheung", spacename:"장흥관광지", description: "캠핑장+미술관"),
            Markers(lat: 37.31487372, lng: 127.2678442, status: false, imagename : "yongin", spacename:"용인자연휴양림", description: "숲속의집, 숲속체험관, 생태습지, 야영장, 잔디광장, 짚라인, 목재문화체험관 등"),
            Markers(lat: 37.5936268, lng: 126.9916662, status: false, imagename : "simwoojang", spacename:"심우장", description: "여행자 극장"),
            Markers(lat: 37.88988548, lng: 127.1371472, status: false, imagename : "dongdu", spacename:"동두천자연휴양림", description: "숲속의집, 야외데크, 잔디광장, 유아숲체험원"),
        ])
    }
    
    // 지도 초기 위치 현재위치로 설정
    func setCamera() {
        // 배터리에 맞게 권장되는 최적의 정확도
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        // 위치 업데이트
        locationManager.startUpdatingLocation()
        
        // 위,경도 가져오기
        let coor = locationManager.location?.coordinate
        latitude = coor?.latitude
        longtitude = coor?.longitude
        
        camera = NMFCameraUpdate(scrollTo: NMGLatLng(lat: latitude ?? 0, lng: longtitude ?? 0))
        camera.animation = .linear
        //mapView.moveCamera(camera)
    }
    
    // 마커 놓기
    func setMarker(){
        
        for index in 0..<markerList.count{
            let marker:NMFMarker
            marker = NMFMarker(position: NMGLatLng(lat: markerList[index].lat, lng: markerList[index].lng), iconImage: NMF_MARKER_IMAGE_PINK)
            
            marker.iconPerspectiveEnabled = true // 원근효과
            
            marker.touchHandler = { (overlay: NMFOverlay) -> Bool in
                
                print(marker.position)
                print(self.courseList)
                if let vc = self.storyboard?.instantiateViewController(withIdentifier: "CourseBuildPopUpVC") as? CourseBuildPopUpVC{
                    vc.modalPresentationStyle = .overFullScreen
                    vc.modalTransitionStyle = .crossDissolve
                    if marker.iconImage == NMapsMap.NMF_MARKER_IMAGE_BLUE{
                        vc.markerStatus = true
                    }else{
                        vc.markerStatus = false
                    }
                    vc.imageName = self.markerList[index].imagename
                    vc.spaceName = self.markerList[index].spacename
                    vc.spaceInfo = self.markerList[index].description
                    marker.iconImage = NMapsMap.NMF_MARKER_IMAGE_RED
                    vc.popupMarker = marker
                    self.present(vc, animated: true, completion: nil)
                }
                return true
            }
            
            marker.mapView = mapView.mapView
            markers.append(marker)
            
        }
    }
}


