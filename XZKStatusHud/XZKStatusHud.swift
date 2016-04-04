//
//  XMGStatusHud.swift
//  XZKStatusHud
//
//  Created by Leon on 16/4/4.
//  Copyright © 2016年 KevinShawn. All rights reserved.
//

import UIKit

enum XZKStatusHudType {
    case XZKStatusHudType_Message
    case XZKStatusHudType_Loading
}

let statusHeight:CGFloat = 20.0
let animateInterval:NSTimeInterval = 0.25
let showInterval:NSTimeInterval = 0.5

let windowWidth = UIScreen.mainScreen().bounds.width

class XZKStatusHud: UIView {
    // window
    private static var statusWindow:UIWindow = {
        let window = UIWindow()
        window.hidden = false
        window.windowLevel = UIWindowLevelStatusBar
        return window
    }()
    
    // left icon
    private static var iconImageView:UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
   
    // left indicator while loading
    private static var indicator:UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.backgroundColor = UIColor.clearColor()
        activityIndicator.activityIndicatorViewStyle = .White
        return activityIndicator
    }()
    
    // right Text
    private static var messageLabel:UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.clearColor()
        label.textAlignment = .Center
        label.font = UIFont.systemFontOfSize(12)
        label.textColor = UIColor.whiteColor()
        return label
    }()
    
    static var statusBackgroundColor:UIColor = UIColor.blackColor()
    
    // MARK:Public Method
    // showSuccess
    static func showSuccess(message:String?) {
        let image:UIImage? = UIImage(named:"XZKStatusHud.bundle/success")
        showMessageHud(message, image: image,  type: .XZKStatusHudType_Message)
    }
    
    // show Error
    static func showError(message:String?) {
        let image:UIImage? = UIImage(named:"XZKStatusHud.bundle/fail")
        showMessageHud(message, image: image,  type: .XZKStatusHudType_Message)
    }
    
    // only show Message
    static func showMessage(message:String?) {
        showMessageHud(message, image: nil, type: .XZKStatusHudType_Message)
    }
    
    static func showLoading(message:String?) {
        showMessageHud(message, image: nil, type: .XZKStatusHudType_Loading)
    }
    
    // showMessage with icon
    static func showMessageHud(message:String?, image:UIImage?, type:XZKStatusHudType) {
        cancelPreviousPerformRequestsWithTarget(self)
        let leftView:UIView
        switch type {
        case .XZKStatusHudType_Loading:
            leftView = indicator
            iconImageView.hidden = true
            indicator.startAnimating()
            break
        case .XZKStatusHudType_Message:
            indicator.hidden = true
            iconImageView.image = image
            iconImageView.sizeToFit()
            leftView = iconImageView
            break
        }
       leftView.hidden = false
        messageLabel.text = message
        messageLabel.sizeToFit()
        statusWindow.backgroundColor = statusBackgroundColor
        statusWindow.frame = CGRectMake(0, -statusHeight, windowWidth, statusHeight)
        if !statusWindow.subviews.contains(leftView) {
            statusWindow .addSubview(leftView)
        }
        if !statusWindow.subviews.contains(messageLabel) {
            statusWindow.addSubview(messageLabel)
        }
        
        let width:CGFloat = messageLabel.frame.size.width
        let  x:CGFloat = windowWidth / 2 + 5
        messageLabel.center = CGPointMake(x, statusHeight / 2)
        leftView.center = CGPointMake(x - width / 2 - iconImageView.frame.size.width / 2 - 10, statusHeight / 2)
        
        UIView.animateWithDuration(animateInterval) { () -> Void in
            var frame = statusWindow.frame
            frame.origin.y = 0
            statusWindow.frame = frame
        }
        switch type {
        case .XZKStatusHudType_Loading:
            break
        case .XZKStatusHudType_Message:
             performSelector(#selector(hide), withObject: nil, afterDelay: showInterval)
            break
        }
       
    }
    
    static func hide() {
        indicator.stopAnimating()
        UIView.animateWithDuration(animateInterval) { () -> Void in
            var frame = statusWindow.frame
            frame.origin.y = -statusHeight
            statusWindow.frame = frame
        }
    }
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
