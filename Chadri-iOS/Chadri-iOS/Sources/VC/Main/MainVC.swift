//
//  MainVC.swift
//  Chadri-iOS
//
//  Created by 이원석 on 2021/02/04.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var lookingCV: UICollectionView!{
        didSet{
            lookingCV.register(CourseLookCVCell.nib(), forCellWithReuseIdentifier: CourseLookCVCell.identifier)
            lookingCV.delegate = self
            lookingCV.dataSource = self
        }
    }
    @IBOutlet weak var recommendCV: UICollectionView!{
        didSet{
            recommendCV.register(CourseRecommendCVCell.nib(), forCellWithReuseIdentifier: CourseRecommendCVCell.identifier)
            recommendCV.delegate = self
            recommendCV.dataSource = self
        }
    }
    @IBOutlet weak var mainHeadrView: UIView!{
        didSet{
            mainHeadrView.dropShadow(color: .gray, offSet: CGSize(width: 0, height: 0), opacity: 0.7, radius: 4)
        }
    }
    
    var looking : [Course] = []
    var recommend : [Recommend] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
    }
    
    func setData() {
//        looking.append(contentsOf: [
//            Course(imageName: "sample1", courseName: "첫번째코스", writerName: "차들"),
//            Course(imageName: "sample1", courseName: "두번째코스", writerName: "차들"),
//            Course(imageName: "sample1", courseName: "세번째코스", writerName: "차들"),
//            Course(imageName: "sample1", courseName: "네번째코스", writerName: "차들"),
//        ])
        
        recommend.append(contentsOf: [
            Recommend(imageName: "sample1", placeName: "맥주축제"),
            Recommend(imageName: "sample1", placeName: "낮잠축제"),
            Recommend(imageName: "sample1", placeName: "멍때리기축제"),
            Recommend(imageName: "sample1", placeName: "가만히있기축제"),
            Recommend(imageName: "sample1", placeName: "아무것도안하기축제")
        ])
    }
}

extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //let selectCell = looking[indexPath.row]
        let storyboard = UIStoryboard(name: "Survey", bundle: nil)
        
        if let dvc = storyboard.instantiateViewController(identifier: "FirstSurvey") as? FirstSurvey {
            self.navigationController?.pushViewController(dvc, animated: true)
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == lookingCV{
            return 1
        }else{
            return recommend.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == lookingCV{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CourseLookCVCell", for: indexPath) as? CourseLookCVCell else {
                return UICollectionViewCell()
            }
            
//            cell.setLookData(imageName: looking[indexPath.row].imageName, courseName: looking[indexPath.row].courseName, writerName: looking[indexPath.row].writerName)
            return cell
        }else{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CourseRecommendCVCell", for: indexPath) as? CourseRecommendCVCell else {
                return UICollectionViewCell()
            }
            
            cell.setRecommendData(imageName: recommend[indexPath.row].imageName, placeName: recommend[indexPath.row].placeName)
            return cell
        }
    }
    
    
}

extension MainVC: UICollectionViewDelegateFlowLayout {
    
    // Cell 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        if collectionView == lookingCV {
            return CGSize(width: view.frame.width-40, height: view.frame.height-20)
        }else if collectionView == recommendCV {
            return CGSize(width: 184, height: 136)
        }else{
            return CGSize(width: 0, height: 0)
        }
       
        
    }
    
    //Cell간의 위아래 간격지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return 24
    }
    
    //Cell간의 좌우간격 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        if collectionView == lookingCV {
            return 20
        }else if collectionView == recommendCV{
            return 16
        }else{
            return 0
        }
        
    }
    
    // 마진
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        if collectionView == lookingCV {
            return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        }else{
            return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        }
    }
}
