//
//  OnboardingFlow.swift
//  RxFlowDemo
//
//  Created by Thibault Wittemberg on 18-02-11.
//  Copyright © 2018 RxSwiftCommunity. All rights reserved.
//

import Foundation
import RxFlow

class OnboardingFlow: Flow {

    var root: Presentable {
        return self.rootViewController
    }

    private let rootViewController = UINavigationController()
    private let services: AppServices

    init(withServices services: AppServices) {
        self.services = services
    }

    func navigate(to step: Step) -> NextFlowItems {
        return NextFlowItems.stepNotHandled
    }

    private func navigationToApiScreen () -> NextFlowItems {
        let settingsViewController = SettingsViewController.instantiate()
        self.rootViewController.pushViewController(settingsViewController, animated: false)
        return NextFlowItems.one(flowItem: NextFlowItem(nextPresentable: settingsViewController, nextStepper: settingsViewController))
    }

}
