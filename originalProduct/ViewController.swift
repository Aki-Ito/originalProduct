//
//  ViewController.swift
//  originalProduct
//
//  Created by 伊藤明孝 on 2020/10/05.
//

import UIKit
import Realm
import RealmSwift

class ViewController: UIViewController {

    
    @IBOutlet var backgroundLabel : UILabel!
    @IBOutlet var useageLabel : UILabel!
    @IBOutlet var explanationLabel : UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        backgroundLabel.layer.cornerRadius = 10
        backgroundLabel.clipsToBounds = true
        explanationLabel.numberOfLines = 0;
        
        explanationLabel.text = "・まずカレンダーの日付を選択"+"\n"+"\n"+"\n"+"\n"+"・良い所と悪い所を時間内に記入"+"\n"+"\n"+"\n"+"\n"+"・悪い所をポジティブな言葉に変える"+"\n"+"\n"+"\n"+"\n"+"・今日の充実度をチェック"+"\n"+" (カレンダー上で色が変わります)"
    }


}

