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
   // @IBAction func selfAnalysis : UIButton!
    
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
    //カレンダーのセルを押さずに遷移してもアプリが落ちないようにする必要がある。
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAdd" {
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
        var todayEvent = realm.objects(Diary.self).filter("date = %@", daySelect!).first
        
        
        // (3)データの更新
        try! realm.write({
            todayEvent?.degreeOfEnrichment = sliderValueLabel.text!
        })
        
        //保存されたsliderValueLabel.textの値に応じてカレンダーの表示を変更できるようにする
       
    }
    
//    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillSelectionColorFor date: Date) -> UIColor? {
//
//        var colorSelect : Results<Diary>!
//
//        do {
//            let realm = try! Realm()
//
//            colorSelect = realm.objects(Diary.self)
//        }
//
//
//        return appearance.selectionColor
//    }
   
    
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

