//
//  ViewController.swift
//  Alert
//
//  Created by HyoRim Kim on 2021/07/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lampImg: UIImageView!
    @IBOutlet var lblRemoveBtn: UIButton!
    
    let imgOn = UIImage(named: "lamp-on.png")
    let imgOff = UIImage(named: "lamp-off.png")
    let imgRemove = UIImage(named: "lamp-remove.png")
    
    var isLampOn = true
    var isLampRemove = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lampImg.image = imgOn
    }

    @IBAction func btnLampOn(_ sender: UIButton) {
        if(isLampRemove){
            let lampOnAlert = UIAlertController(title: "경고", message: "현재 remove 상태입니다", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            lampOnAlert.addAction(onAction)
            present(lampOnAlert, animated:true, completion: nil)
        }
        else{
            if(!isLampOn){
                lampImg.image = imgOn
                isLampOn = true
            }else{
                let lampOnAlert = UIAlertController(title: "경고", message: "현재 on 상태입니다", preferredStyle: UIAlertController.Style.alert)
                let onAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
                lampOnAlert.addAction(onAction)
                present(lampOnAlert, animated:true, completion: nil)
            }
        }
    }
    
    @IBAction func btnLampOff(_ sender: UIButton) {
        if(isLampRemove){
            let lampOnAlert = UIAlertController(title: "경고", message: "현재 remove 상태입니다", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            lampOnAlert.addAction(onAction)
            present(lampOnAlert, animated:true, completion: nil)
        }
        else{
            if(isLampOn){
                let lampOffAlert = UIAlertController(title: "램프 끄기", message: "램프를 끄시겠습니까?", preferredStyle: UIAlertController.Style.alert)
                let offAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler: {ACTION in
                                                self.lampImg.image = self.imgOff
                                                self.isLampOn = false})
                let cancelAction = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default, handler: nil)
                lampOffAlert.addAction(offAction)
                lampOffAlert.addAction(cancelAction)
                
                present(lampOffAlert, animated:true, completion: nil)
            }else{
                let lampOffAlert = UIAlertController(title: "경고", message: "현재 off 상태입니다", preferredStyle: UIAlertController.Style.alert)
                let offAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
                lampOffAlert.addAction(offAction)
                present(lampOffAlert, animated:true, completion: nil)
            }
        }
    }
    
    @IBAction func btnLampRemove(_ sender: UIButton) {
        
        let lampRmvAlert = UIAlertController(title: "램프 제거", message: "램프를 제거하시겠습니까", preferredStyle: UIAlertController.Style.alert)
        let offAction = UIAlertAction(title: "아니오, 끕니다(off)", style: UIAlertAction.Style.default, handler: {ACTION in
                                            self.lampImg.image = self.imgOff
                                            self.isLampOn = false
                                            self.isLampRemove = false
                                            self.lblRemoveBtn.setTitle("제거", for: .normal)
                                        })
        let onAction = UIAlertAction(title: "아니오, 켭니다(on)", style: UIAlertAction.Style.default, handler: {ACTION in
                                            self.lampImg.image = self.imgOn
                                            self.isLampOn = true
                                            self.isLampRemove = false
                                            self.lblRemoveBtn.setTitle("제거", for: .normal)
                                        })
        let rmvAction = UIAlertAction(title: "네, 제거합니다", style: UIAlertAction.Style.default, handler: {ACTION in
                                            self.lampImg.image = self.imgRemove
                                            self.isLampOn = false
                                            self.isLampRemove = true
                                            self.lblRemoveBtn.setTitle("삽입", for: .normal)
                                        })
        lampRmvAlert.addAction(offAction)
        lampRmvAlert.addAction(onAction)
        lampRmvAlert.addAction(rmvAction)
        present(lampRmvAlert, animated:true, completion: nil)
        
    }
    
}

