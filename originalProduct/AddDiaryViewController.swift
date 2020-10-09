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
   @IBOutlet var timerLabel: UILabel!
    
    var receiveValue : Date?
    var timer: Timer = Timer()
    var count : Float!
   
   override func viewDidLoad() {
       super.viewDidLoad()
            
       goodPointTextView.delegate = self
       badPointTextView.delegate = self

   }
    //画面が現れるたびに5分間のタイマーが起動する
    override func viewWillAppear(_ animated: Bool) {
        count = 5.0
        if !timer.isValid{
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.down), userInfo: nil, repeats: true)
        }
    }
    
    //画面遷移の際の処理 reframingViewControllerに遷移する際の処理
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toReframe" {
            let reframeViewController : reframingDiaryViewController = segue.destination as! reframingDiaryViewController
            reframeViewController.receiveSecondValue = self.receiveValue
        }
        if timer.isValid {
            timer.invalidate()
        }
    }
  
    //編集が終了する直前に呼ばれるメソッド
   func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
       textView.resignFirstResponder()
       return true
   }
    
    //タイマーが起動している際に実行されるメソッド
    @objc func down(){
        count = count - 0.01
        timerLabel.text = String(format: "%.2f", count)
        if count < 0&&timer.isValid{
            timer.invalidate()
        }
    }
   
    @IBAction func save() {
        //Diaryクラスのインスタンス作成
        let newDiary = Diary()
        //渡された日付をdateにセットする
        newDiary.date = receiveValue
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
