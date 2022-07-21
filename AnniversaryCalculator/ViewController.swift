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
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showData()
        setUI()
        setNavigationTitle()
    }
    
    func showData() {
        // anniversaryDateLabels에 일자 넣어주는 구문
        for resultDate in anniversaryDateLabels {
            if let calculatedDate = defaults.string(forKey: "date\(resultDate.tag)") {
                // nil이 아닌 경우
                resultDate.text = calculatedDate
            } else {
                // nil인 경우(저장된 일자가 없을 경우에 넣어주는 구문)
                resultDate.text = "Good Day"
            }
        }
    }
    func setUI() {
        // 기념일 박스 4개 및 레이블 UI 설정
        for i in 0...(anniversaryBoxes.count - 1) {
            anniversaryBoxes[i].layer.cornerRadius = 8
            anniversaryBoxes[i].clipsToBounds = true
            anniversaryBoxes[i].layer.shadowColor = UIColor.gray.cgColor
            anniversaryBoxes[i].layer.shadowOpacity = 0.2
            anniversaryBoxes[i].layer.shadowOffset = CGSize.zero
            anniversaryBoxes[i].layer.shadowRadius = 4
            
            darkEffectView[i].layer.cornerRadius = 8
            
            dDayLabels[i].text = "D+\(i + 1)00"
            dDayLabels[i].textColor = UIColor.white
            dDayLabels[i].font = UIFont.preferredFont(forTextStyle: .largeTitle)
            
            anniversaryDateLabels[i].textColor = UIColor.white
            anniversaryDateLabels[i].font = UIFont.systemFont(ofSize: 18)
        }
        setWheelStyle()
        setButton(btn: resetButton, title: "Reset")
        setButton(btn: saveButton, title: "Save")
    }
    func setWheelStyle() {
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
        btn.layer.shadowOpacity = 0.8
        btn.layer.shadowOffset = CGSize.zero
    }
    func setNavigationTitle() {
        navigationItem.title = "What a Day!"
        navigationController?.navigationBar.scrollEdgeAppearance?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        for resultDate in anniversaryDateLabels {
            let plus = (resultDate.tag + 1) * 100
            resultDate.text = dateToFormattedString(pickedDate: sender, plusDay: plus)
        }
    }
    
    // datepicker로 선택한 날짜에 특정일만큼 더한 결과를 나타냄 (Date -> String)
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
    
    // MARK: - 계산된 기념일 저장하기
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        saveData() // 저장하기
        dataManageAlert(message: "기념일이 저장되었습니다.") // 저장 알림창 띄우기
    }
    
    // MARK: - 저장된 기념일 데이터 초기화하기
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        resetData() // 초기화하기
        dataManageAlert(message: "기념일 정보가 초기화되었습니다.") // 초기화 성공 알림창 띄우기
    }
    
    func saveData() {
        for resultDate in anniversaryDateLabels {
            let date = self.anniversaryDateLabels[resultDate.tag].text
            defaults.set(date, forKey: "date\(resultDate.tag)")
        }
    }
    func resetData() {
        for resultDate in anniversaryDateLabels {
            // 삭제하고
            defaults.removeObject(forKey: "date\(resultDate.tag)")
            
            // 삭제한 상태를 가져와서 저장하고
            let currentValue = defaults.string(forKey: "date\(resultDate.tag)")
            defaults.set(currentValue, forKey: "date\(resultDate.tag)")
            
            // 전체 감정숫자 출력
            resultDate.text = "Happy Day"
        }
    }
    
    func dataManageAlert(message: String) {
        let alert = UIAlertController(title: "<알림>", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .destructive, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
}


