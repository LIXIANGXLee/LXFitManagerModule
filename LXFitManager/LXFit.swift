//
//  LXFit.swift
//  LXFoundationManager
//
//  Created by XL on 2020/4/23.
//  Copyright © 2020 李响. All rights reserved.
//

import UIKit

public enum LXFitType: Int {
    /// 关闭适配
    case none = 0
    /// |~| 开启手机屏幕式配
    case flex = 1
}

// MARK: - 屏幕尺寸适配
public final class LXFit: NSObject {
    //默认是屏幕适配（外部可全局设置）
    public static var fitType = LXFitType.flex
}

// MARK: - UIFont Int CGFloat Double CGSize CGRect UIEdgeInsets扩展的分类
extension UIFont {
    /// UIFont 字体大小适配
    public var fitFont:UIFont{return self|~|}
}
extension Int {
    /// Int 屏幕大小适配
    public var fitInt:Int{return self|~|}
}
extension CGFloat {
    /// CGFloat 屏幕大小适配
    public var fitFloat:CGFloat{return self|~|}
}
extension Double {
    /// Double 屏幕大小适配
    public var fitDouble:Double{return self|~|}
}
extension CGSize {
    /// CGSize 屏幕大小适配
    public var fitSize:CGSize{return self|~|}
}
extension CGRect {
    /// CGRect 屏幕大小适配
    public var fitRect:CGRect{return self|~|}
}
extension CGPoint {
    /// CGPoint 屏幕大小适配
    public var fitPoint:CGPoint{return self|~|}
}
extension UIEdgeInsets {
    /// UIEdgeInsets 屏幕大小适配
    public var fitEdgeInset:UIEdgeInsets { return self|~|}
}


// MARK: - 屏幕尺寸 扩展的分类
extension LXFit {
    public static func fitInt(_ value: Int) -> Int { value.fitInt }
    public static func fitFloat(_ value: CGFloat) -> CGFloat { return value.fitFloat }
    public static func fitDouble(_ value: Double) -> Double { return Double(value.fitDouble) }
    public static func fitFoint(_ value: CGPoint) -> CGPoint { value.fitPoint }
    public static func fitSize(_ value: CGSize) -> CGSize { value.fitSize }
    public static func fitRect(_ value: CGRect) -> CGRect { value.fitRect }
    public static func fitEdgeInsets(_ value: UIEdgeInsets) -> UIEdgeInsets { value.fitEdgeInset }
}

// MARK: -  屏幕适配api
extension LXFit {
    
     /// 尺寸适配
     ///
     /// - Parameters:
     ///   - value: 尺寸大小
    fileprivate static func fitSize( _ value: Double)  -> Double {
        switch LXFit.fitType {
        case .none:
            return value
        case .flex:
            return value * Double(UIScreen.main.bounds.width) / 375.0
        }
    }
}

// MARK: -  自定义运算符 operator |~|
postfix operator |~|
/// 重载运算符
public postfix func |~| (value: Double) -> Double {
    return LXFit.fitSize(Double(value))
}

public postfix func |~| (font: UIFont) -> UIFont {
    return font.withSize(CGFloat(font.pointSize)|~|)
}

public postfix func |~| (value: Int) -> Int {
    return Int(Double(value)|~|)
}

public postfix func |~| (value: CGFloat) -> CGFloat {
    return CGFloat(Double(value)|~|)
}

public postfix func |~| (value: CGPoint) -> CGPoint {
    return CGPoint(
        x: Double(value.x)|~|,
        y: Double(value.y)|~|
    )
}
public postfix func |~| (value: CGSize) -> CGSize {
    return CGSize(
        width: value.width|~|,
        height: value.height|~|
    )
}
public postfix func |~| (value: CGRect) -> CGRect {
    return CGRect(
        x: value.origin.x|~|,
        y: value.origin.y|~|,
        width: value.size.width|~|,
        height: value.size.height|~|
    )
}
public postfix func |~| (value: UIEdgeInsets) -> UIEdgeInsets {
    return UIEdgeInsets(
        top: value.top|~|,
        left: value.left|~|,
        bottom: value.bottom|~|,
        right: value.right|~|
    )
}
