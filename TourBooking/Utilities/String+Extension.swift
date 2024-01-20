//
//  String+Extension.swift
//  TourBooking
//
//  Created by Elena Kim on 1/14/24.
//

import SwiftUI

extension String {
    func getSize(for size: CGFloat, weight: UIFont.Weight) -> CGFloat {
        let font = UIFont.systemFont(ofSize: size, weight: weight)
        let attributes = [NSAttributedString.Key.font: font]
        let size = (self as NSString).size(withAttributes: attributes)
        return size.width
    }
}
