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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blue
        setUpViews()
        animateSunAndMoon()
        animateDayAndNight()
    }
    
    func setUpViews() {
        sun.frame = CGRect(x: view.frame.maxX, y: view.frame.maxY, width: 200, height: 200)
        view.addSubview(sun)
        moon.frame = CGRect(x: view.frame.maxX, y: view.frame.maxY, width: 175, height: 175)
        view.addSubview(moon)
        cloud.frame = CGRect(x: view.frame.midX, y: view.frame.maxY, width: 200, height: 100)
        view.addSubview(cloud)
        lightning.frame = CGRect(x: view.frame.midX, y: view.frame.maxY, width: 100, height: 50)
        view.addSubview(lightning)
    }
    
    func animateSunAndMoon() {
        UIView.animateKeyframes(withDuration: 20, delay: 0, options: [.repeat, .calculationModeCubic], animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25, animations: {
                self.sun.center = CGPoint(x: self.view.frame.midX, y: self.view.frame.midY - 200)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                self.sun.center = CGPoint(x: self.view.frame.minX - self.sun.frame.width, y: self.view.frame.maxY)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25, animations: {
                self.moon.center = CGPoint(x: self.view.frame.midX, y: self.view.frame.midY - 200)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
                self.moon.center = CGPoint(x: self.view.frame.minX - self.moon.frame.width, y: self.view.frame.maxY)
            })
            
        }) { (finished) in
            
        }
        
    }
    
    func animateDayAndNight() {
        UIView.animateKeyframes(withDuration: 20, delay: 0, options: [.repeat, .calculationModeCubic], animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25, animations: {
                self.view.backgroundColor = UIColor.cyan
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                self.view.backgroundColor = UIColor.blue
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25, animations: {
                self.view.backgroundColor = UIColor.black
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
                self.view.backgroundColor = UIColor.blue
            })
            
        })
    }
    
}
