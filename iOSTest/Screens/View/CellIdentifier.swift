//
//  CellIdentifier.swift
//  iOSTest
//
//  Created by abdul on 27/03/20.
//  Copyright © 2020 abdul. All rights reserved.
//

import Foundation
import UIKit

protocol CellIdentifiable {

    static var nib: UINib { get }

    static var identifier: String { get }

}

extension CellIdentifiable {

    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    static var identifier: String {
        return String(describing: self)
    }

}
