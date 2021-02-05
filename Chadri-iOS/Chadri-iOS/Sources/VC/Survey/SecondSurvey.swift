//
//  SecondSurvey.swift
//  Chadri-iOS
//
//  Created by 이원석 on 2021/02/05.
//

import UIKit

class SecondSurvey: UIViewController {

    @IBOutlet weak var firstBtn: UIButton!{
        didSet{
            firstBtn.makeRounded(cornerRadius: 5.0)
        }
    }
    @IBOutlet weak var secondBtn: UIButton!{
        didSet{
            secondBtn.makeRounded(cornerRadius: 5.0)
        }
    }
    @IBOutlet weak var thirdBtn: UIButton!{
        didSet{
            thirdBtn.makeRounded(cornerRadius: 5.0)
        }
    }
    @IBOutlet weak var fourthBtn: UIButton!{
        didSet{
            fourthBtn.makeRounded(cornerRadius: 5.0)
        }
    }
    
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
   
    @IBAction func secondBtnAct(_ sender: Any) {
        if let dvc = self.storyboard?.instantiateViewController(identifier: "ThirdSurvey") as? ThirdSurvey {
            self.navigationController?.pushViewController(dvc, animated: true)
        }
    }
    
    @IBAction func thirdBtnAct(_ sender: Any) {
        if let dvc = self.storyboard?.instantiateViewController(identifier: "ThirdSurvey") as? ThirdSurvey {
            self.navigationController?.pushViewController(dvc, animated: true)
        }
    }
    
    @IBAction func fourthBtnAct(_ sender: Any) {
        if let dvc = self.storyboard?.instantiateViewController(identifier: "ThirdSurvey") as? ThirdSurvey {
            self.navigationController?.pushViewController(dvc, animated: true)
        }
    }
}
