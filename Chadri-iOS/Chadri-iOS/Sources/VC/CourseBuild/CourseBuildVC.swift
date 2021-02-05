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
           //print(location)
       }
    
    // 마커 fake data
    func markerData(){
        markerList.append(contentsOf: [
            Markers(lat: 37.5670140, lng: 126.9783750, status: false),
            Markers(lat: 37.5681230, lng: 126.9783740, status: false),
            Markers(lat: 37.5692320, lng: 126.9783730, status: false),
            Markers(lat: 37.5653410, lng: 126.9783720, status: false),
            Markers(lat: 37.5634550, lng: 126.9783760, status: false),
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
                
                marker.iconImage = NMapsMap.NMF_MARKER_IMAGE_RED
                print(marker.position)
                print(self.courseList)
                if let vc = self.storyboard?.instantiateViewController(withIdentifier: "CourseBuildPopUpVC") as? CourseBuildPopUpVC{
                    vc.modalPresentationStyle = .overFullScreen
                    vc.modalTransitionStyle = .crossDissolve
                    vc.popupMarker = marker
                    vc.markerIdx = index
                    print(index)
                    self.present(vc, animated: true, completion: nil)
                }
                return true
            }
            
            marker.mapView = mapView.mapView
            markers.append(marker)
            
        }
    }
}


