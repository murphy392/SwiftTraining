//
//  ViewController.swift
//  MemeMaker
//
//  Created by craig murphy on 3/26/23.
//

import UIKit

class ViewController: UIViewController {
    
    let topChoices = [CaptionOption(emoji: "🕶️", caption: "You know what's cool?"),
        CaptionOption(emoji: "💢", caption: "You know what makes me mad?"),
        CaptionOption(emoji: "💕", caption: "You know what I love?")]
    
    let bottomChoices = [CaptionOption(emoji: "🐱", caption: "Cats wearing hats!"),
        CaptionOption(emoji: "🐶", caption: "Dogs carrying logs!"),
        CaptionOption(emoji: "🐒", caption: "Monkeys being funky!")]

    @IBOutlet weak var topCaptionLabel: UILabel!
    @IBOutlet weak var bottomCaptionLabel: UILabel!
    @IBOutlet weak var topSegmentedControl: UISegmentedControl!
    @IBOutlet weak var bottomSegmentedControl: UISegmentedControl!

    @IBAction func topSegmentedAction(_ sender: Any) {
        updateCaptions()
    }
    
  
    @IBAction func bottomSegmentedAction(_ sender: Any) {
        updateCaptions()
    }
    
    func updateCaptions () {
        let topIndex = topSegmentedControl.selectedSegmentIndex
        topCaptionLabel.text = topChoices[topIndex].caption
        
        let bottomIndex = bottomSegmentedControl.selectedSegmentIndex
        bottomCaptionLabel.text = bottomChoices[bottomIndex].caption
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ///remove all segments from the top and the bottom
        topSegmentedControl.removeAllSegments()
        bottomSegmentedControl.removeAllSegments()
        
        for choice in topChoices {
            topSegmentedControl.insertSegment(withTitle: choice.emoji, at: topChoices.count, animated: false)
        }
        topSegmentedControl.selectedSegmentIndex = 0
        
        for choice in bottomChoices {
            bottomSegmentedControl.insertSegment(withTitle: choice.emoji, at: bottomChoices.count, animated: false)
        }
        bottomSegmentedControl.selectedSegmentIndex = 0
        
        updateCaptions()
        
    }
    
    @IBAction func dragTopLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
            topCaptionLabel.center = sender.location(in: view)
        }
        
    }
    
    @IBAction func dragBottomLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
            bottomCaptionLabel.center = sender.location(in: view)
        }
    }
}

