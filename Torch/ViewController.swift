//
//  ViewController.swift
//  Torch
//
//  Created by prabhanjan on 03/09/18.
//  Copyright © 2018 manorishi. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var backgroungImageView: UIImageView!
    @IBOutlet weak var onAndOffButton: UIButton!
    var isLightOn : Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func onAndOffButtonAction(_ sender: UIButton) {
        
        if isLightOn {
            
            isLightOn = false
            toggleTorch(on: isLightOn)
            changeUI()
        }
        else {
            
            isLightOn = true
            toggleTorch(on: isLightOn)
            changeUI()
        }
        
    }
    
    func changeUI() {
        if isLightOn {
            backgroungImageView.image = UIImage(named: "lightonbg")
            onAndOffButton.setImage(UIImage(named: "turnOff"), for: .normal)
        }
        else {
            backgroungImageView.image = UIImage(named: "lightoffbg")
            onAndOffButton.setImage(UIImage(named: "turnOn"), for: .normal)
        }
        
    }
    
    func toggleTorch(on: Bool) {
        guard let device = AVCaptureDevice.default(for: AVMediaType.video)
            else {return}
        
        if device.hasTorch {
            do {
                try device.lockForConfiguration()
                
                if on == true {
                    device.torchMode = .on
                } else {
                    device.torchMode = .off
                }
                
                device.unlockForConfiguration()
            } catch {
                print("Torch could not be used")
            }
        } else {
            print("Torch is not available")
        }
    }
    
}

