//
//  CourseDetailVC.swift
//  Chadri-iOS
//
//  Created by 이원석 on 2021/02/05.
//

import UIKit

class CourseDetailVC: UIViewController {

    @IBOutlet weak var writeNameLabel: UILabel!{
        didSet{
            writeNameLabel.makeRounded(cornerRadius: 8.0)
        }
    }
    @IBOutlet weak var keywordLabel: UILabel!{
        didSet{
            keywordLabel.makeRounded(cornerRadius: 10.0)
        }
    }
    @IBOutlet weak var secondKeywordLabel: UILabel!{
        didSet{
            secondKeywordLabel.makeRounded(cornerRadius: 10.0)
        }
    }
    @IBOutlet weak var thirdKeywordLabel: UILabel!{
        didSet{
            thirdKeywordLabel.makeRounded(cornerRadius: 10.0)
        }
    }
    @IBOutlet weak var timeLabel: UILabel!{
        didSet{
            timeLabel.makeRounded(cornerRadius: 10.0)
        }
    }
    @IBOutlet weak var goDriveBtn: UIButton!{
        didSet{
            goDriveBtn.makeRounded(cornerRadius: 20.0)
        }
    }
    @IBOutlet weak var playListBtn: UIButton!{
        didSet{
            playListBtn.makeRounded(cornerRadius: 20.0)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }

}
