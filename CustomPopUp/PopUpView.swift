//
//  PopUpView.swift
//  CustomPopUp
//
//  Created by Omer Karayel on 23/11/16.
//  Copyright © 2016 Omer Karayel. All rights reserved.
//

import UIKit

class PopUpView: UIView {
    
    
    @IBOutlet var contentView: PopUpView!
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    var mainView: UIView!
    var isBlackViewShow = true
    var imageView: UIImageView?
    var visualEffectView: UIVisualEffectView?
    
    private let blackView = UIView()
    
    init(mainView: UIView!, title: String!, description: String!) {
        super.init(frame: CGRect())
        commonInit()
        
        self.mainView = mainView
        self.lblTitle.text = title
        self.lblDescription.text = description
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
 
    private func commonInit() {
        Bundle.main.loadNibNamed("PopUpView", owner: self, options: nil)
        guard let content = contentView else { return }
        content.frame = self.bounds
        content.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(content)
    }
    
    func open() {
        if isBlackViewShow {
            showBlackView()
            blackView.addSubview(self)
        }
        self.frame.size = CGSize(width: 300, height: 300)
        self.center = mainView.center
        self.alpha = 0
        UIView.animate(withDuration: 0.4) {
            self.alpha = 1
            self.transform = CGAffineTransform.identity
            self.blackView.alpha = 1
        }
    }
    
    func close() {
        
        UIView.animate(withDuration: 0.4,delay: 0, animations: {
            self.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.alpha = 0
            self.blackView.alpha = 0
            self.visualEffectView?.effect = nil
        }) { (success) in
            self.removeFromSuperview()
        }
        
    }
    
    func openWithBlurEffect(imageView: UIImageView?) {
        
        isBlackViewShow = false
        
        visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        visualEffectView?.frame = mainView.bounds

        imageView!.addSubview(visualEffectView!)
       
        open()
        
    }
    private func showBlackView() {
        
        if let window = UIApplication.shared.keyWindow {
            
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(close)))
            
            window.addSubview(blackView)
            
            blackView.frame = window.frame
            blackView.alpha = 0
        }
    }
    
    @IBAction func dismiss(_ sender: AnyObject) {
        close()
    }
    
}
