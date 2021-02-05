//
//  CourseBuildPopUpVC.swift
//  Chadri-iOS
//
//  Created by 이원석 on 2021/02/05.
//

import UIKit
import NMapsMap

class CourseBuildPopUpVC: UIViewController {
    
    var popupMarker = NMFMarker()
    var markerIdx : Int = 0
    var markerStatus : Bool = false
    
    @IBOutlet weak var addBtn: UIButton!{
        didSet{
            addBtn.makeRounded(cornerRadius: 22.0)
        }
    }
    
    @IBOutlet weak var popUpView: UIView!{
        didSet{
            popUpView.makeRounded(cornerRadius: 25.0)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func coursePlus(_ sender: Any) {
        
        let preVC = self.presentingViewController
        guard let vc = preVC as? CourseBuildVC else { return }
        
        popupMarker.iconImage = NMapsMap.NMF_MARKER_IMAGE_BLUE
        vc.courseList.append(contentsOf: [
            CourseBuild(lat: self.popupMarker.position.lat, lng: self.popupMarker.position.lng)
        ])
        vc.sendIdx = self.markerIdx
        print(self.markerIdx)
        vc.sendStatus = true
        markerStatus = true
        
        self.dismiss(animated: true, completion: nil)
        
    }
    @IBAction func touchUpDismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        if markerStatus {
            popupMarker.iconImage = NMapsMap.NMF_MARKER_IMAGE_BLUE
        }else{
            popupMarker.iconImage = NMapsMap.NMF_MARKER_IMAGE_PINK
        }
    }
}
