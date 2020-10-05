//
//  AddDiaryViewController.swift
//  originalProduct
//
//  Created by 伊藤明孝 on 2020/10/05.
//

import UIKit

class AddDiaryViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
//パーツの宣言
   @IBOutlet weak var titleTexitField: UITextField!
   @IBOutlet weak var detailTextView: UITextView!
   
   override func viewDidLoad() {
       super.viewDidLoad()
       
       titleTexitField.delegate = self
       detailTextView.delegate = self

   }
  
   
   // MARK: - TextField Delegate
   //リターンキーが押された時に実行する
   func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       // UITextField のファーストレスポンダをやめる（その結果、キーボードが非表示になる）
       textField.resignFirstResponder()
       return true
   }
   
   // MARK: - TextView Delegate
    //編集が終了する直前に呼ばれるメソッド
   func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
       textView.resignFirstResponder()
       return true
   }
   
   @IBAction func save() {
    
   }
}
