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
        
        animateSunAndMoon()
    }
    
    func animateSunAndMoon() {
        
        let path = UIBezierPath(arcCenter: CGPoint(x: view.frame.midX, y: view.frame.maxY), radius: 100, startAngle: 0, endAngle:CGFloat(M_PI)*2, clockwise: false)
        
        let sun = sunAnimation(along: path)
        let moon = moonAnimation(along: path)
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [sun, moon]
        animationGroup.duration = 10
        animationGroup.repeatCount = MAXFLOAT
        animationGroup.autoreverses = true
        
        // circleLayer is only used to locate the circle animation path
        let circleLayer = CAShapeLayer()
        circleLayer.path = path.cgPath
        circleLayer.strokeColor = UIColor.black.cgColor
        circleLayer.fillColor = UIColor.clear.cgColor
        view.layer.addSublayer(circleLayer)
        
        
    }
    
    func sunAnimation(along path: UIBezierPath) -> CAAnimation {
        
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
    
    func moonAnimation(along path: UIBezierPath) -> CAAnimation {
        
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

