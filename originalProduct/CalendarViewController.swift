//
//  CalendarViewController.swift
//  originalProduct
//
//  Created by 伊藤明孝 on 2020/10/05.
//

import UIKit
import FSCalendar
import Realm
import RealmSwift

class CalendarViewController: UIViewController {

   var diaryArray: [Diary] = []
   //パーツの宣言
   @IBOutlet weak var calendar: FSCalendar!
   @IBOutlet weak var diaryTitleTableView: UITableView!
   
   override func viewDidLoad() {
       super.viewDidLoad()
       
      
       
   }
  
}
