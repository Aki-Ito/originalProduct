//
//  reframingDiaryViewController.swift
//  originalProduct
//
//  Created by 伊藤明孝 on 2020/10/09.
//

import UIKit
import RealmSwift

class reframingDiaryViewController: UIViewController {

    
    var receiveSecondValue : Date?
    var receiveBadValue : String!
    @IBOutlet weak var reframingTextView : UITextView!
    @IBOutlet var badPointLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        badPointLabel.text = receiveBadValue
        // Do any additional setup after loading the view.
    }
    
    
    

    @IBAction func save() {
        //Diaryクラスのインスタンス作成
        let newDiary = Diary()
        //渡された日付をdateにセットする
        newDiary.date = receiveSecondValue
        //textViewの文章を代入する
        newDiary.reframing = reframingTextView.text!
        
        //インスタンスをrealmに保存する
        do {
            let realm = try Realm()
            try realm.write({ () -> Void in
                realm.add(newDiary)
            })
        }catch{
            
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
