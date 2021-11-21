//
//  ViewController.swift
//  HackApp
//
//  Created by Leonardo Redivo on 11/20/21.
//

import UIKit

class ViewController: UIViewController {
    
    
   
    @IBOutlet weak var ProgressBar: UIProgressView!
    @IBOutlet weak var BackButton: UIButton!
    @IBOutlet weak var LowerText: UILabel!
    @IBOutlet weak var TopText: UILabel!
    @IBOutlet weak var MidImages: UIImageView!
    @IBOutlet weak var StartButton: UIButton!
    @IBOutlet weak var LeftButton: UIButton!
    @IBOutlet weak var RightButton: UIButton!
    
    var screenOn:Int = 1
    var petNum:Int = 1
    var phaseNum:Int = 1
    
    var timer:Timer = Timer()
    var seconds = 20
    
    var progress:Float = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        BackButton.setTitleColor(UIColor.black, for: .normal)
        TopText.textColor = UIColor.black
        LowerText.textColor = UIColor.black
        StartButton.tintColor = UIColor.black
        StartButton.titleLabel?.font = UIFont.init(name: "Futura", size: 24)

    }
    @objc func timerClass(){
        seconds -= 1
        progress += 0.05
        ProgressBar.progress = progress
        if(seconds == 17){
            phaseNum = 2;
            TopText.text = String("You Got This!!")
            MidImages.image = UIImage(named: "Pet\(petNum).\(phaseNum)")
        }
        
        if(seconds == 0){
            timer.invalidate()
            seconds = 20
            phaseNum = 3
            TopText.text = String("Hooray! You did it!")
            LowerText.text = String("Take a quick 15 minute break!")
            StartButton.setTitle("Start Timer", for: .normal)
            MidImages.image = UIImage(named: "Pet\(petNum).\(phaseNum)")
            ProgressBar.trackTintColor = UIColor(red: 245/255.0, green: 224/255.0, blue: 159/255.0, alpha: 1)
            ProgressBar.progressTintColor = UIColor(red: 245/255.0, green: 224/255.0, blue: 159/255.0, alpha: 1)
        }
    }

    @IBAction func ButtonPressed(_ sender: Any) {
        
        
        screenOn += 1
        
        
        if(screenOn == 2){
            Screen2()
        }
        if(screenOn == 3){
            Screen3()
        }
        if(screenOn == 4){
            Screen4()
        }
    }
    
  
    @IBAction func RightButtonPress(_ sender: Any) {
        if(petNum <= 2){
            petNum+=1
            MidImages.image = UIImage(named: "Pet\(petNum).1")
            if(petNum == 1){
                LowerText.text = String("This is Teddy")
            }
            else if(petNum == 2){
                LowerText.text = String("This is Joe")
            }
            else{
                LowerText.text = String("This is Bella")
            }
            
            
        }
        else{
            petNum = 1
            MidImages.image = UIImage(named: "Pet1.1")
            LowerText.text = String("This it Teddy")
        }
    }
    
    @IBAction func LeftButtonPress(_ sender: Any) {
        if(petNum >= 2){
            petNum-=1
            MidImages.image = UIImage(named: "Pet\(petNum).1")
            if(petNum == 1){
                LowerText.text = String("This is Teddy")
            }
            else if(petNum == 2){
                LowerText.text = String("This is Joe")
            }
            
            else{
                LowerText.text = String("This is Bella")
            }
        }
        else{
            petNum = 3
            MidImages.image = UIImage(named: "Pet4.1")
            LowerText.text = String("This is Bella")
        }
    }
    
    
    @IBAction func BackButtonPress(_ sender: Any) {
        if(screenOn == 2){
            Screen1()
            screenOn = 1
            
        }
        if(screenOn == 3)
        {
            Screen2()
            screenOn = 2
        }
        
    }
    
    func Screen1(){
        BackButton.setTitle("", for: .normal)
        TopText.text = String("ProcrasoPet")
        MidImages.image = UIImage(named: "Logo")
        StartButton.setTitle("Start", for: .normal)
    }
    
    func Screen2(){
        BackButton.setTitle("<--", for: .normal)
        TopText.text = String("Choose Your Pet!")
        LowerText.text = String("This is Teddy")
        MidImages.image = UIImage(named: "Pet1.1")
        StartButton.setTitle("Choose", for: .normal)
        RightButton.setTitle(">", for: .normal)
        LeftButton.setTitle("<", for: .normal)
        ProgressBar.trackTintColor = UIColor(red: 245/255.0, green: 224/255.0, blue: 159/255.0, alpha: 1)
        ProgressBar.progressTintColor = UIColor(red: 245/255.0, green: 224/255.0, blue: 159/255.0, alpha: 1)

    }
    func Screen3(){
        timer.invalidate()
        RightButton.setTitle("", for: .normal)
        LeftButton.setTitle("", for: .normal)
        LowerText.text = String("")
        TopText.text = String("Stay Focused!")
        ProgressBar.progress = progress
        ProgressBar.progressTintColor = UIColor.black
        ProgressBar.trackTintColor = UIColor(red: 247/255.0, green: 165/255.0, blue: 53/255.0, alpha: 1)
        StartButton.setTitle("Start Timer", for: .normal)
    }
    func Screen4(){
        StartButton.setTitle("Stop Timer", for: .normal)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.timerClass), userInfo: nil, repeats: true)
        screenOn = 2
    }
    
}

