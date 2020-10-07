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

class CalendarViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource {

   
   //パーツの宣言
   @IBOutlet weak var calendar: FSCalendar!
   @IBOutlet var degreeOfEnrichmentLabel: UILabel!
   
    
   
   override func viewDidLoad() {
       super.viewDidLoad()
    //デリゲートの処理
           calendar.delegate = self
           calendar.dataSource = self
      
   }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
  
    @IBAction func sliderValue(_ sender: UISlider){
        
    }
    
    @IBAction func checkButton(){
        
    }
    
    @IBAction func addWriteButton(){
        
    }
}
