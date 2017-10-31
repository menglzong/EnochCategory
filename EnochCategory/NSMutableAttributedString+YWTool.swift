//
//  NSMutableAttributedString+YWTool.swift
//  EnochSwiftDemo
//
//  Created by meng on 2017/8/28.
//  Copyright © 2017年 meng. All rights reserved.
//

import Foundation
import UIKit

extension NSMutableAttributedString {
    
    func adjustHeightMaxWidth(_ maxWidth: CGFloat) -> CGFloat {
        let contentSize = self.boundingRect(with: CGSize(width: maxWidth, height: CGFloat(MAXFLOAT)), options: [.truncatesLastVisibleLine, .usesLineFragmentOrigin, .usesFontLeading] , context: nil)
        return ceil(contentSize.height)
    }
    
    /* 添加指定格式的字符串
     lineSpacing 间隔
     underline 下划线
     leanlined 中划线
     */
    func yw_appendString(string: String, font: UIFont, color: UIColor, lineSpacing: CGFloat = 0, underline: Bool = false, leanlined: Bool = false, alignment: NSTextAlignment = .center) -> NSMutableAttributedString {
        
        var attributes = Dictionary<String, Any>()
        attributes[NSFontAttributeName] = font
        attributes[NSForegroundColorAttributeName] = color
        if underline {
            attributes[NSUnderlineStyleAttributeName] = NSUnderlineStyle.styleSingle.rawValue
        }
        //调整行间距
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = .byWordWrapping
        paragraphStyle.alignment = alignment
        paragraphStyle.paragraphSpacing = 0
        paragraphStyle.lineSpacing = lineSpacing
        attributes[NSParagraphStyleAttributeName] = paragraphStyle
        let newAttributedString = NSMutableAttributedString(string: string, attributes: attributes)
        
        if leanlined {
           let _ = newAttributedString.yw_appendStrikethrough(NSRange(location: 0, length: newAttributedString.length))
        }
        
        self.append(newAttributedString)
        return newAttributedString
    }
    
    func yw_appendStrikethrough(_ range: NSRange) -> NSMutableAttributedString {
        self.addAttributes([NSBaselineOffsetAttributeName: 0], range: range)
        self.addAttributes([NSStrikethroughStyleAttributeName: 2], range: range)
        return self
    }
    
}
