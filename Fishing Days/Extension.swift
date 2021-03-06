//
//  Extension.swift
//  Fishing Days
//
//  Created by 周建明 on 2017/1/24.
//  Copyright © 2017年 Uncle Jerry. All rights reserved.
//

import Foundation
import UIKit

extension Date {
    var toString: String{
        get{
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .none
            formatter.locale = Locale(identifier: "en-us")
            
            return formatter.string(from: self)
        }
    }
    
    var toIntArray: [Int] {
        get{
            var intArray = [Int]()
            let calendar = Calendar.current
            
            intArray.append(calendar.component(.year, from: self))
            intArray.append(calendar.component(.month, from: self))
            intArray.append(calendar.component(.day, from: self))
            intArray.append(calendar.component(.hour, from: self))
            intArray.append(calendar.component(.minute, from: self))
            
            return intArray
        }
    }
    
    
    
    func calDays(thatDay: Date) -> Int {
        let interval = Calendar.current.dateComponents([Calendar.Component.day], from: thatDay, to: self)
        
        return interval.day!
    }
    
    func calFutureDays(thatDay: Date) -> Int {
        let interval = Calendar.current.dateComponents([Calendar.Component.day], from: self, to: thatDay)
        
        return interval.day!
    }
    
    func calInterval(thatDay: Date) -> [Int] {
        let interval = Calendar.current.dateComponents([Calendar.Component.year, Calendar.Component.month, Calendar.Component.day], from: thatDay, to: self)
        
        return [interval.year!, interval.month!, interval.day!]
    }
}

extension UIView {
    
    // Some extension about the UI animation
    func fadeIn(duration: TimeInterval) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 1.0
        })
    }
    func fadeOut(duration: TimeInterval) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0.0
        })
    }
    
    func MovePosition(duration: TimeInterval, x: CGFloat, y: CGFloat) {
        
        UIView.animate(withDuration: duration, animations: {
            if x < 0 {
                // Hold position at X
                self.center = CGPoint(x: self.center.x, y: y)
            }else if y < 0 {
                // Hold position at Y
                self.center = CGPoint(x: x, y: self.center.y)
            }else{
                self.center = CGPoint(x: x, y: y)
            }
            
        })
        
    }
    
    func rotation(angle: Double, duration: TimeInterval) {
        UIView.animate(withDuration: duration, animations: {
            self.transform = CGAffineTransform(rotationAngle: CGFloat(angle))
        })
    }
}

extension UIViewController {
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func ErrorAlert(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "Alright", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
}

func getUUID() -> String {
    let uuidRef = CFUUIDCreate(nil)
    let uuidStringRef = CFUUIDCreateString(nil,uuidRef)
    return uuidStringRef! as String
}
