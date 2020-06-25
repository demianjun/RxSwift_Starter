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
  
  func performUpdate(memo: Memo) -> Action<String, Void> {
    return Action { input in
      self.storage.update(memo: memo,
                                 content: input )
        .subscribe(onNext: { update in
          self.contents.onNext([
            update.content,
            self.formatter.string(from: update.insertDate)
          ])
        })
        .disposed(by: self.rx.disposeBag)
      
      return Observable.empty()
    }
  }
  
  func makeEditAction() -> CocoaAction {
    return CocoaAction { _ in
      let composeViewModel = MemoComposeViewModel(title: "메모 편집",
                                                  content: self.memo.content,
                                                  sceneCoordinator: self.sceneCoordinator,
                                                  storage: self.storage,
                                                  saveAction: self.performUpdate(memo: self.memo))
      
      let composeScene = Scene.compose(composeViewModel)
      
      return self.sceneCoordinator.transition(to: composeScene,
                                              using: .modal,
                                              animated: true).asObservable().map { _ in }
    }
  }
  
  func makeDeleteAction() -> CocoaAction {
    return Action { input in
      self.storage.delete(memo: self.memo)
      return self.sceneCoordinator.close(animated: true).asObservable().map { _ in }
    }
  }
}
