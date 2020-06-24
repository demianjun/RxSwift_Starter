//
//  CommonViewModel.swift
//  StartRxSwift
//
//  Created by Demian on 2020/06/24.
//  Copyright © 2020 Demian. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class CommonViewModel: NSObject {
  let title: Driver<String>
  let sceneCoordinator: SceneCoordinatorType
  let storage: MemoStorageType
  
  init(title: String, sceneCoordinator: SceneCoordinatorType, storage: MemoStorageType) {
    self.title = Observable.just(title).asDriver(onErrorJustReturn: "")
    self.sceneCoordinator = sceneCoordinator
    self.storage = storage
  }
}
