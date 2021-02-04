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
    
    @IBOutlet weak var popUpView: UIView!{
        didSet{
            popUpView.makeRounded(cornerRadius: 25.0)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchUpDismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        popupMarker.iconImage = NMapsMap.NMF_MARKER_IMAGE_PINK
    }
}
