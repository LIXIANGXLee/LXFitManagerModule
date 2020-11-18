//
//  LXFit.swift
//  LXFitManager
//
//  Created by XL on 2020/4/23.
//  Copyright © 2020 李响. All rights reserved.
//

import UIKit

/// 可以设置屏幕尺寸是否适配的枚举类型
public enum LXFitType: Int {
    /// 关闭适配
    case none = 0
    /// |~| 开启手机屏幕尺寸适配
    case flex = 1
}

// MARK: - 屏幕尺寸适配
public final class LXFit: NSObject {
    
    ///默认是屏幕适配
    ///（外部可全局设置，设置none为全局禁止屏幕适配，默认是屏幕适配）
    public static var fitType = LXFitType.flex
    
}

// MARK: - UIFont Int CGFloat Double CGSize CGRect UIEdgeInsets扩展的分类
extension UIFont {
    /// UIFont 字体大小适配
    public var fitFont: UIFont{ return self|~| }
}

extension Int {
    /// Int 屏幕尺寸大小适配
    public var fitInt: Int{ return self|~| }
}

extension CGFloat {
    /// CGFloat 屏幕尺寸大小适配
    public var fitFloat: CGFloat{ return self|~| }
}

extension Double {
    /// Double 屏幕尺寸大小适配
    public var fitDouble: Double{ return self|~| }
}

extension CGSize {
    /// CGSize 屏幕尺寸大小适配
    public var fitSize: CGSize{ return self|~| }
}

extension CGRect {
    /// CGRect 屏幕尺寸大小适配
    public var fitRect: CGRect{ return self|~| }
}

extension CGPoint {
    /// CGPoint 屏幕尺寸大小适配
    public var fitPoint: CGPoint{ return self|~| }
}

extension UIEdgeInsets {
    /// UIEdgeInsets 屏幕尺寸大小适配
    public var fitEdgeInset: UIEdgeInsets { return self|~| }
}

// MARK: - 屏幕尺寸适配 扩展的分类 可以通过类方法调用，也可以通过以上的分类调用，更方便快捷
extension LXFit {
    public static func fitInt(_ value: Int) -> Int { value.fitInt }
    public static func fitFloat(_ value: CGFloat) -> CGFloat { value.fitFloat }
    public static func fitDouble(_ value: Double) -> Double { Double(value.fitDouble) }
    public static func fitFoint(_ value: CGPoint) -> CGPoint { value.fitPoint }
    public static func fitSize(_ value: CGSize) -> CGSize { value.fitSize }
    public static func fitRect(_ value: CGRect) -> CGRect { value.fitRect }
    public static func fitEdgeInsets(_ value: UIEdgeInsets) -> UIEdgeInsets { value.fitEdgeInset }
}

// MARK: -  屏幕尺寸适配的api 当前文件可访问
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
fileprivate postfix func |~| (value: Double) -> Double {
    return LXFit.fitSize(Double(value))
}

fileprivate postfix func |~| (font: UIFont) -> UIFont {
    return font.withSize(CGFloat(font.pointSize)|~|)
}

fileprivate postfix func |~| (value: Int) -> Int {
    return Int(Double(value)|~|)
}

fileprivate postfix func |~| (value: CGFloat) -> CGFloat {
    return CGFloat(Double(value)|~|)
}

fileprivate postfix func |~| (value: CGPoint) -> CGPoint {
    return CGPoint(
        x: Double(value.x)|~|,
        y: Double(value.y)|~|
    )
}

fileprivate postfix func |~| (value: CGSize) -> CGSize {
    return CGSize(
        width: value.width|~|,
        height: value.height|~|
    )
}

fileprivate postfix func |~| (value: CGRect) -> CGRect {
    return CGRect(
        x: value.origin.x|~|,
        y: value.origin.y|~|,
        width: value.size.width|~|,
        height: value.size.height|~|
    )
}

fileprivate postfix func |~| (value: UIEdgeInsets) -> UIEdgeInsets {
    return UIEdgeInsets(
        top: value.top|~|,
        left: value.left|~|,
        bottom: value.bottom|~|,
        right: value.right|~|
    )
}
