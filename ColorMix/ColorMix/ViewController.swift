//
//  ViewController.swift
//  ColorMix
//
//  Created by craig murphy on 3/1/23.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var blueSwitch: UISwitch!
    @IBOutlet weak var redSwitch: UISwitch!
    @IBOutlet weak var greenSwitch: UISwitch!
    @IBOutlet weak var colorView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateControls()
        colorView.layer.borderWidth = 5
        colorView.layer.cornerRadius = 20
        colorView.layer.borderColor = UIColor.black.cgColor
        updateColor()
    }

    @IBAction func switchChanged(_ sender: UISwitch) {
        updateControls()
       updateColor()
    }
    
    func updateColor(){
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        if greenSwitch.isOn {
            green = CGFloat(greenSlider.value)
        }
        if redSwitch.isOn {
            red = CGFloat(redSlider.value)
        }
        if blueSwitch.isOn {
            blue = CGFloat(blueSlider.value)
        }
        
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
        colorView.backgroundColor = color
    }

    
    @IBAction func sliderChanged(_ sender: Any) {
        updateColor()
    }
    @IBAction func reset(_ sender: Any) {
        greenSlider.value = 1
        redSlider.value = 1
        blueSlider.value = 1
        greenSwitch.isOn = false
        redSwitch.isOn = false
        blueSwitch.isOn = false
        updateControls()
        updateColor()
    }
    
    func updateControls() {
        redSlider.isEnabled = redSwitch.isOn
        greenSlider.isEnabled = greenSwitch.isOn
        blueSlider.isEnabled = blueSwitch.isOn
    }
}

