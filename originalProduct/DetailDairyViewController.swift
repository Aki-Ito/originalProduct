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
    
   //テキストビューに枠線をつける
    goodDetailTextView.layer.borderColor = UIColor.lightGray.cgColor
    badDetailTextView.layer.borderColor = UIColor.lightGray.cgColor
    reframingTextView.layer.borderColor = UIColor.lightGray.cgColor
    //枠線の太さ
    goodDetailTextView.layer.borderWidth = 0.5
    badDetailTextView.layer.borderWidth = 0.5
    reframingTextView.layer.borderWidth = 0.5
    //枠を角丸にする方法
    goodDetailTextView.layer.cornerRadius = 10.0
    badDetailTextView.layer.cornerRadius = 10.0
    reframingTextView.layer.cornerRadius = 10.0
    
    goodDetailTextView.layer.masksToBounds = true
    badDetailTextView.layer.masksToBounds = true
    reframingTextView.layer.masksToBounds = true
   }
    

}
