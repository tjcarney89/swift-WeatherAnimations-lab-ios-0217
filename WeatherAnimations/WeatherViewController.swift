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
        self.view.backgroundColor = UIColor.cyan
        animateSunAndMoon()
    }
    
    func animateSunAndMoon() {
        
        let sunPath = UIBezierPath(arcCenter: CGPoint(x: self.view.frame.midX, y: self.view.frame.midY * 1.6), radius: 450, startAngle: 0, endAngle: CGFloat(M_PI)*2, clockwise: false)
        let moonPath = UIBezierPath(arcCenter: CGPoint(x: self.view.frame.midX, y: self.view.frame.midY * 1.6), radius: 450, startAngle: 0, endAngle: CGFloat(M_PI)*2, clockwise: false)
        
        let sunImage = UIImage(named: "Sun")
        let sunView = UIImageView(image: sunImage!)
        sunView.frame = CGRect(x: 800, y: 800, width: 200, height: 200)
        view.addSubview(sunView)
        
        let moonImage = UIImage(named: "Moon")
        let moonView = UIImageView(image: moonImage!)
        moonView.frame = CGRect(x: 800, y: 800, width: 175, height: 175)
        view.addSubview(moonView)
        
        let sunAnimation = CAKeyframeAnimation(keyPath: "position")
        sunAnimation.duration = 10
        sunAnimation.repeatCount = MAXFLOAT
        sunAnimation.path = sunPath.cgPath
        
        let moonAnimation = CAKeyframeAnimation(keyPath: "position")
        moonAnimation.duration = 10
        moonAnimation.beginTime = CACurrentMediaTime() + 5.0
        moonAnimation.repeatCount = MAXFLOAT
        moonAnimation.path = moonPath.cgPath
        
        UIView.animateKeyframes(withDuration: 10, delay: 0, options: .repeat, animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                self.view.backgroundColor = UIColor.black
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.95, relativeDuration: 0.5, animations: {
                self.view.backgroundColor = UIColor.cyan
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1, animations: { 
                sunView.layer.add(sunAnimation, forKey: nil)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1, animations: {
                moonView.layer.add(moonAnimation, forKey: nil)
            })
            
            }) { (finished) in
                
        }
        
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

