//
//  Diary.swift
//  originalProduct
//
//  Created by 伊藤明孝 on 2020/10/05.
//

import UIKit
import Realm
import RealmSwift

class Diary: Object {
    @objc dynamic var date : Date!//日付
    @objc dynamic var goodPoint : String = ""
    @objc dynamic var badPoint : String = ""
    @objc dynamic var reframing : String = ""//悪いところをポジティブな言葉にリフレーミングしたやつ
    @objc dynamic var degreeOfEnrichment : String = ""//今日の充実度について
    
    
}
   
  
