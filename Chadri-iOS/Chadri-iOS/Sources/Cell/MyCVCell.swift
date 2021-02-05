//
//  MyTVCell.swift
//  Chadri-iOS
//
//  Created by 이원석 on 2021/02/05.
//

import UIKit

class MyCVCell: UICollectionViewCell {
    
    static let identifier = "MyCVCell"
    
    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var writerNameLabel: UILabel!
    @IBOutlet weak var courseImageView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!{
        didSet{
            timeLabel.makeRounded(cornerRadius: 10.0)
        }
    }
    @IBOutlet weak var keywordLabel: UILabel!{
        didSet{
            keywordLabel.makeRounded(cornerRadius: 10.0)
        }
    }
    @IBOutlet weak var wholeView: UIView!{
        didSet{
            wholeView.makeRounded(cornerRadius: 25.0)
            wholeView.backgroundColor = .whiteBlue
        }
    }
    @IBOutlet weak var colorView: UIView!{
        didSet{
            colorView.backgroundColor = .skyBlue
        }
    }
    
    func setMyData(imageName: String, courseName:String, writerName: String, keyword: String, time: String) {
        
        self.courseImageView.image = UIImage(named: imageName)
        self.courseNameLabel.text = courseName
        self.writerNameLabel.text = writerName
        self.timeLabel.text = time
        self.keywordLabel.text = keyword
        
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "MyCVCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
