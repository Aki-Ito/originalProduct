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
    @IBOutlet var sliderValueLabel: UILabel!
    
    var daySelect: Date?
    
   
    //最初に表示される時の処理
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        //デリゲートの処理
        calendar.delegate = self
        calendar.dataSource = self
        
    }
    //画面遷移の際の処理　
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddViewController" {
            let addDiaryViewController: AddDiaryViewController = segue.destination as! AddDiaryViewController
            addDiaryViewController.receiveValue = calendar.selectedDate
        }
        
        if segue.identifier == "toDetail" {
            let detailDiaryViewController: DetailDairyViewController = segue.destination as! DetailDairyViewController
            detailDiaryViewController.receiveValue = calendar.selectedDate
        }
    }
    
    
    //カレンダー処理
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition){
        daySelect = calendar.selectedDate
    }
    
    //スライダーに関しての取り扱い
    @IBAction func sliderValue(_ sender : UISlider){
        let sliderValueFixed:Int = Int(sender.value)
        sliderValueLabel.text = String(sliderValueFixed)
    }
    
    @IBAction func checkButton(){
        
    }
    //今日の充実度を保存してカレンダー上での表記を変える
    @IBAction func checkEnrichment(){
        
        
        // (1)Realmインスタンスの生成
        
        let realm = try! Realm()
        
        
        
        // (2)クエリによるデータの取得
        var todayEvent = realm.objects(Diary.self).filter("date = %@", daySelect!).first
        
        
        // (3)データの更新
        try! realm.write({
            todayEvent!.degreeOfEnrichment = sliderValueLabel.text!
        })
        
        //保存されたsliderValueLabel.textの値に応じてカレンダーの表示を変更できるようにする
       
    }
    
    //カレンダーの表示を変えるようにする
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
            //保存されたdegreeOfEnrichmentの値に応じてカレンダーの日付の背景色を変える
            let realm = try! Realm()
            let result = realm.objects(Event.self).filter("date = '\(da)'")
            
            if todayEvent?.degreeOfEnrichment = String(1) || String(2) || String(3){
               return UIColor.red
            }
    }
    
    
}



