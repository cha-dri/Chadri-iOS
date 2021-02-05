//
//  CourseLookCVCell.swift
//  Chadri-iOS
//
//  Created by 이원석 on 2021/02/05.
//

import UIKit

class CourseLookCVCell: UICollectionViewCell {
    static let identifier = "CourseLookCVCell"
    
    @IBOutlet weak var courseImageView: UIImageView! //{
//        didSet{
//            courseImageView.makeRounded(cornerRadius: 25.0)
//        }
//    }
//    @IBOutlet weak var courseNameLabel: UILabel!
//    @IBOutlet weak var writerNameLabel: UILabel!
    
//    func setLookData(imageName: String, courseName: String, writerName: String) {
//
//        self.courseImageView.image = UIImage(named: imageName)
//        self.courseNameLabel.text = courseName
//        self.writerNameLabel.text = writerName
//
//    }
    
    static func nib() -> UINib {
        return UINib(nibName: "CourseLookCVCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
