//
//  UIImage+YWUIColor.swift
//  EnochSwiftDemo
//
//  Created by meng on 2017/7/20.
//  Copyright © 2017年 meng. All rights reserved.
//

import UIKit

extension UIImage {
    /**
     *  返回一个size为给定size的color颜色的图片
     *
     *  @param size        size大小
     *  @param color       填充色颜色
     *  @param radius      圆角半径
     *
     *  @return 图片
     */
    class func yw_image(_ size: CGSize, _ color: UIColor, _ cornerRadius: CGFloat = 0.0) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        let fillPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: size.width, height: size.height), cornerRadius: cornerRadius)
        color.setFill()
        fillPath.fill()
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    /**
     *  返回一个size为给定size的渐变颜色的图片水平
     *
     *  @param size         size大小
     *  @param formColor    渐变颜色初始
     *  @param toColor      渐变颜色结束
     *  @param radius       圆角半径
     *  @return 图片
     */
    class func yw_imageH(size: CGSize, formColor: UIColor, toColor: UIColor, cornerRadius: CGFloat = 0.0) -> UIImage {
        return UIImage.yw_gradientImage(size: size, gradientColors: [formColor.cgColor, toColor.cgColor], cornerRadius: cornerRadius, typeV: false)
    }
    
    /**
     *  返回一个size为给定size的渐变颜色的图片垂直
     *
     *  @param size         size大小
     *  @param formColor    渐变颜色初始
     *  @param toColor      渐变颜色结束
     *  @param radius       圆角半径
     *  @return 图片
     */
    class func yw_imageV(size: CGSize, formColor: UIColor, toColor: UIColor, cornerRadius: CGFloat = 0.0) -> UIImage {
        return UIImage.yw_gradientImage(size: size, gradientColors: [formColor.cgColor, toColor.cgColor], cornerRadius: cornerRadius)
    }
    
    /**
     *  返回一个size为给定size的渐变颜色的图片
     *
     *  @param size         size大小
     *  @param colors       渐变颜色序列，元素为UIColor
     *  @param locations    渐变位置数组元素为CGFloat，取值[0~1]
     *  @param radius       圆角半径
     *  @param typeV        方向 false垂直 true水平
     *
     *  @return 图片
     */
    class func yw_gradientImage(size: CGSize, gradientColors: [CGColor], gradientLocations: [CGFloat] = [0.0, 1.0], cornerRadius: CGFloat = 0.0, typeV:Bool = true)-> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        let colorSpace: CGColorSpace = CGColorSpaceCreateDeviceRGB()
        let context: CGContext = UIGraphicsGetCurrentContext()!
        let gradient: CGGradient = CGGradient(colorsSpace: colorSpace, colors: gradientColors as CFArray, locations: gradientLocations)!
        
        let fillPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: size.width, height: size.height), cornerRadius: cornerRadius)
        fillPath.fill()
        context.saveGState()
        fillPath.addClip()
        if typeV {
            context.drawLinearGradient(gradient, start: CGPoint(x: size.width / 2, y: 0), end: CGPoint(x: size.width / 2, y: size.height), options: .drawsBeforeStartLocation)
        }else{
            context.drawLinearGradient(gradient, start: CGPoint(x: 0, y: 0), end: CGPoint(x: size.width, y: 0), options: .drawsBeforeStartLocation)
        }
        context.restoreGState()
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!

    }

}
