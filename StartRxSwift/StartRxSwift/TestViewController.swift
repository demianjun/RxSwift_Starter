//
//  ViewController.swift
//  StartRxSwift
//
//  Created by Demian on 2020/05/19.
//  Copyright © 2020 Demian. All rights reserved.
//

import UIKit
import RxSwift

class TestViewController: UIViewController {
  
  let url = "http://www.google.com"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    testSubscribe()
  }
  
  // MARK: 비동기로 생기는 데이터를 Observable로 감싸서 리턴하는 방법
  //func testJson(_ url: String) -> Observable<String?> {
  //  return Observable.create { testData in
  //    DispatchQueue.global().async {
  //      let url = URL(string : url)!
  //      guard let data = try? Data(contentsOf: url) else { return }
  //      let json = String(data: data, encoding: .utf8)
  //
  //      DispatchQueue.main.async {
  //        testData.onNext(json)
  //        testData.onCompleted()
  //      }
  //    }
  //    return Disposables.create()
  //  }
  //}
  
  func testJson(_ url: String) -> Observable<String?> {
    return Observable.create { testData in
      let url = URL(string: url)!
      let task = URLSession.shared.dataTask(with: url) { (data, _, err) in
        if err != nil {
          testData.onError(err!)
        }

        if let data = data, let json = String(data: data, encoding: .utf8) {
          testData.onNext(json)
        }
        testData.onCompleted()
      }

      task.resume()

      return Disposables.create() {
        task.cancel()
      }
    }
  }

  // MARK: Observable로 오는 데이터를 받아서 처리하는 방버
  func testDataProcessing() {
   _ = testJson(url)
      .subscribe { event in
        switch event {
        case let .next(json):
          guard let json = json else { return }
          print("\(json)")

        case .completed: break

        case .error: break
        }
    }
  }
  

  func testObservable() -> Observable<String?> {
    return Observable.just("asdjklfhasiduhfiasjklokjhgaskjgfauiweghjkasdnfhjkasgdfjkghasdjkifha")
  }
  
  func testSubscribe() {
    _ = testObservable()
      .map { txt in txt?.count ?? 0 }
      .filter { cnt in cnt > 0 }
      .observeOn(MainScheduler.instance) // Dispatchqueue 대신 사용, operator라고 부름
      .subscribe(onNext: {
        print("글자수: \($0)")
      })
  }
}



