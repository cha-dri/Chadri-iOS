//
//  CourseRecommendCVCell.swift
//  Chadri-iOS
//
//  Created by 이원석 on 2021/02/05.
//

import UIKit

class CourseRecommendCVCell: UICollectionViewCell {

   static let identifier = "CourseRecommendCVCell"
    
    @IBOutlet weak var recommendImageView: UIImageView!{
        didSet{
            recommendImageView.makeRounded(cornerRadius: 25.0)
//            recommendImageView.dropShadow(color: .black, offSet: CGSize(width: 0, height: -5), opacity: 0.7, radius: 5)
        }
    }
    
    @IBOutlet weak var placeNameLabel: UILabel!
    
    func setRecommendData(imageName: String, placeName: String) {
        self.recommendImageView.image = UIImage(named: imageName)
        self.placeNameLabel.text = placeName
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "CourseRecommendCVCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
