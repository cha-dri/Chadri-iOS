//
//  ChadriTabBarController.swift
//  Chadri-iOS
//
//  Created by 이원석 on 2021/02/05.
//

import UIKit

class ChadriTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
    
    
    // MARK: - 탭바 만드는 함수
    
    func setTabBar() {
        
        self.tabBar.tintColor = UIColor.black
        
        /// 메인탭
        let ChadriMain = UIStoryboard.init(name: "Main", bundle: nil)
        guard let firstTab = ChadriMain.instantiateViewController(identifier: "MainNC")
                as? MainNC  else {
            return
        }
        firstTab.tabBarItem.image = UIImage(systemName:  "house")?.withAlignmentRectInsets(UIEdgeInsets(top: 9, left: 0, bottom: -8.5, right: 0))
        firstTab.tabBarItem.selectedImage = UIImage(systemName:  "house.fill")?.withAlignmentRectInsets(UIEdgeInsets(top: 9, left: 0, bottom: -8.5, right: 0))
        
        
        
        /// 코스 빌드 탭
        let CourseBuild = UIStoryboard.init(name: "CourseBuild", bundle: nil)
        guard let secondTab = CourseBuild.instantiateViewController(identifier: "CourseBuildNC")
                as? CourseBuildNC  else {
            return
        }
        secondTab.tabBarItem.image = UIImage(systemName:  "car")?.withAlignmentRectInsets(UIEdgeInsets(top: 9, left: 0, bottom: -8.5, right: 0))
        secondTab.tabBarItem.selectedImage = UIImage(systemName:  "car.fill")?.withAlignmentRectInsets(UIEdgeInsets(top: 9, left: 0, bottom: -8.5, right: 0))
        
    
        
        /// 코스 구경 탭
        let CourseSee = UIStoryboard.init(name: "CourseSee", bundle: nil)
        guard let thirdTab = CourseSee.instantiateViewController(identifier: "CourseSeeNC")
                as? CourseSeeNC  else {
            return
        }
        thirdTab.tabBarItem.image = UIImage(systemName:  "eyes")?.withAlignmentRectInsets(UIEdgeInsets(top: 9, left: 0, bottom: -8.5, right: 0))
        thirdTab.tabBarItem.selectedImage = UIImage(systemName: "eyes.inverse")?.withAlignmentRectInsets(UIEdgeInsets(top: 9, left: 0, bottom: -8.5, right: 0))
        
        
        
        /// 마이페이지탭
        let MyPage = UIStoryboard.init(name: "MyPage", bundle: nil)
        guard let fourthTab = MyPage.instantiateViewController(identifier: "MyPageNC")
                as? MyPageNC  else {
            return
        }
        
        fourthTab.tabBarItem.image = UIImage(systemName: "person")?.withAlignmentRectInsets(UIEdgeInsets(top: 9, left: 0, bottom: -8.5, right: 0))
        fourthTab.tabBarItem.selectedImage = UIImage(systemName: "person.fill")?.withAlignmentRectInsets(UIEdgeInsets(top: 9, left: 0, bottom: -8.5, right: 0))
        
        
        let tabs =  [firstTab, secondTab, thirdTab, fourthTab]
        
        tabBar.layer.shadowOpacity = 0
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.barTintColor = .white
        tabBar.tintColor = .chadriGreen
        self.setViewControllers(tabs, animated: false)
    }
}

