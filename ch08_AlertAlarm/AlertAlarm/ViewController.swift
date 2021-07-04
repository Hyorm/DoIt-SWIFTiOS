//
//  ViewController.swift
//  AlertAlarm
//
//  Created by HyoRim Kim on 2021/07/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblCustumTime: UILabel!
    @IBOutlet var lblCountTime: UILabel!
    
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    var alarmTime:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func datePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        
        lblCustumTime.text = "선택시간: "+formatter.string(from: datePickerView.date)
        formatter.dateFormat = "hh:mm aaa"
        alarmTime = formatter.string(from: datePickerView.date)
    }
    @objc func updateTime(){
        let date = NSDate()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text = "현재시간: "+formatter.string(from: date as Date)
        lblCountTime.text = "경과시간: " + String(count)
        formatter.dateFormat = "hh:mm aaa"
        let currentTime = formatter.string(from: date as Date)
        if(count >= 60){
            count = 0
        }
        if(count == 0){
            if(alarmTime == currentTime){
                let alarmOn = UIAlertController(title:"알림", message: "설정한 시간입니다", preferredStyle: UIAlertController.Style.alert)
                let alarmAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
                alarmOn.addAction(alarmAction)
                present(alarmOn, animated: true, completion: nil)
                count += 1
            }
        }
        else{
            count += 1
        }
        
    }
    
}

