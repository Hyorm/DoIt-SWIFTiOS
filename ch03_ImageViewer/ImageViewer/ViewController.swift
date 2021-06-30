//
//  ViewController.swift
//  ImageViewer
//
//  Created by HyoRim Kim on 2021/06/30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imgView: UIImageView!
    @IBOutlet var bfBtn: UIButton!
    @IBOutlet var aftBtn: UIButton!
    
    var img: UIImage?
    let max_img = 3
    var num = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        img = UIImage(named: "smile1.png")
        imgView.image = img
    }

    @IBAction func bfBtnTouch(_ sender: UIButton) {
        if(num==1){
            num = max_img
        }
        else{
            num -= 1
        }
        img = UIImage(named: "smile"+String(num)+".png")
        imgView.image = img
    }
    
    @IBAction func aftBtnTouch(_ sender: UIButton) {
        if(num==max_img){
            num = 1
        }
        else{
            num += 1
        }
        img = UIImage(named: "smile"+String(num)+".png")
        imgView.image = img
    }
}

