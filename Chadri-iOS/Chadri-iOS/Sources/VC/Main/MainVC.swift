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
            lookingCV.register(CourseRecommendCVCell.nib(), forCellWithReuseIdentifier: CourseRecommendCVCell.identifier)
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
    
    var looking : [Recommend] = []
    var recommend : [Recommend] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func setData() {
        looking.append(contentsOf: [
            Recommend(imageName: "Chadri_Logo", concept: "", title: "", content: "", writer: "", keyword1: "", keyword2: "", time: "", mapImageName: "", postingImageName: ""),
            Recommend(imageName: "sample01_Thumb", concept: "# 신비한 이유", title: "강물을 거슬러오르는 연어처럼 드라이브", content: "흐르는 강물을 거슬러 오르는 저 힘찬 연어들 처럼 강물을 거슬러 올라가보았습니다. 새벽에 달려서 차도없고 시원시원하게 달리고 스트레스 풀고왔습니다.", writer: "- 강산에", keyword1: "스트레스해소", keyword2: "연어조아", time: "34분", mapImageName: "sample1", postingImageName: "groomsan"),
            Recommend(imageName: "sample02_Thumb", concept: "# 바꿔줄생각없어, 돌아가", title: "여기 어떻게 나가요??? ㅜㅜ", content: "잘못들어왔어요 누가 여기서 좀 꺼내줘요 ㅠㅠ", writer: "- 도로위의 엘리스", keyword1: "자율주행", keyword2: "2시간", time: "43분", mapImageName: "sample2", postingImageName: "yongin"),
            Recommend(imageName: "sample03_Thumb", concept: "# 드리프트의 호흡 제 1장", title: "합격률 100% 귀살대 합격필승법 공유합니다.", content: "죄송합니다. 면허따고 첫 운전 면허 코스보여드리고 싶었습니다.", writer: "- 탄지로", keyword1: "초보운전", keyword2: "안전운전", time: "1시간 1분", mapImageName: "sample3", postingImageName: "simwoojang"),
            Recommend(imageName: "sample04_Thumb", concept: "# 전원일기", title: "등산하고 왔습니다.", content: "등산하고 운전하면서 돌아올때 피곤해서 죽을뻔 했습니다. 여러분 아무리 달려도달려도 목적지가 보이지 않았어요.", writer: "- 전원달인", keyword1: "자동차로", keyword2: "ㄷ", time: "1시간 8분", mapImageName: "sample4", postingImageName: "chungangroad")
        ])
        
        recommend.append(contentsOf: [
            Recommend(imageName: "sample01_Thumb", concept: "# 신비한 이유", title: "강물을 거슬러오르는 연어처럼 드라이브", content: "흐르는 강물을 거슬러 오르는 저 힘찬 연어들 처럼 강물을 거슬러 올라가보았습니다. 새벽에 달려서 차도없고 시원시원하게 달리고 스트레스 풀고왔습니다.", writer: "- 강산에", keyword1: "스트레스해소", keyword2: "연어조아", time: "34분", mapImageName: "sample1", postingImageName: "groomsan"),
            Recommend(imageName: "sample02_Thumb", concept: "# 바꿔줄생각없어, 돌아가", title: "여기 어떻게 나가요??? ㅜㅜ", content: "잘못들어왔어요 누가 여기서 좀 꺼내줘요 ㅠㅠ", writer: "- 도로위의 엘리스", keyword1: "자율주행", keyword2: "2시간", time: "43분", mapImageName: "sample2", postingImageName: "yongin"),
            Recommend(imageName: "sample03_Thumb", concept: "# 드리프트의 호흡 제 1장", title: "합격률 100% 귀살대 합격필승법 공유합니다.", content: "죄송합니다. 면허따고 첫 운전 면허 코스보여드리고 싶었습니다.", writer: "- 탄지로", keyword1: "초보운전", keyword2: "안전운전", time: "1시간 1분", mapImageName: "sample3", postingImageName: "simwoojang"),
            Recommend(imageName: "sample04_Thumb", concept: "# 전원일기", title: "등산하고 왔습니다.", content: "등산하고 운전하면서 돌아올때 피곤해서 죽을뻔 했습니다. 여러분 아무리 달려도달려도 목적지가 보이지 않았어요.", writer: "- 전원달인", keyword1: "자동차로", keyword2: "ㄷ", time: "1시간 8분", mapImageName: "sample4", postingImageName: "chungangroad")
        ])
    }
}

extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == lookingCV{
            if indexPath.row == 0 {
                let storyboard = UIStoryboard(name: "Survey", bundle: nil)
                if let dvc = storyboard.instantiateViewController(identifier: "FirstSurvey") as? FirstSurvey {
                    self.navigationController?.pushViewController(dvc, animated: true)
                }
            }else{
                let storyboard = UIStoryboard(name: "CourseDetail", bundle: nil)
                if let dvc = storyboard.instantiateViewController(identifier: "CourseDetailVC") as? CourseDetailVC {
                
                    dvc.courseImageName = looking[indexPath.row].mapImageName
                    dvc.writer = looking[indexPath.row].writer
                    dvc.titleName = looking[indexPath.row].title
                    dvc.contents = looking[indexPath.row].content
                    dvc.keyword1 = looking[indexPath.row].keyword1
                    dvc.keyword2 = looking[indexPath.row].keyword2
                    dvc.time = looking[indexPath.row].time
                    dvc.postingImageName = looking[indexPath.row].postingImageName
                    self.navigationController?.pushViewController(dvc, animated: true)
                }
            }
            
            
        }else if collectionView == recommendCV{
            let storyboard = UIStoryboard(name: "CourseDetail", bundle: nil)
            if let dvc = storyboard.instantiateViewController(identifier: "CourseDetailVC") as? CourseDetailVC {
                self.navigationController?.pushViewController(dvc, animated: true)
            }
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == lookingCV{
            return looking.count
        }else{
            return recommend.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == lookingCV{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CourseRecommendCVCell", for: indexPath) as? CourseRecommendCVCell else {
                return UICollectionViewCell()
            }
            cell.setRecommendData(imageName: looking[indexPath.row].imageName, placeName: looking[indexPath.row].concept)
            return cell
        }else{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CourseRecommendCVCell", for: indexPath) as? CourseRecommendCVCell else {
                return UICollectionViewCell()
            }
            
            cell.setRecommendData(imageName: recommend[indexPath.row].imageName, placeName: recommend[indexPath.row].concept)
            return cell
        }
    }
    
    
}

extension MainVC: UICollectionViewDelegateFlowLayout {
    
    // Cell 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        if collectionView == lookingCV {
            return CGSize(width: 150, height:180)
        }else if collectionView == recommendCV {
            return CGSize(width: 150, height: 180)
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
