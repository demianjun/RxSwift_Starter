//
//  MainViewController.swift
//  StartRxSwift
//
//  Created by Demian on 2020/06/24.
//  Copyright © 2020 Demian. All rights reserved.
//

import UIKit
import SnapKit
import Then

class MemoDetailViewController: UIViewController, ViewModelBindableType {
  var viewModel: MemoDetailViewModel!
  
  let memoDetailNavi = UINavigationController().then {
    $0.navigationBar.prefersLargeTitles = true
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .yellow
    self.title = "메모 보기"
  }
  
  func bindViewModel() {
    
  }
  
}
