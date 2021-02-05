//
//  SecondSurvey.swift
//  Chadri-iOS
//
//  Created by 이원석 on 2021/02/05.
//

import UIKit

class SecondSurvey: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        // Do any additional setup after loading the view.
    }
    

    @IBAction func firstBtnAct(_ sender: Any) {
        if let dvc = self.storyboard?.instantiateViewController(identifier: "ThirdSurvey") as? ThirdSurvey {
            self.navigationController?.pushViewController(dvc, animated: true)
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

}
