//
//  Constants.swift
//  searchBar
//
//  Created by Руслан Жигалов on 13.12.2022.
//

import UIKit
enum Constats {
    enum Colors{
        static var greenPrimaryColors: UIColor?{
            UIColor(named: "GreenPrimary")
        }
        static var greenSecondaryColors: UIColor?{
            UIColor(named: "GreenSecondary")
        }
        static var greySecondaryColors: UIColor?{
            .gray
        }
    }
    enum Fonts{
        static var systemHeading: UIFont{
            UIFont.systemFont(ofSize: 30, weight: .bold)
        }
        static var systemText: UIFont{
            UIFont.systemFont(ofSize: 16, weight: UIFont.Weight(CGFloat(600)))
        }
        static var systemText2: UIFont{
            UIFont.systemFont(ofSize: 14, weight: UIFont.Weight(CGFloat(400)))
        }
    }
    enum Image{
        static let austria = UIImage(named: "Austria")
        static let belgium = UIImage(named: "Belgium")
        static let france = UIImage(named: "France")
        static let germany = UIImage(named: "Germany")
        static let greece = UIImage(named: "Greece")
    }
    
}
