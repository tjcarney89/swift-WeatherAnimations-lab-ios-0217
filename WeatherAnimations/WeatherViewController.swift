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
        animateWeather()
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
        
        cloud.frame = CGRect(x: weatherView.frame.midX, y: weatherView.frame.maxY, width: 200, height: 100)
        weatherView.addSubview(cloud)
        
        lightning.frame = CGRect(x: weatherView.frame.midX, y: weatherView.frame.midY, width: 100, height: 200)
        weatherView.addSubview(lightning)
        
        weatherButton = UIButton(type: .custom)
        weatherButton.frame = CGRect(x: weatherView.frame.midX, y: weatherView.frame.midY + 200, width: 50, height: 50)
        weatherButton.layer.borderColor = UIColor.black.cgColor
        weatherButton.backgroundColor = UIColor.white
        weatherButton.setTitle("☔️💃", for: .normal)
        weatherView.addSubview(weatherButton)
    }
    
    fileprivate func animateWeather() {
        UIView.animate(withDuration: 5, animations: {
            self.cloud.center = CGPoint(x: self.weatherView.frame.midX, y: self.view.frame.midY)
            }) { (finished) in
                if self.weatherIsNice { return }
        }
        
        UIView.animate(withDuration: 2, delay: 0, options: .repeat, animations: {
            self.lightning.center = CGPoint(x: self.weatherView.frame.midX, y: self.view.frame.midY + 50)
        }) { (finished) in
            if self.weatherIsNice { return }
        }
    }
    
    fileprivate func stopWeather() {
        
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
