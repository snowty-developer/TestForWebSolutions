//
//  ViewController.swift
//  TestForWebSolutions
//
//  Created by Александр Зубарев on 15.04.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heightIcon: NSLayoutConstraint!
    @IBOutlet weak var widthIcon: NSLayoutConstraint!
    @IBOutlet weak var topIcon: NSLayoutConstraint!
    @IBOutlet weak var traillingIcon: NSLayoutConstraint!
    @IBOutlet weak var leadingIcon: NSLayoutConstraint!
    var top, leading, trailling, width, height, alpha: CGFloat?
    
    var timer: Timer!
    @IBOutlet weak var connectButton: UIButton!
    @IBOutlet weak var cityLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        top = topIcon.constant
        leading = leadingIcon.constant
        trailling = traillingIcon.constant
        width = widthIcon.constant
        height = heightIcon.constant
        alpha = connectButton.alpha
    }


    @objc func loading() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .autoreverse, animations: {
            self.connectButton.alpha = 0.3
            self.topIcon.constant -= 5.0
            self.leadingIcon.constant -= 5.0
            self.traillingIcon.constant -= 5.0
            self.heightIcon.constant += 10.0
            self.widthIcon.constant += 10.0
        }, completion: {_ in
            self.topIcon.constant = self.top!
            self.leadingIcon.constant = self.leading!
            self.traillingIcon.constant = self.trailling!
            self.heightIcon.constant = self.height!
            self.widthIcon.constant = self.width!
            self.connectButton.alpha = self.alpha!
        })
    }
    
    @IBAction func startConnect(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(loading), userInfo: nil, repeats: true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            self.timer.invalidate()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? SecondViewController {
            vc.delegate = self
            vc.indexCity = cityLabel.text!
        }
    }
    
}

extension ViewController: vpn {
    func setCity(_ city: String) {
        cityLabel.text = city
    }
}

