//
//  MemoListViewController.swift
//  StartRxSwift
//
//  Created by Demian on 2020/06/24.
//  Copyright © 2020 Demian. All rights reserved.
//

import UIKit
import SnapKit
import Then

class MemoListViewController: UIViewController, ViewModelBindableType {
  var viewModel: MemoListViewModel!
  
  let memoListNavi = UINavigationController().then {
    $0.navigationBar.prefersLargeTitles = true
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .blue
    self.title = "메모 목록"
    
  }
  
  func bindViewModel() {
    
  }
}
