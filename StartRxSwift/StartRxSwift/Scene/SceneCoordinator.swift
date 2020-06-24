//
//  SceneCoordinator.swift
//  StartRxSwift
//
//  Created by Demian on 2020/06/24.
//  Copyright © 2020 Demian. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class SceneCoordinator: SceneCoordinateType {
  private let bag = DisposeBag()
  
  private var window: UIWindow
  private var currentVC: UIViewController
  
  required init(window: UIWindow) {
    self.window = window
    currentVC = window.rootViewController!
  }
  
  @discardableResult
  func transition(to scene: Scene, using style: TransitionStyle, animated: Bool) -> Completable {
    let subject = PublishSubject<Void>()
    
    let target = scene.instantiate()
    
    switch style {
    case .root:
      currentVC = target
      window.rootViewController = target
      subject.onCompleted()
      
    case .push:
      guard let navi = currentVC.navigationController else {
        subject.onError(TransitionError.navigationControllerMissing)
        break
      }
      
      navi.pushViewController(target, animated: animated)
      currentVC = target
      subject.onCompleted()
      
    case .modal:
      currentVC.present(target, animated: animated) {
        subject.onCompleted()
      }
      currentVC = target
    }
    return subject.ignoreElements()
  }
  
  @discardableResult
  func close(animated: Bool) -> Completable {
    return Completable.create { [unowned self] completable in
      if let presentingVC = self.currentVC.presentingViewController {
        self.currentVC.dismiss(animated: animated) {
          self.currentVC = presentingVC
          completable(.completed)
        }
      } else if let navi = self.currentVC.navigationController {
        guard navi.popViewController(animated: animated) != nil else {
          completable(.error(TransitionError.cannotPop))
          return Disposables.create()
        }
        self.currentVC = navi.viewControllers.last!
        completable(.completed)
      } else {
        completable(.error(TransitionError.unknown))
      }
      return Disposables.create()
    }
  }
}
