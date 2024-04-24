//
//  ContainerView.swift
//  Mew
//
//  Created by tarunon on 2018/04/02.
//  Copyright © 2018 Mercari. All rights reserved.
//

import UIKit

/// A view that makes it easier to deal with UIViewControllers by splitting them up into smaller pieces.
/// This helps to avoid monolithic ViewControllers and complicated Interface Builder files.
public class ContainerView: UIStackView {
    var latestAddedContainer: ContainerViewContainerProtocol?

    /// The viewController will be added as a childViewController of parentViewController that has self (`ContainerView`)
    /// When calling this function arbitrarily, arranged of ViewController by container is not guaranteed.
    public func addArrangedViewController(_ viewController: UIViewController, parentViewController: UIViewController) {
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        parentViewController.addChild(viewController)
        addArrangedSubview(viewController.view)
        viewController.didMove(toParent: parentViewController)
    }

    /// The viewController will be inserted at the specified index as a childViewController of parentViewController that self (`ContainerView`)
    /// When calling this function arbitrarily, arranged of ViewController by container is not guaranteed.
    public func insertArrangedViewController(_ viewController: UIViewController, stackIndex: Int, parentViewController: UIViewController) {
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        parentViewController.addChild(viewController)
        insertArrangedSubview(viewController.view, at: stackIndex)
        viewController.didMove(toParent: parentViewController)
    }

    /// The viewController will be removed from self (`ContainerView`)
    /// When calling this function arbitrarily, arranged of ViewController by container is not guaranteed.
    public func removeArrangedViewController(_ viewController: UIViewController) {
        viewController.willMove(toParent: nil)
        removeArrangedSubview(viewController.view)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
}
