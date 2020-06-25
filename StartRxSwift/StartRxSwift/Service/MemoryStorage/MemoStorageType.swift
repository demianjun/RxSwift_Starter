//
//  MemoStorageType.swift
//  StartRxSwift
//
//  Created by Demian on 2020/06/24.
//  Copyright © 2020 Demian. All rights reserved.
//

import Foundation
import RxSwift

protocol MemoStorageType {
  @discardableResult
  func createMemo(content: String) -> Observable<Memo>
  
  @discardableResult
  func memoList() -> Observable<[MemoSectionModel]>
  
  @discardableResult
  func update(memo: Memo, content: String) -> Observable<Memo>
  
  @discardableResult
  func delete(memo: Memo) -> Observable<Memo>
  
}
