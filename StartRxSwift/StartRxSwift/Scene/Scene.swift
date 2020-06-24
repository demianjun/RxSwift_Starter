//
//  Scene.swift
//  StartRxSwift
//
//  Created by Demian on 2020/06/24.
//  Copyright © 2020 Demian. All rights reserved.
//

import UIKit

enum Scene {
  case list(MemoListViewModel)
  case detail(MemoDetailViewModel)
  case compose(MemoComposeViewModel)
}

extension Scene {
  func instantiate(from storyboard: String = "Main") -> UIViewController {
    let storyboard = UIStoryboard(name: storyboard, bundle: nil)
    
    switch self {
    case .list(let viewModel):
      guard let navi = storyboard.instantiateViewController(withIdentifier: "ListNavi") as? UINavigationController else { fatalError() }
      
      guard var listVC = navi.viewControllers.first as? MemoListViewController else { fatalError() }
      
      listVC.bind(viewModel: viewModel)
      return navi
      
    case .detail(let viewModel):
      guard var detailVC = storyboard.instantiateViewController(withIdentifier: "DetailVC") as? MemoDetailViewController else { fatalError() }
      
      detailVC.bind(viewModel: viewModel)
      return detailVC
      
    case .compose(let viewModel):
      guard let navi = storyboard.instantiateViewController(withIdentifier: "ComposeNavi") as? UINavigationController else { fatalError() }
      
      guard var composeVC = navi.viewControllers.first as? MemoComposeViewController else { fatalError() }
      
      composeVC.bind(viewModel: viewModel)
      return navi
    }
  }
}
