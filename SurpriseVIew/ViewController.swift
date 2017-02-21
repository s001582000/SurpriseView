//
//  ViewController.swift
//  SurpriseVIew
//
//  Created by 梁雅軒 on 2017/2/21.
//  Copyright © 2017年 zoaks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //數量
        for i in 1...5 {
            let myView = SurpriseView(frame: CGRect(x: 100, y: CGFloat(i * 100), width: 50, height: 50))
            self.view.addSubview(myView)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

class SurpriseView: UIView {
    let lblText = UILabel()
    let btn = UIButton(type: .system)
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.gray
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapView)))
        
        lblText.frame = self.bounds
        lblText.isHidden = true
        lblText.textColor = UIColor.white
        lblText.textAlignment = NSTextAlignment.center
        self.addSubview(lblText)
        
        btn.frame = lblText.frame
        btn.addTarget(self, action: #selector(btnOnClick), for: .touchUpInside)
        btn.isHidden = true
        btn.backgroundColor = UIColor.clear
        btn.setTitle("按我啊", for: .normal)
        btn.setTitleColor(UIColor.green, for: .normal)
        self.addSubview(btn)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tapView(sender:UITapGestureRecognizer) {
        self.backgroundColor = self.backgroundColor == UIColor.gray ? UIColor.black : UIColor.gray
        btn.isHidden = !btn.isHidden
        self.lblText.isHidden = true
    }
    
    func btnOnClick(sender:UIButton) {
        let alert = UIAlertController(title: "注意", message: "請輸入字串", preferredStyle: .alert)
        alert.addTextField { (tfMessage) in
            tfMessage.placeholder = "請輸入字串"
        }
        let actionCheck = UIAlertAction(title: "確定", style: .default) { (action) in
            let tfMessage = alert.textFields?.first
            self.lblText.text = tfMessage?.text
            self.lblText.isHidden = false
            sender.isHidden = true
        }
        alert.addAction(actionCheck)
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}
