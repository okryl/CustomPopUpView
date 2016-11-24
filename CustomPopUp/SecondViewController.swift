//
//  SecondViewController.swift
//  CustomPopUp
//
//  Created by Omer Karayel on 23/11/16.
//  Copyright © 2016 Omer Karayel. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
  
    var popUpView: PopUpView?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func openPopUpViewWithBlurEffect(_ sender: AnyObject) {
        
         popUpView = PopUpView(mainView: view, title: "Second VC", description: "Apple hardware and accessories at any Apple Store, at Apple.com, or by calling 1-800-MY-APPLE. Choose from a variety of designs and denominations ")
        view.addSubview(popUpView!)
        popUpView!.openWithBlurEffect(imageView: imageView)
    }

    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        popUpView?.removeFromSuperview()
        popUpView?.open()
    }
}
