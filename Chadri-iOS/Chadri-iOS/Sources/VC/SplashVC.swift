//
//  SplashVC.swift
//  Chadri-iOS
//
//  Created by 이원석 on 2021/02/05.
//

import UIKit

class SplashVC: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool)
        {
           super.viewDidAppear(animated)

           self.view.layoutIfNeeded()
           self.logoImageView.alpha = 0.0

            UIView.animate(withDuration: 2.0, animations:
           {
               self.logoImageView.alpha = 1.0
               self.view.layoutIfNeeded()
           },completion: {finished in
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                let vc = (self.storyboard?.instantiateViewController(identifier: "ChadriTabBarController"))! as ChadriTabBarController
                
                self.navigationController?.pushViewController(vc, animated: false)
            }
           })
        }

}
