//
//  KeyboardViewController.swift
//  CalKeyboard
//
//  Created by Gene Yoo on 9/15/15.
//  Copyright © 2015 iOS Decal. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    @IBOutlet var deleteButton: UIButton!
    @IBOutlet var returnButton: UIButton!
    @IBOutlet var spaceButton: UIButton!
    @IBOutlet var fetchButton: UIButton!
    @IBOutlet var getInLoserButton: UIButton!
    @IBOutlet var sitButton: UIButton!
    @IBOutlet var imSickButton: UIButton!
    @IBOutlet var obsessedButton: UIButton!
    @IBOutlet var doesntGoHereButton: UIButton!

    var keyboardView: UIView!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadInterface()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    }
    
    func thatsSoFetchText() {
        self.textDocumentProxy.insertText("That's so fetch!")
    }
    
    func getInLoserText() {
        self.textDocumentProxy.insertText("Get in, loser. We're going shopping.")
    }
    
    func cantSitWithUsText() {
        self.textDocumentProxy.insertText("You can’t sit with us!")
    }
    
    func cantGoOutText() {
        self.textDocumentProxy.insertText("I can't go out. *cough* *cough* I'm sick.")
    }
    
    func obsessedText() {
        self.textDocumentProxy.insertText("Why are you so obsessed with me?")
    }
    
    func doesntGoHereText() {
        self.textDocumentProxy.insertText("She doesn't even go here!")
    }
    
    func delete() {
        self.textDocumentProxy.deleteBackward()
    }
    
    func newLine() {
        self.textDocumentProxy.insertText("\n")
    }
    
    func space() {
        self.textDocumentProxy.insertText(" ")
    }
    
    func setUpButtonBorder() {
        let buttonArr: [UIButton] = [nextKeyboardButton, deleteButton, returnButton, spaceButton, fetchButton, getInLoserButton, sitButton, imSickButton, obsessedButton, doesntGoHereButton]
        for button in buttonArr {
            if (button == nextKeyboardButton || button == deleteButton || button == spaceButton || button == returnButton) {
                button.layer.cornerRadius = 5
            } else {
                button.layer.cornerRadius = 1
            }
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.whiteColor().CGColor
        }
    }
    
    
    func loadInterface() {
        let keyboardNib = UINib(nibName: "Keyboard", bundle: nil)
        keyboardView = keyboardNib.instantiateWithOwner(self, options: nil)[0] as! UIView
        keyboardView.frame = view.frame
        view.addSubview(keyboardView)
        view.backgroundColor = keyboardView.backgroundColor
        nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
        returnButton.addTarget(self, action: "newLine", forControlEvents: .TouchUpInside)
        deleteButton.addTarget(self, action: "delete", forControlEvents: .TouchUpInside)
        spaceButton.addTarget(self, action: "space", forControlEvents: .TouchUpInside)
        fetchButton.addTarget(self, action: "thatsSoFetchText", forControlEvents: .TouchUpInside)
        getInLoserButton.addTarget(self, action: "getInLoserText", forControlEvents: .TouchUpInside)
        sitButton.addTarget(self, action: "cantSitWithUsText", forControlEvents: .TouchUpInside)
        imSickButton.addTarget(self, action: "cantGoOutText", forControlEvents: .TouchUpInside)
        obsessedButton.addTarget(self, action: "obsessedText", forControlEvents: .TouchUpInside)
        doesntGoHereButton.addTarget(self, action: "doesntGoHereText", forControlEvents: .TouchUpInside)
        
        setUpButtonBorder()

    }


}
