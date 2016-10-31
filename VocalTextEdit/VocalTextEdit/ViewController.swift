//
//  ViewController.swift
//  VocalTextEdit
//
//  Created by Sergiy Blednov on 10/16/16.
//  Copyright © 2016 Sergiy Blednov. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSSpeechSynthesizerDelegate {

    let speechSynthesizer = NSSpeechSynthesizer()
    
    @IBOutlet var textView: NSTextView!
    @IBOutlet var speakButton: NSButton!
    @IBOutlet var indicator: NSProgressIndicator!
    
    var contents: String? {
        get {
            return textView.string
        }
        set {
            textView.string = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        speechSynthesizer.delegate = self
        indicator.isHidden = true;
    }
    
    @IBAction func speakButtonClicked(sender: NSButton) {
        sender.isEnabled = false
        if let contents = textView.string , !contents.isEmpty {
            speechSynthesizer.startSpeaking(contents)
        } else {
            speechSynthesizer.startSpeaking("The document is empty.")
        }
    }
    
    @IBAction func stopButtonClicked(sender: NSButton) {
        speechSynthesizer.stopSpeaking()
    }
    
//NSSpeechSynthesizerDelegate
    
    func speechSynthesizer(_ sender: NSSpeechSynthesizer, didFinishSpeaking finishedSpeaking: Bool) {
        speakButton.isEnabled = true
        indicator.doubleValue = 0
        indicator.isHidden = true;
    }
    
    func speechSynthesizer(_ sender: NSSpeechSynthesizer, willSpeakWord characterRange: NSRange, of string: String) {
        indicator.isHidden = false;
        indicator.doubleValue = 100 * Double(characterRange.location + characterRange.length) / Double(string.characters.count)
    }
}

