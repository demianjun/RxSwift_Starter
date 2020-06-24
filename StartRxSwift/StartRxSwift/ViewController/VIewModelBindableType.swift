//
//  VIewModelBindableType.swift
//  StartRxSwift
//
//  Created by Demian on 2020/06/24.
//  Copyright © 2020 Demian. All rights reserved.
//

import UIKit

protocol ViewModelBindableType {
  associatedtype ViewModelType
  
  var viewModel: ViewModelType! { get set }
  func bindViewModel()
}


extension ViewModelBindableType where Self: UIViewController {
  mutating func bind(viewModel: Self.ViewModelType) {
    self.viewModel = viewModel
    loadViewIfNeeded()
    
    bindViewModel()
  }
}
