//
//  DateFormatterViewController.swift
//  AnniversaryCalculator
//
//  Created by 강민혜 on 7/14/22.
//

import UIKit

class DateFormatterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // DateFormatter : 알아보기 쉬운 날짜 + 시간대 (yyyy MM dd hh:mm:ss)
        let format = DateFormatter()
        format.dateFormat = "M월 d일, yy년"
        
        let result = format.string(from: Date()) // Date()는 오늘시간을 나타냄
        print(result, Date())
        
        let word = "3월 2일, 19년"
        let dateResult = format.date(from: word)
        
        print(dateResult)
        
    }
    

  

}
