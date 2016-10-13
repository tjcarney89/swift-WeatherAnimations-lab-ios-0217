//
//  ViewController.swift
//  WeatherAnimations
//
//  Created by Ian Rahman on 10/11/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
        animateSunAndMoon()
        animateDayAndNight()
    }
    
    func animateSunAndMoon() {
        
        let sunImage = UIImage(named: "Sun")
        let sunView = UIImageView(image: sunImage!)
        sunView.frame = CGRect(x: view.frame.maxX, y: view.frame.maxY, width: 200, height: 200)
        view.addSubview(sunView)
        
        let moonImage = UIImage(named: "Moon")
        let moonView = UIImageView(image: moonImage!)
        moonView.frame = CGRect(x: view.frame.maxX, y: view.frame.maxY, width: 175, height: 175)
        view.addSubview(moonView)
        
        UIView.animateKeyframes(withDuration: 20, delay: 0, options: [.repeat, .calculationModeCubic], animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25, animations: {
                sunView.center = CGPoint(x: self.view.frame.midX, y: self.view.frame.midY - 200)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                sunView.center = CGPoint(x: self.view.frame.minX - sunView.frame.width, y: self.view.frame.maxY)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25, animations: {
                moonView.center = CGPoint(x: self.view.frame.midX, y: self.view.frame.midY - 200)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
                moonView.center = CGPoint(x: self.view.frame.minX - moonView.frame.width, y: self.view.frame.maxY)
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
    
    func sunAnimation() -> CAAnimation {
        let path = UIBezierPath(arcCenter: CGPoint(x: view.frame.midX, y: view.frame.maxY), radius: 100, startAngle: 0, endAngle:CGFloat(M_PI)*2, clockwise: false)
        
        let sunAnimation = CAKeyframeAnimation(keyPath: "position");
        sunAnimation.duration = 10
        sunAnimation.repeatCount = MAXFLOAT
        sunAnimation.path = path.cgPath
        
        let sunImage = UIImage(named: "Sun")
        let imageView = UIImageView(image: sunImage!)
        
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        view.addSubview(imageView)
        imageView.layer.add(sunAnimation, forKey: nil)
        
        return sunAnimation
    }
    
    func moonAnimation() -> CAAnimation {
        let path = UIBezierPath(arcCenter: CGPoint(x: view.frame.midX, y: view.frame.maxY), radius: 100, startAngle: 0, endAngle:CGFloat(M_PI)*2, clockwise: false)
        
        let moonAnimation = CAKeyframeAnimation(keyPath: "position");
        moonAnimation.duration = 10
        moonAnimation.repeatCount = MAXFLOAT
        moonAnimation.path = path.cgPath
        
        let moonImage = UIImage(named: "Moon")
        let imageView = UIImageView(image: moonImage!)
        
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        view.addSubview(imageView)
        imageView.layer.add(moonAnimation, forKey: nil)
        
        return moonAnimation
    }
}

