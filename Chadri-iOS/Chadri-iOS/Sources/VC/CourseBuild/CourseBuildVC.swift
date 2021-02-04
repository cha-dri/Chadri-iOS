//
//  CourseBuildVC.swift
//  Chadri-iOS
//
//  Created by 이원석 on 2021/02/05.
//

import UIKit
import NMapsMap

class CourseBuildVC: UIViewController {
    @IBOutlet weak var mapView: NMFMapView!
    
    var camera: NMFCameraUpdate!
    let coord = NMGLatLng(lat: 37.5670140, lng: 126.9783750)
    var markers = [NMFMarker]()
    var markerList : [Markers] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        markerData()
        setCamera()
        setMarker()
        // Do any additional setup after loading the view.
    }
    
    func markerData(){
        markerList.append(contentsOf: [
            Markers(lat: 37.5670140, lng: 126.9783750),
            Markers(lat: 37.5681230, lng: 126.9783740),
            Markers(lat: 37.5692320, lng: 126.9783730),
            Markers(lat: 37.5653410, lng: 126.9783720),
            Markers(lat: 37.5634550, lng: 126.9783760),
        ])
    }
    
    func setCamera() {
        camera = NMFCameraUpdate(scrollTo: coord)
        camera.animation = .linear
        mapView.moveCamera(camera)
    }
    
    func setMarker(){
        
        for index in 0..<markerList.count{
            let marker:NMFMarker
            marker = NMFMarker(position: NMGLatLng(lat: markerList[index].lat, lng: markerList[index].lng), iconImage: NMF_MARKER_IMAGE_PINK)
            
            marker.iconPerspectiveEnabled = true // 원근효과
            
            marker.touchHandler = { (overlay: NMFOverlay) -> Bool in
                
                marker.iconImage = NMapsMap.NMF_MARKER_IMAGE_RED
                print(marker.position)
                let storyBoard: UIStoryboard = UIStoryboard(name: "CourseBuild", bundle: nil)
                if let vc = storyBoard.instantiateViewController(withIdentifier: "CourseBuildPopUpVC") as? CourseBuildPopUpVC{
                                vc.modalPresentationStyle = .overFullScreen
                                vc.modalTransitionStyle = .crossDissolve
                                vc.popupMarker = marker
                                self.present(vc, animated: true, completion: nil)
                            }
                return true
            }
            
            marker.mapView = mapView
            markers.append(marker)
            
            
        }
    }
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


