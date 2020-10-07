//
//  AddDiaryViewController.swift
//  originalProduct
//
//  Created by 伊藤明孝 on 2020/10/05.
//

import UIKit
import RealmSwift

class AddDiaryViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
//パーツの宣言
   @IBOutlet weak var goodPointTextView: UITextView!
   @IBOutlet weak var badPointTextView: UITextView!
   
   override func viewDidLoad() {
       super.viewDidLoad()
            
       goodPointTextView.delegate = self
       badPointTextView.delegate = self

   }
  
   
   // MARK: - TextField Delegate
  
   
   // MARK: - TextView Delegate
    //編集が終了する直前に呼ばれるメソッド
   func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
       textView.resignFirstResponder()
       return true
   }
   
    @IBAction func save() {
        //Diaryクラスのインスタンス作成
        let newDiary = Diary()
        //textViewの文章を代入する
        newDiary.goodPoint = goodPointTextView.text!
        newDiary.badPoint = badPointTextView.text!
        
        //インスタンスをrealmに保存する
        do {
            let realm = try Realm()
            try realm.write({ () -> Void in
                realm.add(newDiary)
            })
        }catch{
            
        }
        
    }
}
