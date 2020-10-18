//
//  AMRadarChartViewController.swift
//  originalProduct
//
//  Created by 伊藤明孝 on 2020/10/13.
//
import UIKit
import Charts
import Realm
import RealmSwift


class AMRadarChartViewController: UIViewController {
    @IBOutlet weak var barChartView: BarChartView!

    override func viewDidLoad() {
        //今日の日付取得
        let date = Date()
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("yMMMMdEEEE")
        print(formatter.string(from: date))

        let modifiedDate = Calendar.current.date(byAdding: .day, value: -1, to: date)!
        
        let realm = try! Realm()
        var todayScore = realm.objects(Diary.self).filter("date = %@",formatter.string(from: date)).last
        
        var score : Int!
        
        if todayScore?.degreeOfEnrichment == "1"{
            score = 10
        }else if todayScore?.degreeOfEnrichment == "2"{
            score = 20
        }else if todayScore?.degreeOfEnrichment == "3"{
            score = 30
        }else if todayScore?.degreeOfEnrichment == "4"{
            score = 40
        }else if todayScore?.degreeOfEnrichment == "5"{
            score = 50
        }else if todayScore?.degreeOfEnrichment == "6"{
            score = 60
        }else if todayScore?.degreeOfEnrichment == "7"{
            score = 70
        }else if todayScore?.degreeOfEnrichment == "8"{
            score = 80
        }else if todayScore?.degreeOfEnrichment == "9"{
            score = 90
        }else if todayScore?.degreeOfEnrichment == "10"{
            score = 100
        }else {
            score = 0
        }
        
        let rawData: [Int] = [20, 50, 70, 30, 60, 90, score]
        let entries = rawData.enumerated().map { BarChartDataEntry(x: Double($0.offset), y: Double($0.element)) }
        let dataSet = BarChartDataSet(entries: entries)
        dataSet.drawValuesEnabled = false
        dataSet.colors = [.systemBlue]
        let data = BarChartData(dataSet: dataSet)
        barChartView.data = data
        
        // X軸のラベルの位置を下に設定
        barChartView.xAxis.labelPosition = .bottom
        // X軸のラベルの色を設定
        barChartView.xAxis.labelTextColor = .systemGray
        // X軸の線、グリッドを非表示にする
        barChartView.xAxis.drawGridLinesEnabled = false
        barChartView.xAxis.drawAxisLineEnabled = false
        
        // 右側のY座標軸は非表示にする
        barChartView.rightAxis.enabled = false
        
        let avg = rawData.reduce(0) { return $0 + $1 } / rawData.count
        let limitLine = ChartLimitLine(limit: Double(avg))
        limitLine.lineColor = .systemOrange
        limitLine.lineDashLengths = [4]
        barChartView.leftAxis.addLimitLine(limitLine)
    }
  
    
   
}
