//
//  ViewController.swift
//  Alarm
//
//  Created by HyoRim Kim on 2021/07/01.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    var alarmTime: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func datePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        view.backgroundColor = UIColor.white
        lblPickerTime.text = "선택 시간: " + formatter.string(from: datePickerView.date)
        formatter.dateFormat = "hh: mm aaa"
        alarmTime = formatter.string(from: datePickerView.date)
    }
    @objc func updateTime(){
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        
        lblCurrentTime.text = "현재 시간: " + formatter.string(from: date as Date)
        formatter.dateFormat = "hh: mm aaa"
        let currentTime = formatter.string(from: date as Date)
        if(alarmTime == currentTime){
            view.backgroundColor = UIColor.red
            count += 1
        }
        if(count != 0){
            count += 1
        }
        if(count == 60){
            count = 0
            view.backgroundColor = UIColor.white
        }
    }
    
}

