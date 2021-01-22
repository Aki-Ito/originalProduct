//
//  ViewController.swift
//  originalProduct
//
//  Created by 伊藤明孝 on 2020/10/05.
//

import UIKit
import Realm
import RealmSwift

class ViewController: UIViewController {

    
    @IBOutlet var backgroundLabel : UILabel!
    @IBOutlet var useageLabel : UILabel!
    @IBOutlet var explanationLabel : UILabel!
    @IBOutlet var explanation2Label : UILabel!
    @IBOutlet var explanation3Label : UILabel!
    @IBOutlet var explanation4Label : UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        backgroundLabel.layer.cornerRadius = 10
        backgroundLabel.clipsToBounds = true
       
    }


}

