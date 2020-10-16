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

class CalendarViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
    
   
    //パーツの宣言
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet var degreeOfEnrichmentLabel: UILabel!
    @IBOutlet var sliderValueLabel: UILabel!
    
    @IBOutlet weak var checkDiaryButton: UIButton!
    @IBOutlet weak var enrichmentButton: UIButton!
   // @IBAction func selfAnalysis : UIButton!
    
    var daySelect: Date?
    fileprivate lazy var dateFormatter1: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter
    }()
   
    //最初に表示される時の処理
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        //デリゲートの処理
        calendar.delegate = self
        calendar.dataSource = self
        calendar.select(self.dateFormatter1.date(from: "2020/10/03"))
        daySelect = calendar.selectedDate
        
        // ボタンの装飾
        let rgba = UIColor(red: 255/255, green: 128/255, blue: 168/255, alpha: 1.0) // ボタン背景色設定
        checkDiaryButton.backgroundColor = rgba                                               // 背景色
        checkDiaryButton.layer.borderWidth = 0.5                                              // 枠線の幅
        checkDiaryButton.layer.borderColor = UIColor.black.cgColor                            // 枠線の色
        checkDiaryButton.layer.cornerRadius = 5.0                                             // 角丸のサイズ
        checkDiaryButton.setTitleColor(UIColor.white, for: UIControl.State.normal)             // タイトルの色
        
        enrichmentButton.backgroundColor = rgba                                               // 背景色
        enrichmentButton.layer.borderWidth = 0.5                                              // 枠線の幅
        enrichmentButton.layer.borderColor = UIColor.black.cgColor                            // 枠線の色
        enrichmentButton.layer.cornerRadius = 5.0                                             // 角丸のサイズ
        enrichmentButton.setTitleColor(UIColor.white, for: UIControl.State.normal)             // タイトルの色
        
    }
    //画面遷移の際の処理
    //カレンダーのセルを押さずに遷移してもアプリが落ちないようにする必要がある。
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAdd"{
            let addDiaryViewController: AddDiaryViewController = segue.destination as! AddDiaryViewController
            addDiaryViewController.receiveValue = calendar.selectedDate
        }
        
        if segue.identifier == "toDetail" {
            let detailDiaryViewController: DetailDairyViewController = segue.destination as! DetailDairyViewController
            detailDiaryViewController.receiveValue = calendar.selectedDate
        }
    }
    
    
    //カレンダーがタップされた時の処理
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition){
        
        
        //calendar.allowsMultipleSelection = true//.allowsMultipleSelectionで複数セルを選択できるようになる
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
        
        let realm = try! Realm()
        
        // (2)クエリによるデータの取得
        var todayEvent = realm.objects(Diary.self).filter("date = %@", daySelect!).last
        // (3)データの更新
        try! realm.write({
            todayEvent?.degreeOfEnrichment = sliderValueLabel.text!
        })
        
        calendar.reloadData()
    }
    
   func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
       let realm = try! Realm()

    var selectColor = realm.objects(Diary.self).filter("date = %@",date).last

       if selectColor?.degreeOfEnrichment == "1"{
            return UIColor.red
       }else{
            return UIColor.white
       }
            
      
 }
// func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillSelectionColorFor date: Date) -> UIColor? {
//         let realm = try! Realm()
//
//    //var will = realm.objects(Diary.self).filter().first
//
//    
//
//
//
//         return UIColor.purple
// }
   
    
////    fileprivate let gregorian: Calendar = Calendar(identifier: .gregorian)
//    fileprivate lazy var dateFormatter1: DateFormatter = {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy/MM/dd"
//        return formatter
//    }()
//
//    let fillSelectionColors = ["2015/10/08": UIColor.green, "2015/10/06": UIColor.purple, "2015/10/17": UIColor.gray, "2015/10/21": UIColor.cyan, "2015/11/08": UIColor.green, "2015/11/06": UIColor.purple, "2015/11/17": UIColor.gray, "2015/11/21": UIColor.cyan, "2015/12/08": UIColor.green, "2015/12/06": UIColor.purple, "2015/12/17": UIColor.gray, "2015/12/21": UIColor.cyan]
//
//
//    override func loadView() {
//        let view = UIView(frame: UIScreen.main.bounds)
//        view.backgroundColor = UIColor.groupTableViewBackground
//        self.view = view
//
//        let height: CGFloat = UIDevice.current.model.hasPrefix("iPad") ? 450 : 300
//        let calendar = FSCalendar(frame: CGRect(x:0, y:64, width:self.view.bounds.size.width, height:height))
//
//        calendar.allowsMultipleSelection = true//.allowsMultipleSelectionで複数セルを選択できるようになる
//
//        calendar.backgroundColor = UIColor.white
//
//        self.view.addSubview(calendar)//必要
//        self.calendar = calendar
//        calendar.select(self.dateFormatter1.date(from: "2015/10/03"))
//
//        // For UITest
//        self.calendar.accessibilityIdentifier = "calendar"
//    }
//
//
//   func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillSelectionColorFor date: Date) -> UIColor? {
//      let key = self.dateFormatter1.string(from: date)
//     if let color = self.fillSelectionColors[key] {
//           return color
//     }
//     return appearance.selectionColor
//   }
    

    
    
}

