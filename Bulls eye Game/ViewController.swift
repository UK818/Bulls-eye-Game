//
//  ViewController.swift
//  Bulls eye Game
//
//  Created by mac on 23/10/2021.
//

import UIKit

class ViewController: UIViewController {
	
	var currentValue: Int = 0

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}
	
	@IBAction func sliderMoved (_ slider:UISlider ) {
		
		print("The value of the slider is now: \(slider.value) ")
		
		currentValue = lroundf(slider.value)
		
	}
	
	@IBAction func alert () {
		
		let message = "The value of the slider is now: \(currentValue)"
		
		let alert = UIAlertController(title: "Hit Me", message: message, preferredStyle: .alert)
		
		let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
		
		alert.addAction(action)
		
		present(alert, animated: true, completion: nil)
		
	}


}

