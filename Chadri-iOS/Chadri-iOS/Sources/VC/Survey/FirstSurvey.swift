//
//  FirstSurvey.swift
//  Chadri-iOS
//
//  Created by 이원석 on 2021/02/05.
//

import UIKit

class FirstSurvey: UIViewController {

    @IBOutlet weak var firstBtn: UIButton!
    @IBOutlet weak var secondBtn: UIButton!
    @IBOutlet weak var thirdBtn: UIButton!
    @IBOutlet weak var fourthBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func secondBtnAct(_ sender: Any) {
        
        if let dvc = self.storyboard?.instantiateViewController(identifier: "SecondSurvey") as? SecondSurvey {
            self.navigationController?.pushViewController(dvc, animated: true)
        }
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
