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
    
    var mypage : [Course] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setData()
        // Do any additional setup after loading the view.
    }
    
    func setData() {
        mypage.append(contentsOf: [
            Course(imageName: "sample1", courseName: "첫번째코스", writerName: "차들"),
            Course(imageName: "sample1", courseName: "두번째코스", writerName: "차들"),
            Course(imageName: "sample1", courseName: "세번째코스", writerName: "차들"),
            Course(imageName: "sample1", courseName: "네번째코스", writerName: "차들"),
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
        cell.setMyData(imageName: mypage[indexPath.row].imageName, courseName: mypage[indexPath.row].courseName, writerName: mypage[indexPath.row].writerName)
        
        return cell
    }
}

extension MyPageVC: UICollectionViewDelegateFlowLayout {
    
    // Cell 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        
        return CGSize(width: 320, height: 240)
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
        return UIEdgeInsets(top: 20, left: (view.frame.width - 320)/2, bottom: 0, right: (view.frame.width - 320)/2)
    }
}

