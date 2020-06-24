//
//  TransitionModel.swift
//  StartRxSwift
//
//  Created by Demian on 2020/06/24.
//  Copyright © 2020 Demian. All rights reserved.
//

import Foundation

enum TransitionStyle {
  case root
  case push
  case modal
}

enum TransitionError: Error {
  case navigationControllerMissing
  case cannotPop
  case unknown
}
