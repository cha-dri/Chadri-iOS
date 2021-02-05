//
//  MyPageVC.swift
//  Chadri-iOS
//
//  Created by 이원석 on 2021/02/05.
//

import UIKit

class MyPageVC: UIViewController {

    @IBOutlet weak var myPageCV: UICollectionView!{
        didSet{
            myPageCV.register(MyCVCell.nib(), forCellWithReuseIdentifier: MyCVCell.identifier)
            myPageCV.delegate = self
            myPageCV.dataSource = self
        }
    }
    @IBOutlet weak var headerView: UIView!{
        didSet{
            headerView.dropShadow(color: .gray, offSet: CGSize(width: 0, height: 0), opacity: 0.7, radius: 4)
        }
    }
    
    var mypage : [Course] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setData()
        // Do any additional setup after loading the view.
    }
    
    func setData() {
        mypage.append(contentsOf: [
            Course(imageName: "sample1", courseName: "첫번째코스", writerName: "차들님의", keyword: "경치좋은", time: "1시간"),
            Course(imageName: "sample1", courseName: "두번째코스", writerName: "소라개님의", keyword: "시원한", time: "30분"),
            Course(imageName: "sample1", courseName: "세번째코스", writerName: "차박이좋아님의", keyword: "낭만", time: "45분"),
            Course(imageName: "sample1", courseName: "네번째코스", writerName: "내일은드라이브님의", keyword: "광기", time: "2시간"),
        ])
        
    }
}

extension MyPageVC : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mypage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCVCell", for: indexPath) as? MyCVCell else {
            return UICollectionViewCell()
        }
        
        cell.setMyData(imageName: mypage[indexPath.row].imageName, courseName: mypage[indexPath.row].courseName, writerName: mypage[indexPath.row].writerName, keyword: mypage[indexPath.row].keyword, time: mypage[indexPath.row].time)
        
        return cell
    }
}

extension MyPageVC: UICollectionViewDelegateFlowLayout {
    
    // Cell 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        
        return CGSize(width: 340, height: 240)
    }
       
    //Cell간의 위아래 간격지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return 20
    }
    
    //Cell간의 좌우간격 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
       return 0
    }
    
    // 마진
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 20, left: 15, bottom: 0, right: 15)
    }
}

