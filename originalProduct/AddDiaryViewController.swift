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
    //受け取る日付の値を入れる変数
    var receiveValue : Date?
    //タイマーに関しての変数
    var timer: Timer = Timer()
    var count : Int!
    
    var badPointHandOver : String!
   
   override func viewDidLoad() {
       super.viewDidLoad()
            
       goodPointTextView.delegate = self
       badPointTextView.delegate = self

   }
    //画面が現れるたびに5分間のタイマーが起動する
    override func viewWillAppear(_ animated: Bool) {
        count = 300
        if !timer.isValid{
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.down), userInfo: nil, repeats: true)
        }
    }
    
    //画面遷移の際の処理 reframingViewControllerに遷移する際の処理
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toReframe" {
            let reframeViewController : reframingDiaryViewController = segue.destination as! reframingDiaryViewController
            reframeViewController.receiveBadValue = self.badPointHandOver
            
            let reframeSecondViewController : reframingDiaryViewController = segue.destination as! reframingDiaryViewController
            reframeSecondViewController.receiveSecondValue = self.receiveValue
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
        count = count - 1
        timerLabel.text = String(count)
        if count < 0&&timer.isValid{
            timer.invalidate()
            //時間が経ったら自動的に画面遷移されるようにする
            self.performSegue(withIdentifier: "toReframe", sender: nil)
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
        
        badPointHandOver = newDiary.badPoint
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
