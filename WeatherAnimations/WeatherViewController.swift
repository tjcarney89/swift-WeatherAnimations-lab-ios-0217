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
    var weatherButton: UIButton!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.blue
        
        setUpViews {
            self.animateSunAndMoon()
            self.animateDayAndNight()
        }
        
    }
    
    fileprivate func setUpViews(completion:() -> ()) {
        
        sun.frame = CGRect(x: view.frame.maxX,
                           y: view.frame.maxY,
                           width: view.frame.width / 2,
                           height: view.frame.width / 2)
        
        moon.frame = CGRect(x: view.frame.maxX,
                            y: view.frame.maxY,
                            width: view.frame.width / 2.5,
                            height: view.frame.width / 2.5)
        
        weatherView.frame = view.frame
        weatherView.alpha = 0
        
        cloud.frame.origin = CGPoint(x: self.weatherView.frame.midX,
                               y: self.weatherView.frame.midY - 60)
        cloud.frame.size.width = weatherView.frame.width / 2
        cloud.frame.size.height = cloud.frame.width / 2
        
        lightning.alpha = 0
        lightning.center = CGPoint(x: cloud.frame.midX,
                                   y: cloud.frame.midY + cloud.frame.height / 2)
        lightning.frame.size.width = cloud.frame.width / 4
        lightning.frame.size.height = cloud.frame.height * 2
        
        weatherButton = UIButton(type: .custom)
        weatherButton.frame = CGRect(x: weatherView.frame.midX - 25,
                                     y: weatherView.frame.midY + 200,
                                     width: 50,
                                     height: 50)
        weatherButton.isUserInteractionEnabled = true
        weatherButton.layer.borderColor = UIColor.lightGray.cgColor
        weatherButton.layer.borderWidth = 5.0
        weatherButton.backgroundColor = UIColor.white
        weatherButton.setTitle("🌩", for: .normal)
        weatherButton.isEnabled = true
        weatherButton.addTarget(self, action: #selector(WeatherViewController.animateWeather), for: .touchUpInside)
        
        view.addSubview(moon)
        view.addSubview(sun)
        view.addSubview(weatherView)
        view.addSubview(weatherButton)
        weatherView.addSubview(lightning)
        weatherView.addSubview(cloud)
        
        completion()
        
    }
    
    func animateWeather() {
        
        weatherButton.isEnabled = false
        
        UIView.animateKeyframes(withDuration: 8,
                                delay: 0,
                                options: .calculationModeCubic,
                                animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.1, animations: {
                self.weatherView.alpha = 1
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.3, animations: {
                self.weatherView.center = CGPoint(x: self.weatherView.frame.midX,
                                                  y: self.weatherView.frame.midY - 100)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.3, animations: {
                self.weatherView.center = CGPoint(x: self.weatherView.frame.midX,
                                                  y: self.weatherView.frame.midY + 100)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.3, animations: {
                self.weatherView.center = CGPoint(x: self.weatherView.frame.midX,
                                                  y: self.weatherView.frame.midY - 100)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.9, relativeDuration: 0.1, animations: {
                self.weatherView.alpha = 0
            })
        }) { finished in
            if finished {
                self.weatherView.center = CGPoint(x: self.weatherView.frame.midX,
                                                  y: self.weatherView.frame.midY + 100)
                self.weatherButton.isEnabled = true
            }
        }
        
        animateLightning()
    }
    
    fileprivate func animateLightning() {
        
        UIView.animateKeyframes(withDuration: 1,
                                delay: 3,
                                options: .autoreverse,
                                animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0.2,
                               relativeDuration: 0,
                               animations: {
                self.lightning.alpha = 1
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.4,
                               relativeDuration: 0,
                               animations: {
                self.lightning.alpha = 0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.5,
                               relativeDuration: 0,
                               animations: {
                self.lightning.alpha = 1
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.7,
                               relativeDuration: 0,
                               animations: {
                self.lightning.alpha = 0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.8,
                               relativeDuration: 0,
                               animations: {
                self.lightning.alpha = 1
            })
            
            UIView.addKeyframe(withRelativeStartTime: 1,
                               relativeDuration: 0,
                               animations: {
                self.lightning.alpha = 0
            })
        })
    }
    
    fileprivate func animateSunAndMoon() {
        
        UIView.animateKeyframes(withDuration: 20,
                                delay: 0,
                                options: [.repeat,
                                          .calculationModeCubic,
                                          .allowUserInteraction],
                                animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0,
                               relativeDuration: 0.25,
                               animations: {
                self.sun.center = CGPoint(x: self.view.frame.midX,
                                          y: self.view.frame.minY + 150)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.25,
                               relativeDuration: 0.25,
                               animations: {
                self.sun.center = CGPoint(x: self.view.frame.minX - self.sun.frame.width,
                                          y: self.view.frame.maxY)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.5,
                               relativeDuration: 0.25,
                               animations: {
                self.moon.center = CGPoint(x: self.view.frame.midX,
                                           y: self.view.frame.minY + 150)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.75,
                               relativeDuration: 0.25,
                               animations: {
                self.moon.center = CGPoint(x: self.view.frame.minX - self.moon.frame.width,
                                           y: self.view.frame.maxY)
            })
            
        })
        
    }
    
    fileprivate func animateDayAndNight() {
        
        UIView.animateKeyframes(withDuration: 20,
                                delay: 0,
                                options: [.repeat,
                                          .calculationModeCubic,
                                          .allowUserInteraction],
                                animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0.0,
                               relativeDuration: 0.25,
                               animations: {
                self.view.backgroundColor = UIColor.cyan
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.25,
                               relativeDuration: 0.25,
                               animations: {
                self.view.backgroundColor = UIColor.blue
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.5,
                               relativeDuration: 0.25,
                               animations: {
                self.view.backgroundColor = UIColor.black
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.75,
                               relativeDuration: 0.25,
                               animations: {
                self.view.backgroundColor = UIColor.blue
            })
            
        })
        
    }
    
}
