//
//  UIColor.swift
//
//  Created by Ivan Yordanov
//

import Foundation

extension UIColor {

    /**
     * Get the UIColor value from hex
     *
     * - parameters:
     *     - hex: the hex value to transform
     */
    public class func colorWithHex(hex:String) -> UIColor {
        return UIColor.colorWithHex(hex: hex, alpha: 1.0)
    }

    /**
     * Get the UIColor value from hex and alpha
     *
     * - parameters:
     *     - hex: the hex value to transform
     *     - alpha: the alpha value for the color
     */
    public class func colorWithHex(hex:String, alpha:CGFloat) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }

    public class func black() -> UIColor {
        return colorWithHex(hex: "#000000")
    }

    public class func white() -> UIColor {
        return colorWithHex(hex: "#FFFFFF")
    }
    
    public class func darkBlue() -> UIColor {
        return colorWithHex(hex: "#0D0C28")
    }

    public class func red() -> UIColor {
        return .red
    }

}
