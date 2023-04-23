//
//  ViewController.swift
//  RPS
//
//  Created by craig murphy on 3/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    var gameState = GameStates.start

    @IBOutlet weak var computerSign: UILabel!
    @IBOutlet weak var gameResult: UILabel!
    @IBOutlet weak var rock: UIButton!
    @IBOutlet weak var paper: UIButton!
    @IBOutlet weak var scissors: UIButton!
    @IBOutlet weak var playAgain: UIButton!
    
    @IBAction func rockSelected(_ sender: Any) {
        let mySign = Sign.rock
        play(mySign: mySign)
    }
    
    @IBAction func paperSelected(_ sender: Any) {
        let mySign = Sign.paper
        play(mySign: mySign)
    }
    
    
    @IBAction func scissorsSelected(_ sender: Any) {
        let mySign = Sign.scissors
        play(mySign: mySign)
    }
    
    private func play(mySign: Sign) {
        rock.isEnabled = false
        paper.isEnabled = false
        scissors.isHidden = false
        playAgain.isHidden = false
        
        if (mySign == .rock){
            paper.isHidden = true
            scissors.isHidden = true
        } else if (mySign == .paper) {
            rock.isHidden = true
            scissors.isHidden = true
        } else {
            rock.isHidden = true
            paper.isHidden = true
        }
        
        let computerSign = randomSign()
        self.computerSign.text = computerSign.sign
        
        gameState = mySign.compareSigns(opponentSign: computerSign)
        
        if (gameState == .win){
            rock.isEnabled = false
            paper.isEnabled = false
            scissors.isEnabled = false
            gameResult.text = "You Win!"
            view.backgroundColor = .green
        } else if (gameState == .lose){
            rock.isEnabled = false
            paper.isEnabled = false
            scissors.isEnabled = false
            gameResult.text = "You Lose!"
            view.backgroundColor = .red
        } else {
            rock.isEnabled = false
            paper.isEnabled = false
            scissors.isEnabled = false
            gameResult.text = "Draw!"
        }
        
    }
    
    
    @IBAction func playAgainSelected(_ sender: Any) {
        gameState = .start
        initialLoad()
    }
    
    private func initialLoad(){
        playAgain.isHidden = true
        rock.isHidden = false
        paper.isHidden = false
        scissors.isHidden = false
        rock.isEnabled = true
        paper.isEnabled = true
        scissors.isEnabled = true
        self.gameResult.text = "Rock, Paper, Scissors?"
        self.computerSign.text = "🤖"
        self.view.backgroundColor = .gray
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initialLoad()
       
    }


}

