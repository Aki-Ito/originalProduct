//
//  DetailDairyViewController.swift
//  originalProduct
//
//  Created by 伊藤明孝 on 2020/10/05.
//
import UIKit
import Realm
import RealmSwift

class DetailDairyViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
   //CalenderViewControllerから受け取る日付の値
    var receiveValue : Date?
    let dataList = ["goodPoint","badPoint","reframing"]
   
    
   
   @IBOutlet weak var detailTextView: UITextView!
  
    @IBOutlet var pickerView: UIPickerView!

   override func viewDidLoad() {
       super.viewDidLoad()
    pickerView.delegate = self
    pickerView.dataSource = self
    
    //最初に表示されるようにする
    let realm = try! Realm()
    let firstEvent = realm.objects(Diary.self).filter("date = %@", receiveValue!)
    detailTextView.text = firstEvent.last?.goodPoint
   

    
   //テキストビューに枠線をつける
      detailTextView.layer.borderColor = UIColor.lightGray.cgColor

    //枠を角丸にする方法
      detailTextView.layer.cornerRadius = 10.0

      detailTextView.layer.masksToBounds = true

   }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        // UIPickerViewの行数、リストの数
        func pickerView(_ pickerView: UIPickerView,
                        numberOfRowsInComponent component: Int) -> Int {
            return dataList.count
        }
        
        // UIPickerViewの最初の表示
        func pickerView(_ pickerView: UIPickerView,
                        titleForRow row: Int,
                        forComponent component: Int) -> String? {
            
            return dataList[row]
        }
        
        // UIPickerViewのRowが選択された時の挙動
        func pickerView(_ pickerView: UIPickerView,
                        didSelectRow row: Int,
                        inComponent component: Int) {
            
            let realm = try! Realm()
            let todayEvent = realm.objects(Diary.self).filter("date = %@", receiveValue!)
            
            if row == 0{
                detailTextView.text = todayEvent.last?.goodPoint
            }else if row == 1{
                detailTextView.text = todayEvent.last?.badPoint
            }else if row == 2{
                detailTextView.text = todayEvent.last?.reframing
            }
            
        }
    

}
