//
//  CardSelectionVC.swift
//  CardWorkoutStoryboard
//
//  Created by Priyanshu Gupta on 25/02/24.
//

import UIKit

class CardSelectionVC: UIViewController {
    var timer:Timer!
    var card:[UIImage]=Card.allValues
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var ruleButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
        stopButton.layer.cornerRadius=8
        restartButton.layer.cornerRadius=8
        ruleButton.layer.cornerRadius=8
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }

    func startTimer() {
        timer=Timer.scheduledTimer(timeInterval: 0.125, target: self, selector: #selector(showRandomImage),userInfo: nil, repeats: true)
    }
    @objc func showRandomImage(){
        cardImageView.image=card.randomElement() ?? UIImage(named: "AS")
    }
    @IBAction func stopButtonTapped(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func restartButtonTapped(_ sender: Any) {
        timer.invalidate()
        startTimer()
    }
    
    @IBAction func rulesButtonTapped(_ sender: Any) {
    }
    
}
