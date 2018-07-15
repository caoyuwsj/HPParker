/*
Copyright 2016-present the Material Components for iOS authors. All Rights Reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

import Foundation
import MaterialComponents.MaterialAppBar
import MaterialComponents.MaterialAppBar_ColorThemer
import MaterialComponents.MaterialAppBar_TypographyThemer

class AppBarTypicalUseSwiftExample: UITableViewController {

  // Step 1: Create and initialize an App Bar.
  let appBar = MDCAppBar()
  var colorScheme = MDCSemanticColorScheme()
  var typographyScheme = MDCTypographyScheme()

  init() {
    super.init(nibName: nil, bundle: nil)

    self.title = "App Bar (Swift)"

    // Step 2: Add the headerViewController as a child.
    self.addChildViewController(appBar.headerViewController)
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    MDCAppBarColorThemer.applySemanticColorScheme(colorScheme, to: appBar)
    MDCAppBarTypographyThemer.applyTypographyScheme(typographyScheme, to: appBar)
    
    // Recommended step: Set the tracking scroll view.
    appBar.headerViewController.headerView.trackingScrollView = self.tableView

    // Step 2: Register the App Bar views.
    appBar.addSubviewsToParent()

    self.tableView.layoutMargins = UIEdgeInsets.zero
    self.tableView.separatorInset = UIEdgeInsets.zero

    self.navigationItem.rightBarButtonItem =
      UIBarButtonItem(title: "Right", style: .done, target: nil, action: nil)
  }

  // Optional step: If you allow the header view to hide the status bar you must implement this
  //                method and return the headerViewController.
  override var childViewControllerForStatusBarHidden: UIViewController? {
    return appBar.headerViewController
  }

  // Optional step: The Header View Controller does basic inspection of the header view's background
  //                color to identify whether the status bar should be light or dark-themed.
  override var childViewControllerForStatusBarStyle: UIViewController? {
    return appBar.headerViewController
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    self.navigationController?.setNavigationBarHidden(true, animated: animated)
  }

  override func scrollViewDidScroll(_ scrollView: UIScrollView) {
    if scrollView == appBar.headerViewController.headerView.trackingScrollView {
      appBar.headerViewController.headerView.trackingScrollDidScroll()
    }
  }

  override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    if scrollView == appBar.headerViewController.headerView.trackingScrollView {
      appBar.headerViewController.headerView.trackingScrollDidEndDecelerating()
    }
  }

  override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    let headerView = appBar.headerViewController.headerView
    if scrollView == headerView.trackingScrollView {
      headerView.trackingScrollDidEndDraggingWillDecelerate(decelerate)
    }
  }

  override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    let headerView = appBar.headerViewController.headerView
    if scrollView == headerView.trackingScrollView {
      headerView.trackingScrollWillEndDragging(withVelocity: velocity, targetContentOffset: targetContentOffset)
    }
  }

}

// MARK: Catalog by convention
extension AppBarTypicalUseSwiftExample {
  @objc class func catalogBreadcrumbs() -> [String] {
    return ["App Bar", "App Bar (Swift)"]
  }

  @objc class func catalogIsPrimaryDemo() -> Bool {
    return false
  }

  func catalogShouldHideNavigation() -> Bool {
    return true
  }
}

// MARK: - Typical application code (not Material-specific)

// MARK: UITableViewDataSource
extension AppBarTypicalUseSwiftExample {

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 50
  }

  override func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      var cell = self.tableView.dequeueReusableCell(withIdentifier: "cell")
      if cell == nil {
        cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
      }
      cell!.layoutMargins = UIEdgeInsets.zero
      return cell!
  }

}