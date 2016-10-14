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
    let weatherView = UIView()
    var weatherIsNice = true
    var weatherButton: UIButton!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = UIColor.blue
        setUpViews()
        animateSunAndMoon()
        animateDayAndNight()
    
    }
    
    fileprivate func setUpViews() {
        
        weatherView.frame = view.frame
        view.addSubview(weatherView)
        
        sun.frame = CGRect(x: view.frame.maxX, y: view.frame.maxY, width: 200, height: 200)
        view.addSubview(sun)
        
        moon.frame = CGRect(x: view.frame.maxX, y: view.frame.maxY, width: 175, height: 175)
        view.addSubview(moon)
        
        lightning.center = CGPoint(x: self.weatherView.frame.midX, y: self.view.frame.midY + 75)
        weatherView.addSubview(lightning)
        lightning.alpha = 0
        
        cloud.center = CGPoint(x: self.weatherView.frame.midX, y: self.view.frame.midY - 75)
        weatherView.addSubview(cloud)
        cloud.alpha = 0
        
        weatherButton = UIButton(type: .custom)
        weatherButton.frame = CGRect(x: weatherView.frame.midX - 25, y: weatherView.frame.midY + 200, width: 50, height: 50)
        weatherButton.layer.borderColor = UIColor.lightGray.cgColor
        weatherButton.layer.borderWidth = 5.0
        weatherButton.backgroundColor = UIColor.white
        weatherButton.addTarget(self, action: #selector(WeatherViewController.rainDance), for: .touchUpInside)
        weatherView.addSubview(weatherButton)
        weatherButton.setTitle("🌩", for: .normal)
        weatherButton.isEnabled = true
        
    }
    
    @objc fileprivate func rainDance() {
        
            animateWeather()
        
    }
    
    fileprivate func animateWeather() {
        
        UIView.animateKeyframes(withDuration: 5, delay: 0, options: [.calculationModeCubic], animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.1, animations: { 
                self.cloud.alpha = 1
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.2, animations: { 
                self.cloud.center = CGPoint(x: self.weatherView.frame.midX, y: self.weatherView.frame.midY - 100)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.2, animations: {
                self.cloud.center = CGPoint(x: self.weatherView.frame.midX, y: self.weatherView.frame.midY - 75)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.2, animations: {
                self.cloud.center = CGPoint(x: self.weatherView.frame.midX, y: self.weatherView.frame.midY - 100)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 0.2, animations: {
                self.cloud.center = CGPoint(x: self.weatherView.frame.midX, y: self.weatherView.frame.midY - 75)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.9, relativeDuration: 0.1, animations: {
                self.cloud.alpha = 0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0, animations: {
                self.lightning.alpha = 1
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.02, relativeDuration: 0, animations: {
                self.lightning.alpha = 0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0, animations: {
                self.lightning.alpha = 1
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.05, relativeDuration: 0, animations: {
                self.lightning.alpha = 0
            })
            
        })
        
    }
    
    fileprivate func animateLightning() {
        UIView.animateKeyframes(withDuration: 1, delay: 0, options: [], animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0, animations: {
                self.lightning.alpha = 1
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.02, relativeDuration: 0, animations: {
                self.lightning.alpha = 0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0, animations: {
                self.lightning.alpha = 1
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.05, relativeDuration: 0, animations: {
                self.lightning.alpha = 0
            })
            
        })
    }
    
    fileprivate func animateSunAndMoon() {
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
            
        })
        
    }
    
    fileprivate func animateDayAndNight() {
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
