
//
//  ViewController.swift
//  RXSwift Project
//
//  Created by Ouri -Live Care on 8/16/19.
//  Copyright © 2019 LiveCare Corp. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import ChameleonFramework

class circleRX: UIViewController{
var circleView: UIView!
    let disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       setup()
        
        
    }
    
    func setup() {
        // Add circle view
        circleView = UIView(frame: CGRect(origin: view.center, size: CGSize(width: 100.0, height: 100.0)))
        circleView.layer.cornerRadius = circleView.frame.width / 2.0
        circleView.center = view.center
        circleView.backgroundColor = .green
        view.addSubview(circleView)
        
       
        
        let cc = CircleViewModel()
        circleView
            .rx.observe(CGPoint.self, "center")
            .bindTo(cc.centerVariable)
            .addDisposableTo(disposeBag)
        
        cc.backgroundColorObservable
            .subscribe(onNext: { [weak self] backgroundColor in
                UIView.animate(withDuration: 0.1) {
                    self?.circleView.backgroundColor = backgroundColor
                    // Try to get complementary color for given background color
                    let viewBackgroundColor = UIColor(complementaryFlatColorOf: backgroundColor)
                    // If it is different that the color
                     print("GOTHERE", backgroundColor,viewBackgroundColor)
                    if viewBackgroundColor != backgroundColor {
                        // Assign it as a background color of the view
                        // We only want different color to be able to see that circle in a view
                       
                        self?.view.backgroundColor = viewBackgroundColor
                    }
                }
            })
            .addDisposableTo(disposeBag)
        
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(circleMoved(_:)))
        circleView.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func circleMoved(_ recognizer: UIPanGestureRecognizer) {
        let location = recognizer.location(in: view)
        UIView.animate(withDuration: 0.1) {
            self.circleView.center = location
        }
    }
    
}
