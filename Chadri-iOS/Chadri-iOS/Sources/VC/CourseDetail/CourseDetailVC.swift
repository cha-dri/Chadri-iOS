//
//  CourseDetailVC.swift
//  Chadri-iOS
//
//  Created by 이원석 on 2021/02/05.
//

import UIKit

class CourseDetailVC: UIViewController {
    
    var courseImageName : String = "sample1"
    var writer : String = "강산에"
    var titleName : String = "강물을 거슬러오르는 연어처럼 드라이브"
    var contents : String = "흐르는 강물을 거슬러 오르는 저 힘찬 연어들 처럼 강물을 거슬러 올라가보았습니다. 새벽에 달려서 차도없고 시원시원하게 달리고 스트레스 풀고왔습니다."
    var keyword1 : String = "스트레스해소"
    var keyword2 : String = "연어조아"
    var postingImageName : String = "groomsan"
    var time : String = "34분"
    
    @IBOutlet weak var mapImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var postingImageView: UIImageView!
    @IBOutlet weak var writeNameLabel: UILabel!{
        didSet{
            writeNameLabel.makeRounded(cornerRadius: 10.0)
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
        setPostingData()
        // Do any additional setup after loading the view.
    }
   
    func setPostingData(){
        self.mapImageView.image =  UIImage(named: courseImageName)
        self.writeNameLabel.text = writer
        self.titleLabel.text = titleName
        self.contentTextView.text = contents
        self.keywordLabel.text = keyword1
        self.secondKeywordLabel.text = keyword2
        self.timeLabel.text = time
        self.postingImageView.image = UIImage(named: postingImageName)
    }
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }

}
