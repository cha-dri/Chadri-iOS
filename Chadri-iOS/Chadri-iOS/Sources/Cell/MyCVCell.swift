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
    @IBOutlet weak var wholeView: UIView!{
        didSet{
            wholeView.makeRounded(cornerRadius: 25.0)
            wholeView.backgroundColor = .whiteBlue
        }
    }
    @IBOutlet weak var colorView: UIView!{
        didSet{
            colorView.backgroundColor = .whiteBlue
        }
    }
    
    func setMyData(imageName: String, courseName:String, writerName: String) {
        
        self.courseImageView.image = UIImage(named: imageName)
        self.courseNameLabel.text = courseName
        self.writerNameLabel.text = writerName
        
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "MyCVCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
