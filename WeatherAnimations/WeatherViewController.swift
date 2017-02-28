//
//  ViewController.swift
//  WeatherAnimations
//
//  Created by Ian Rahman on 10/11/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    
    let sun = UIImageView(image: UIImage(named: "Sun"))
    let moon = UIImageView(image: UIImage(named: "Moon"))
    let cloud = UIImageView(image: UIImage(named: "Cloud"))
    let lightning = UIImageView(image: UIImage(named: "Lightning"))
    var stormButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        
    
        view.addSubview(sun)
        sun.center.x += view.bounds.width
        sun.center.y += view.bounds.height
        
        view.addSubview(moon)
        moon.center.x += view.bounds.width
        moon.center.y += view.bounds.height
        
        view.addSubview(cloud)
        cloud.alpha = 0.0
        cloud.translatesAutoresizingMaskIntoConstraints = false
        cloud.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        cloud.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cloud.widthAnchor.constraint(equalToConstant: (view.frame.width*0.4)).isActive = true
        cloud.heightAnchor.constraint(equalToConstant: (view.frame.height*0.1)).isActive = true
        
        
        view.addSubview(lightning)
        lightning.alpha = 0.0
        lightning.translatesAutoresizingMaskIntoConstraints = false
//        lightning.topAnchor.constraint(equalTo: cloud.bottomAnchor).isActive = true
        lightning.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        lightning.centerXAnchor.constraint(equalTo: cloud.centerXAnchor).isActive = true
        lightning.widthAnchor.constraint(equalToConstant: (view.frame.width*0.1)).isActive = true
        lightning.heightAnchor.constraint(equalToConstant: (view.frame.height*0.1)).isActive = true
        
        
        stormButton = UIButton(type: .custom)
        stormButton.setTitle("🌩", for: .normal)
        stormButton.addTarget(self, action: #selector(storm), for: .touchUpInside)
        stormButton.backgroundColor = UIColor.white
        stormButton.layer.borderWidth = 3
        stormButton.layer.borderColor = UIColor.gray.cgColor
        
        view.addSubview(stormButton)
        
        
        stormButton.translatesAutoresizingMaskIntoConstraints = false 
        stormButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        stormButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        stormButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stormButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: +200).isActive = true
        stormButton.layoutIfNeeded()
        
        UIView.animateKeyframes(withDuration: 20.0, delay: 0.0, options: [.repeat, .calculationModeCubic, .allowUserInteraction], animations: {
        
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25, animations: {
                self.view.backgroundColor = UIColor.blue
            })
            
            
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                self.view.backgroundColor = UIColor.cyan
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25, animations: {
                self.view.backgroundColor = UIColor.blue
            })
            
            
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
                self.view.backgroundColor = UIColor.black
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5, animations: {
                self.sun.center.x = self.view.center.x
                self.sun.center.y = self.view.center.y - (self.view.frame.height*0.25)
                self.sun.layoutIfNeeded()
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5, animations: {
                self.sun.center.x -= self.view.bounds.width
                self.sun.center.y += self.view.bounds.height
                self.sun.layoutIfNeeded()
            })
        
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
                self.moon.center.x = self.view.center.x
                self.moon.center.y = self.view.center.y - (self.view.frame.height*0.25)
                self.moon.layoutIfNeeded()
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.9, relativeDuration: 0.5, animations: {
                self.moon.center.x -= self.view.bounds.width
                self.moon.center.y += self.view.bounds.height
                self.moon.layoutIfNeeded()
            })


        
        }, completion: nil)
        
    }
    
    func storm(_ sender: UIButton) {
        UIView.animateKeyframes(withDuration: 8.0, delay: 0.0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.1, animations: {
                self.cloud.alpha = 1.0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.25, animations: {
                self.cloud.center.y = self.view.center.y - (self.view.frame.height*0.20)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.35, relativeDuration: 0.25, animations: {
                self.cloud.center.y = self.view.center.y
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.25, animations: {
                self.cloud.center.y = self.view.center.y - (self.view.frame.height*0.20)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.85, relativeDuration: 0.25, animations: {
                self.cloud.center.y = self.view.center.y
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.95, relativeDuration: 0.05, animations: {
                self.cloud.alpha = 0.0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.25, animations: {
                self.lightning.center.y = (self.view.center.y - (self.view.frame.height*0.20)) + (self.cloud.frame.height)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.35, relativeDuration: 0.25, animations: {
                self.lightning.center.y = self.view.center.y + (self.cloud.frame.height)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.25, animations: {
                self.lightning.center.y = (self.view.center.y - (self.view.frame.height*0.20)) + (self.cloud.frame.height)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.85, relativeDuration: 0.25, animations: {
                self.lightning.center.y = self.view.center.y + (self.cloud.frame.height)
            })

    
        }, completion: nil)
        
        UIView.animateKeyframes(withDuration: 0.33, delay: 3.0, options: [.repeat, .autoreverse], animations: {
            
            UIView.setAnimationRepeatCount(3)
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.15, animations: {
                self.lightning.alpha = 1.0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.15, relativeDuration: 0.15, animations: {
                self.lightning.alpha = 0.0
            })
            
        }, completion: nil)
    }
    
    
}
