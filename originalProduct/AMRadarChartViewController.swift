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
        let rawData: [Int] = [20, 50, 70, 30, 60, 90, 40]
        let entries = rawData.enumerated().map { BarChartDataEntry(x: Double($0.offset), y: Double($0.element)) }
        let dataSet = BarChartDataSet(entries: entries)
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
    }
  
    
   
}
