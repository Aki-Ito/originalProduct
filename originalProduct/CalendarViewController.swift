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
   //日付を入れることのできる変数宣言をする
    var daySelect: Date?
 
    
   
   override func viewDidLoad() {
       super.viewDidLoad()
    //デリゲートの処理
           calendar.delegate = self
           calendar.dataSource = self
      
   }
    //画面遷移の際の処理　
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddViewController" {
            let addDiaryViewController: AddDiaryViewController = segue.destination as! AddDiaryViewController
            addDiaryViewController.receiveValue = self.daySelect
        }
        
        if segue.identifier == "toDetail" {
            let detailDiaryViewController: DetailDairyViewController = segue.destination as! DetailDairyViewController
            detailDiaryViewController.receiveValue = self.daySelect
        }
    }
    
    
    //カレンダー処理
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition){
        //日付選択時に呼ばれるメソッド
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
        //Diaryクラスのインスタンスを作成
        let newDiary = Diary()
        newDiary.date = daySelect
        //degriiOfEnrichmentにスライダーの値を保存したいのですがうまくいきません。
        newDiary.degreeOfEnrichment = sliderValueLabel
        
        //インスタンスをrealmに保存する
        do {
            let realm = try Realm()
            try realm.write({ () -> Void in
                realm.add(newDiary)
            })
        }catch{
            
        }
        
        //保存されたsliderValueの値を取り出してカレンダーでの表示の仕方を変える
            
            
        }
        
    
}
