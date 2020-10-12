//
//  reframingDiaryViewController.swift
//  originalProduct
//
//  Created by 伊藤明孝 on 2020/10/09.
//
import UIKit
import RealmSwift

class reframingDiaryViewController: UIViewController {

    //addDiaryViewControllerから受け取る値
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
        // (1)Realmインスタンスの生成
        
        let realm = try! Realm()
        
        
        
        // (2)クエリによるデータの取得
        var todayEvent = realm.objects(Diary.self).filter("date = %@", receiveSecondValue!).first
        
        
        // (3)データの更新
        try! realm.write({
            todayEvent!.reframing = reframingTextView.text!
        })
        //2つ前の画面に戻ることのできる方法
        navigationController?.popToViewController(navigationController!.viewControllers[0], animated: true)
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
