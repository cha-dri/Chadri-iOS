//
//  ThirdSurvey.swift
//  Chadri-iOS
//
//  Created by 이원석 on 2021/02/05.
//

import UIKit

class ThirdSurvey: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func thirdBtnAct(_ sender: Any) {
        if let dvc = self.storyboard?.instantiateViewController(identifier: "FourthSurvey") as? FourthSurvey {
            self.navigationController?.pushViewController(dvc, animated: true)
        }
    }
  
}
