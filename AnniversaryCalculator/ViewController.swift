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
            
            dDayLabels[i].text = "D+\(i + 1)00"
            dDayLabels[i].textColor = UIColor.white
            dDayLabels[i].font = UIFont.boldSystemFont(ofSize: 25) // 폰트 더 굵은거로 수정 필요
            
            anniversaryDateLabels[i].textColor = UIColor.white
            anniversaryDateLabels[i].font = UIFont.systemFont(ofSize: 18)

        }
        
        
        // datepicker - ios14이후에서도 wheel 스타일 적용되도록 설정
        if #available(iOS 14.0, *) {
            
            datePicker.preferredDatePickerStyle = .wheels
            datePicker.datePickerMode = .date
        }
    }

    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        
        // 양식정리
        let format = DateFormatter()
        format.dateFormat = #"yyyy년\#nMM월 dd일"#
        format.locale = Locale(identifier: "ko_KR")
        format.timeZone = TimeZone.current
        
        // 시작일자 저장
        var pickedDate = Date()
        pickedDate = datePicker.date

        // 100~400일들 더해주기
        let pickerDateAdd100 = pickedDate.addingTimeInterval(3600*24*100)
        let pickerDateAdd200 = pickedDate.addingTimeInterval(3600*24*200)
        let pickerDateAdd300 = pickedDate.addingTimeInterval(3600*24*300)
        let pickerDateAdd400 = pickedDate.addingTimeInterval(3600*24*400)
        
        anniversaryDateLabels[0].text = format.string(from: pickerDateAdd100)
        anniversaryDateLabels[1].text = format.string(from: pickerDateAdd200)
        anniversaryDateLabels[2].text = format.string(from: pickerDateAdd300)
        anniversaryDateLabels[3].text = format.string(from: pickerDateAdd400)

    }
}

