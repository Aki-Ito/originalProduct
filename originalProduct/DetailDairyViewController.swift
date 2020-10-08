//
//  DetailDairyViewController.swift
//  originalProduct
//
//  Created by 伊藤明孝 on 2020/10/05.
//

import UIKit
import Realm
import RealmSwift

class DetailDairyViewController: UIViewController {
   //CalenderViewControllerから受け取る日付の値
    var receiveValue : Date?

   
   @IBOutlet weak var goodDetailTextView: UITextView!
   @IBOutlet weak var badDetailTextView: UITextView!

   override func viewDidLoad() {
       super.viewDidLoad()
   
    
    let dateFormatter = DateFormatter()
    // dateFormatter.dateFormat = "dd/MM/yyyy"
    dateFormatter.dateFormat = "d MMM yyyy"
    let stringDate = dateFormatter.string(from: receiveValue)

    var todayEvent = realm.objects(Diary.self).filter("date = '\(stringDate)'").sorted(byKeyPath: "venue", ascending: true)

      
   }
   

}
