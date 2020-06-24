//
//  SceneCoordinateType.swift
//  StartRxSwift
//
//  Created by Demian on 2020/06/24.
//  Copyright © 2020 Demian. All rights reserved.
//

import Foundation
import RxSwift

protocol SceneCoordinateType {
  @discardableResult
  func transition(to scene: Scene, using style: TransitionStyle, animated: Bool) -> Completable
  
  @discardableResult
  func close(animated: Bool) -> Completable
}
