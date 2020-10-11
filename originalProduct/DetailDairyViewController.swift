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
    var todayEvent: Results<Diary>!
   
    
   
   @IBOutlet weak var goodDetailTextView: UITextView!
   @IBOutlet weak var badDetailTextView: UITextView!
   @IBOutlet weak var reframingTextView: UITextView!

   override func viewDidLoad() {
       super.viewDidLoad()
   
    let realm = try! Realm()
    var todayEvent = realm.objects(Diary.self).filter("date = %@", receiveValue!)
    
    goodDetailTextView.text = todayEvent.last?.goodPoint
    badDetailTextView.text = todayEvent.last?.badPoint
    reframingTextView.text = todayEvent.last?.reframing
    
   
   }
    

}
