//
//  LoadingVC.swift
//  Chadri-iOS
//
//  Created by 이원석 on 2021/02/05.
//

import UIKit

class LoadingVC: UIViewController {
    
    @IBOutlet weak var logoImageView: UIImageView!
    var looking : [Recommend] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        let num = Int.random(in: 0...4)
        setData()
        super.viewDidAppear(animated)
        self.view.layoutIfNeeded()
        
        
        UIView.animate(withDuration: 2.0, animations:
                        {
                            self.logoImageView.transform = CGAffineTransform(rotationAngle: .pi)
                            self.view.layoutIfNeeded()
                        },completion: {finished in
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                let storyboard = UIStoryboard(name: "CourseDetail", bundle: nil)
                                if let dvc = storyboard.instantiateViewController(identifier: "CourseDetailVC") as? CourseDetailVC {
                
                                    dvc.courseImageName = self.looking[num].mapImageName
                                    dvc.writer = self.looking[num].writer
                                    dvc.titleName = self.looking[num].title
                                    dvc.contents = self.looking[num].content
                                    dvc.keyword1 = self.looking[num].keyword1
                                    dvc.keyword2 = self.looking[num].keyword2
                                    dvc.time = self.looking[num].time
                                    dvc.postingImageName = self.looking[num].postingImageName
                                    self.navigationController?.pushViewController(dvc, animated: true)
                                }
                            }
                        })
    }
    
    func setData(){
        
        looking.append(contentsOf: [
            Recommend(imageName: "sample01_Thumb", concept: "신비한 이유", title: "강물을 거슬러오르는 연어처럼 드라이브", content: "흐르는 강물을 거슬러 오르는 저 힘찬 연어들 처럼 강물을 거슬러 올라가보았습니다. 새벽에 달려서 차도없고 시원시원하게 달리고 스트레스 풀고왔습니다.", writer: "- 강산에", keyword1: "스트레스해소", keyword2: "연어조아", time: "34분", mapImageName: "sample1", postingImageName: "groomsan"),
            Recommend(imageName: "sample02_Thumb", concept: "바꿔줄생각없어, 돌아가", title: "여기 어떻게 나가요??? ㅜㅜ", content: "잘못들어왔어요 누가 여기서 좀 꺼내줘요 ㅠㅠ", writer: "- 도로위의 엘리스", keyword1: "자율주행", keyword2: "2시간", time: "43분", mapImageName: "sample2", postingImageName: "yongin"),
            Recommend(imageName: "sample03_Thumb", concept: "드리프트의 호흡 제 1장", title: "합격률 100% 귀살대 합격필승법 공유합니다.", content: "죄송합니다. 면허따고 첫 운전 면허 코스보여드리고 싶었습니다.", writer: "- 탄지로", keyword1: "초보운전", keyword2: "안전운전", time: "1시간 1분", mapImageName: "sample3", postingImageName: "simwoojang"),
            Recommend(imageName: "sample04_Thumb", concept: "전원일기", title: "등산하고 왔습니다.", content: "등산하고 운전하면서 돌아올때 피곤해서 죽을뻔 했습니다. 여러분 아무리 달려도달려도 목적지가 보이지 않았어요.", writer: "- 전원달인", keyword1: "자동차로", keyword2: "ㄷ", time: "1시간 8분", mapImageName: "sample4", postingImageName: "chungangroad")
        ])
    }
    
}
