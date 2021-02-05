//
//  CourseCompleteVC.swift
//  Chadri-iOS
//
//  Created by 이원석 on 2021/02/05.
//

import UIKit
import NMapsMap

class CourseCompleteVC: UIViewController {

    @IBOutlet weak var completePopUpView: UIView!{
        didSet{
            completePopUpView.makeRounded(cornerRadius: 25.0)
        }
    }
    @IBOutlet weak var completeMap: NMFMapView!
    @IBOutlet weak var courseNameTextField: UITextField!{
        didSet{
            courseNameTextField.makeRounded(cornerRadius: 10.0)
            courseNameTextField.addLeftPadding()
            courseNameTextField.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func alertForm(title: String, message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            // Alert의 '확인'을 누르면 dismiss
            let okAction = UIAlertAction(title: "확인",style: .default) { (action) in
                alert.dismiss(animated: true, completion: nil)
            }
            alert.addAction(okAction)
            present(alert, animated: true)
        }

    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func submit(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        alertForm(title: "차키 챙기시죠", message: "그럼 이제 떠나 볼까요?")
    }
    
}

extension CourseCompleteVC : UITextFieldDelegate{
    ///Return 눌렀을 때 키보드 내리기
      func textFieldShouldReturn(_ textField: UITextField) -> Bool {
          textField.resignFirstResponder()
          return true
      }
      
      ///화면 터치시 키보드 내리기
      override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
          self.view.endEditing(true)
      }
}
