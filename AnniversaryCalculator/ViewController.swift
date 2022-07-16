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
    
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setButton(btn: resetButton, title: "Reset")
        setButton(btn: saveButton, title: "Save")
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
            
            anniversaryDateLabels[i].text = "언제일까?!"
            anniversaryDateLabels[i].textColor = UIColor.white
            anniversaryDateLabels[i].font = UIFont.systemFont(ofSize: 18)
        }
        
        // datepicker - ios14이후에서도 wheel 스타일 적용되도록 설정
        if #available(iOS 14.0, *) {
            datePicker.preferredDatePickerStyle = .wheels
            datePicker.datePickerMode = .date
        }
    }
    
    func setButton(btn: UIButton, title: String) {
        btn.backgroundColor = UIColor.white
        btn.layer.borderWidth = 2
        btn.layer.borderColor = UIColor.systemPink.cgColor
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(.darkGray, for: .normal)
        btn.setTitleColor(.systemPink, for: .highlighted)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        btn.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.center
        btn.layer.cornerRadius = 23
        btn.layer.shadowRadius = 23
        btn.layer.shadowColor = UIColor.gray.cgColor
        btn.layer.shadowOpacity = 0.3
        btn.layer.shadowOffset = CGSize.zero
    }
    
    
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        // 계산된 일자 4개를 결과레이블에 담기
        for resultDate in anniversaryDateLabels {
            let plus = (resultDate.tag + 1) * 100
            resultDate.text = dateToFormattedString(pickedDate: sender, plusDay: plus)
        }
    }
    
    // datepicker로 선택한 날짜에 특정일만큼 더한 결과를 나타냄
    // Date -> String
    func dateToFormattedString(pickedDate: UIDatePicker, plusDay: Int) -> String {
        // DateFormatter로 일자속성 설정
        let format = DateFormatter()
        format.dateFormat = #"yyyy년\#nMM월 dd일"#
        format.locale = Locale(identifier: Locale.current.identifier)
        format.timeZone = TimeZone(identifier: TimeZone.current.identifier)
        
        // 선택된 일자에 특정 일수만큼 더해줌
        let date = pickedDate.date
        let calculatedDate = date.addingTimeInterval(TimeInterval(3600*24*plusDay))
        
        // 더해진 결과일자를 string으로 변환한 값을 돌려줌
        return format.string(from: calculatedDate)
    }
}


