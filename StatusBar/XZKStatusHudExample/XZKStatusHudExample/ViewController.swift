//
//  ViewController.swift
//  XZKStatusHud
//
//  Created by Leon on 16/4/4.
//  Copyright © 2016年 KevinShawn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func showSuccess(sender: AnyObject) {
        XZKStatusHud.showSuccess("加载成功")
    }
    
    @IBAction func showFail(sender: AnyObject) {
        XZKStatusHud.showError("加载是吧")
    }
    
    @IBAction func showMessage(sender: AnyObject) {
        XZKStatusHud.showMessage("哈哈哈哈哈哈")
    }
    @IBAction func showLoading(sender: AnyObject) {
        XZKStatusHud.showLoading("加载中......")
    }
    
    @IBAction func hide(sender: AnyObject) {
        XZKStatusHud.hide()
    }
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        XZKStatusHud.hide()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

