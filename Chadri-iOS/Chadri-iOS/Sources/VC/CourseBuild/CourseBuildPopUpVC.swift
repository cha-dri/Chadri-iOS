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
    var imageName : String = ""
    var spaceName : String = ""
    var spaceInfo : String = ""
    
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
    @IBOutlet weak var spaceNameLabel: UILabel!
    @IBOutlet weak var spaceImageView: UIImageView!
    @IBOutlet weak var spaceInfoLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPopUp()
        if markerStatus {
            addBtn.setTitle("삭제하기", for: .normal)
            addBtn.backgroundColor = .chadriRed
        }else{
            addBtn.setTitle("추가하기", for: .normal)
            addBtn.backgroundColor = .chadriBlue
        }
    }
    
    func setPopUp(){
        spaceImageView.image = UIImage(named: imageName)
        spaceNameLabel.text = spaceName
        spaceInfoLabel.text = spaceInfo
    }
    
    @IBAction func coursePlus(_ sender: Any) {
        if markerStatus {
            popupMarker.iconImage = NMapsMap.NMF_MARKER_IMAGE_PINK
        }else{
            popupMarker.iconImage = NMapsMap.NMF_MARKER_IMAGE_BLUE
        }
        
        self.presentingViewController?.dismiss(animated: true, completion: nil)
        print(markerStatus)
    }
    @IBAction func touchUpDismiss(_ sender: Any) {
        if markerStatus {
            popupMarker.iconImage = NMapsMap.NMF_MARKER_IMAGE_BLUE
        }else{
            popupMarker.iconImage = NMapsMap.NMF_MARKER_IMAGE_PINK
        }
        self.dismiss(animated: true, completion: nil)
    }
}
