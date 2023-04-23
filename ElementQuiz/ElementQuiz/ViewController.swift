//
//  ViewController.swift
//  ElementQuiz
//
//  Created by craig murphy on 3/27/23.
//

import UIKit

enum Mode {
    case flashCard
    case quiz
}

enum State {
    case question
    case answer
    case score
}

class ViewController: UIViewController, UITextFieldDelegate {
    let fixedElementList = ["Carbon", "Gold", "Chlorine", "Sodium"]
    var elementList: [String] = []
    var currentElementIndex = 0

    ///quiz only variables
    var answerIsCorrect = false
    var correctAnswerCount = 0
    
    var mode : Mode = .flashCard {
        didSet {
            switch mode {
            case .flashCard:
                setUpFlashCards()
            case .quiz:
                setUpQuiz()
            }
            updateUI()
        }
    }
    
    var state : State = .question

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var modeSelector: UISegmentedControl!
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var showAnswerButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBAction func switchModes(_ sender: Any) {
        if modeSelector.selectedSegmentIndex == 0 {
            mode = .flashCard
        } else {
            mode = .quiz
        }
    }
    
    @IBAction func showAnswer(_ sender: Any) {
        state = .answer
        
        updateUI()
    }
    
    @IBAction func next(_ sender: Any) {
        currentElementIndex += 1
        if currentElementIndex >= elementList.count {
            currentElementIndex = 0
            if mode == .quiz {
                state = .score
                updateUI()
                return
            }
        }
        
        state = .question
        
        updateUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mode = .flashCard
    }

    ///Update the app's UI based on it's mode and state
    func updateUI() {
        //Shared code for updating the image
        let elementName = elementList[currentElementIndex]
        let image = UIImage(named: elementName)
        imageView.image = image
        
        switch mode {
        case .flashCard: updateFlashCardUI(elementName: elementName)
        case .quiz: updateQuizUI(elementName: elementName)
        }
    }
    
    ///updates the apps UI in flsahCard mode
    func updateFlashCardUI(elementName: String) {
        //buttons
        showAnswerButton.isHidden = false
        nextButton.isEnabled = true
        nextButton.setTitle("Next Element", for: .normal)
        
        //Segmented Control
        modeSelector.selectedSegmentIndex = 0
        
        //textfield and keyboard
        textField.isHidden = true
        textField.resignFirstResponder()
        
        //Answer label
        if state == .answer {
            answerLabel.text = elementName
        } else {
            answerLabel.text = "?"
        }
        
    }

    ///update the apps UI in quiz mode
    func updateQuizUI(elementName: String){
        //Buttons
        showAnswerButton.isHidden = true
        if currentElementIndex == elementList.count - 1 {
            nextButton.setTitle("Show Score", for: .normal)
        } else {
            nextButton.setTitle("Next Question", for: .normal)
        }
        
        switch state {
        case .question:
            nextButton.isEnabled = false
        case .answer:
            nextButton.isEnabled = true
        case .score:
            nextButton.isEnabled = false
        }
        
        //Segmented Control
        modeSelector.selectedSegmentIndex = 1
        
        //made multiple switch states to test the code and to update ONLY one area at a time
        //textField and keyboard
        textField.isHidden = false
        switch state {
        case .question:
            textField.isEnabled = true
            textField.text = ""
            textField.becomeFirstResponder()
        case .answer:
            textField.isEnabled = false
            textField.resignFirstResponder()
        case .score:
            textField.isHidden = true
            textField.resignFirstResponder()
        }
        
        //Answer label
        switch state {
        case .question:
            answerLabel.text = " "
        case .answer:
            if answerIsCorrect {
                answerLabel.text = "Correct!"
            } else {
                answerLabel.text = "❌\n Correct Answer: " + elementName
            }
        case .score:
            answerLabel.text = ""
        }
        
        if state == .score {
            displayScoreAlert()
        }
    }
    
    ///Runs after the user hits return/Enter on the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        ///get the text from the text field
        let textFieldContents = textField.text!
        ///Determine if the answer is correct and update appropriately
        if textFieldContents.lowercased() == elementList[currentElementIndex].lowercased() {
            answerIsCorrect = true
            correctAnswerCount += 1
        } else {
            answerIsCorrect = false
        }
        
        state = .answer
        
        updateUI()
        
        return true
    }
    
    ///Shows an IOs Alert with the users quiz score
    func displayScoreAlert() {
        let alert = UIAlertController(title: "Quiz Score", message: "Your score is \(correctAnswerCount) out of \(elementList.count)", preferredStyle: .alert)
        
        //create the dismiss action and pass in our own function to be called once we hit ok
        let dismissAction = UIAlertAction(title: "Ok", style: .default, handler: scoreAlertDismissed(_:))
        //add the dismissAction to the alert
        alert.addAction(dismissAction)
        
        //show the user the alert
        present(alert, animated: true, completion: nil)
    }
    
    ///Reset to flashcard mode after the quiz score alert is dismissed
    func scoreAlertDismissed(_ action: UIAlertAction){
        mode = .flashCard
    }
    
    //sets up a new flashcard session
    func setUpFlashCards() {
        state = .question
        currentElementIndex = 0
        elementList = fixedElementList
    }
    
    //sets up a new quiz
    func setUpQuiz() {
        state = .question
        currentElementIndex = 0
        answerIsCorrect = false
        correctAnswerCount = 0
        elementList = fixedElementList.shuffled()
    }
}

