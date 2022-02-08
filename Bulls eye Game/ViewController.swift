//
//  ViewController.swift
//  Bulls eye Game
//
//  Created by mac on 23/10/2021.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var score: UILabel!
	@IBOutlet weak var round: UILabel!
	@IBOutlet weak var randomNumber: UILabel!
	@IBOutlet weak var background: UIImageView!
	@IBOutlet weak var slider: UISlider!
	
	var currentValue: Int = 0
	var totalScore: Int = 0
	var count: Int = 1
	var randomNo: Int = 0
	var btnTitle: String = ""
	var message: String = ""
	var alertTitle: String = ""

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		reset()
		background.image = UIImage(named: "bullfight")
	}
	
	@IBAction func sliderMoved (_ slider:UISlider ) {
		currentValue = lroundf(slider.value)
		if currentValue <= (randomNo + 5) && currentValue >= (randomNo - 5) {
			slider.tintColor = .green
		} else {
			slider.tintColor = .red
		}
	}
	
	@IBAction func alert () {
		
		count += 1
		round.text = String(count)
	
		if count <= 5 {
			if count == 5 {
				btnTitle = "Restart"
				alertTitle = "Game Over"
				message = "You are \(totalScore/25) star"
				reset()
			} else {
				if currentValue == randomNo {
					btnTitle = "Awesome"
					alertTitle = "Bravo!!!"
					message = "You Hit the BULLS EYE"
					updateScore()
					resetRandom()
					
				} else {
					btnTitle = "Not bad"
					alertTitle = String(currentValue)
					message = "You alost hit the Bulls eye. Try Again"
					resetRandom()
				}
			}
		}
		
		let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
		let action = UIAlertAction(title: btnTitle, style: .default, handler: nil)
		alert.addAction(action)
		present(alert, animated: true, completion: nil)
		
	}

	@IBAction func startOver(_ sender: Any) {
		reset()
	}
	
	func reset() {
		background.image = UIImage(named: "")
		currentValue = lroundf(slider.value)
		count = 1
		totalScore = 0
		score.text = String(totalScore)
		round.text = String(count)
		resetRandom()
	}
	
	func resetRandom() {
		randomNo = Int.random(in: 1..<100)
		randomNumber.text = String(randomNo)
	}
	
	func updateScore() {
		totalScore += 25
		score.text = String(totalScore)
	}
	
}

