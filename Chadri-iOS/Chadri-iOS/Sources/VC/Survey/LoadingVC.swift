//
//  LoadingVC.swift
//  Chadri-iOS
//
//  Created by 이원석 on 2021/02/05.
//

import UIKit

class LoadingVC: UIViewController {
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        
        self.view.layoutIfNeeded()
        //        self.logoImageView.alpha = 0.0
        
        
        UIView.animate(withDuration: 2.0, animations:
                        {
                            self.logoImageView.transform = CGAffineTransform(rotationAngle: .pi)
                            self.view.layoutIfNeeded()
                        },completion: {finished in
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                let storyboard = UIStoryboard(name: "CourseDetail", bundle: nil)
                                if let dvc = storyboard.instantiateViewController(identifier: "CourseDetailVC") as? CourseDetailVC {
                                    self.navigationController?.pushViewController(dvc, animated: true)
                                }
                            }
                        })
    }
    
}
