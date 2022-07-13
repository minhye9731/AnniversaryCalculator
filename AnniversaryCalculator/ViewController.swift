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
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUI()
    }
    
    func setUI() {
        
        // 기념일 박스 4개 UI 설정
        for i in 0...(anniversaryBoxes.count - 1) {
            anniversaryBoxes[i].layer.cornerRadius = 8
            anniversaryBoxes[i].clipsToBounds = true
            darkEffectView[i].layer.cornerRadius = 8
            anniversaryBoxes[i].clipsToBounds = true
            anniversaryBoxes[i].layer.shadowColor = UIColor.gray.cgColor
            anniversaryBoxes[i].layer.shadowOpacity = 0.8
            anniversaryBoxes[i].layer.shadowOffset = CGSize.zero
            anniversaryBoxes[i].layer.shadowRadius = 4
        }
        
        // datepicker - ios14이후에서도 wheel 스타일 적용되도록 설정
        if #available(iOS 14.0, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }
    }

}

