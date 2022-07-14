//
//  ViewController.swift
//  AnniversaryCalculator
//
//  Created by 강민혜 on 7/13/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var anniversaryBoxes: [UIImageView]!
    @IBOutlet var darkEffectView: [UIView]!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet var dDayLabels: [UILabel]!
    @IBOutlet var anniversaryDateLabels: [UILabel]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    func setUI() {
        
        // 기념일 박스 4개 및 레이블 UI 설정
        for i in 0...(anniversaryBoxes.count - 1) {
            anniversaryBoxes[i].layer.cornerRadius = 8
            anniversaryBoxes[i].clipsToBounds = true
            anniversaryBoxes[i].clipsToBounds = true
            anniversaryBoxes[i].layer.shadowColor = UIColor.gray.cgColor
            anniversaryBoxes[i].layer.shadowOpacity = 0.8
            anniversaryBoxes[i].layer.shadowOffset = CGSize.zero
            anniversaryBoxes[i].layer.shadowRadius = 4
            
            darkEffectView[i].layer.cornerRadius = 8
            
            dDayLabels[i].text = "D+100" // 기입날짜는 계산된 날짜로 수정 필요
            dDayLabels[i].textColor = UIColor.white
            dDayLabels[i].font = UIFont.boldSystemFont(ofSize: 25) // 폰트 더 굵은거로 수정 필요
            
            anniversaryDateLabels[i].text = #"2022년\#n7월 14일"# // 기입날짜는 선택된 날짜로 수정 필요
            anniversaryDateLabels[i].textColor = UIColor.white
            dDayLabels[i].font = UIFont.systemFont(ofSize: 18)
            
            
            
            
        }
        
        
        // datepicker - ios14이후에서도 wheel 스타일 적용되도록 설정
        if #available(iOS 14.0, *) {
            datePicker.preferredDatePickerStyle = .wheels
            datePicker.datePickerMode = .date
        }
    }

}

