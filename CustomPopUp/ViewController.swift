//
//  ViewController.swift
//  CustomPopUp
//
//  Created by Omer Karayel on 23/11/16.
//  Copyright © 2016 Omer Karayel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var popUpView: PopUpView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    @IBAction func openPopUpView(_ sender: AnyObject) {
        popUpView = PopUpView(mainView: view, title: "First VC", description: "Apple hardware and accessories at any Apple Store, at Apple.com, or by calling 1-800-MY-APPLE. Choose from a variety of designs and denominations ")
        popUpView!.open()

    }
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        popUpView?.removeFromSuperview()
        popUpView?.open()
    }
}

