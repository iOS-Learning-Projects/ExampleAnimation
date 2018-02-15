//
//  ViewController.swift
//  ExampleAnimation
//
//  Created by Eduardo Vital Alencar Cunha on 25/08/17.
//  Copyright © 2017 VCode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var corImageView: UIImageView!
    @IBOutlet weak var verticalConstraing: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.verticalConstraing.constant -= self.view.bounds.width
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        self.verticalConstraing.constant += self.view.bounds.width

        UIView.animate(withDuration: 0.5, delay: 0.3, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }

    @IBAction func animateButton(_ sender: UIButton) {
        self.bounceCorImageView()
        self.verticalConstraing.constant -= self.view.bounds.width

        UIView.animate(withDuration: 0.5, delay: 0.3, options: .curveEaseIn, animations: {


            self.view.layoutIfNeeded()
        }, completion: nil)
    }

    func hideShowCorImageView() {
        UIView.animate(withDuration: 2,
                       delay: 3,
                       options: .curveLinear,
                       animations: {
            self.corImageView.alpha = 0
        }) { success in
            if success {
                UIView.animate(withDuration: 3) {
                    self.corImageView.alpha = 1
                }
            }
        }

    }

    func bounceCorImageView() {
        UIView.animate(withDuration: 1,
                       delay: 0.25,
                       options: [.autoreverse, .repeat],
                       animations: {
            self.corImageView.frame.origin.y -= 20
        })
    }

}
