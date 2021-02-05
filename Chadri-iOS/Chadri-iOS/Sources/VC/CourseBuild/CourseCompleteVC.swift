//
//  CourseCompleteVC.swift
//  Chadri-iOS
//
//  Created by 이원석 on 2021/02/05.
//

import UIKit
import NMapsMap

class CourseCompleteVC: UIViewController {

    @IBOutlet weak var completePopUpView: UIView!{
        didSet{
            completePopUpView.makeRounded(cornerRadius: 25.0)
        }
    }
    @IBOutlet weak var completeMap: NMFMapView!
    @IBOutlet weak var courseNameTextField: UITextField!{
        didSet{
            courseNameTextField.makeRounded(cornerRadius: 10.0)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func submit(_ sender: Any) {
        // id 값으로 post 통신
    }
    
}
