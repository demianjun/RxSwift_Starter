//
//  MemoDetailViewModel.swift
//  StartRxSwift
//
//  Created by Demian on 2020/06/24.
//  Copyright © 2020 Demian. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Action
import Then

class MemoDetailViewModel: CommonViewModel {
  let memo: Memo
  
  private var formatter = DateFormatter().then {
    $0.locale = Locale(identifier: "Ko_kr")
    $0.dateStyle = .medium
    $0.timeStyle = .medium
  }
  
  var contents: BehaviorSubject<[String]>
  
  init(memo: Memo,
       title: String,
       sceneCoordinator: SceneCoordinatorType,
       storage: MemoStorageType) {
    
    self.memo = memo
    
    contents = BehaviorSubject<[String]>(value: [
      memo.content,
      formatter.string(from: memo.insertDate)
    ])
    super.init(title: title,
               sceneCoordinator: sceneCoordinator,
               storage: storage)
  }
  
  lazy var popAction = CocoaAction { [unowned self] in
    return self.sceneCoordinator.close(animated: true).asObservable().map { _ in }
  }
}
