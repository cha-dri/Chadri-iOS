//
//  UITextField+Extension.swift
//  Chadri-iOS
//
//  Created by  on 2021/02/06.
//

import Foundation
import UIKit

extension UITextField{
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
}
