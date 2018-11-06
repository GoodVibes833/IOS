//
//  ViewController.swift
//  AVStoryBookAssignment
//
//  Created by Alex Jintak Han on 2018-11-01.
//  Copyright © 2018 AlexHan. All rights reserved.
//

import UIKit
import CoreServices
import AVFoundation

class StoryViewController: UIViewController {
    
    @IBOutlet weak var stotyImageView: UIImageView!
    @IBOutlet weak var recordButton: UIBarButtonItem!
    @IBOutlet weak var cameraButton: UIBarButtonItem!{
        didSet{
            cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        }
    }
    var audioRecorder: AVAudioRecorder?
    var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1. file path + file Name(uniqueRandomStringProcess_story.caf)
        let fileManager = FileManager.default
        let dirPaths = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let fileName = String(format: "%@_%@", ProcessInfo().globallyUniqueString, "story.caf")
        // full path url : dir/dir/filename
        let soundFileURL = dirPaths[0].appendingPathComponent(fileName)
        
        // 2. configure record settings
        let recordSettings = [AVEncoderAudioQualityKey:AVAudioQuality.min.rawValue,
                              AVEncoderBitRateKey:16,
                              AVNumberOfChannelsKey:2,
                              AVSampleRateKey: 44100.0]
            as[String:Any]
        
        // 3. create a recorder object, prepare to record
        do{
         try audioRecorder = AVAudioRecorder(url: soundFileURL, settings: recordSettings)
            audioRecorder?.prepareToRecord()
            audioRecorder?.delegate = self
        }catch let error as NSError{
            print("audio recorder error: \(error.localizedDescription)")
        }
    }
    
    @IBAction func recordButtonTapped(_ sender: UIBarButtonItem) {
        if audioPlayer?.isPlaying == true{
            audioPlayer?.stop()
        }
        if audioRecorder?.isRecording == false{
            stotyImageView.isUserInteractionEnabled = false
            audioRecorder?.record()
            recordButton.title = "🎙"
            
        }else{
            audioPlayer?.stop()
            recordButton.title = "🔴"
            stotyImageView.isUserInteractionEnabled = true

        }
    }
    
    @IBAction func imageViewTapped(_ sender: UITapGestureRecognizer) {
        if audioRecorder?.isRecording == false{
            do{
                try audioPlayer = AVAudioPlayer(contentsOf: (audioRecorder?.url)!)
                recordButton.isEnabled = false
                audioPlayer?.prepareToPlay()
                audioPlayer?.play()
                recordButton.isEnabled = true // delegate
                audioPlayer?.delegate = self
//                recordButton.isEnabled = true
            } catch let error as NSError{
                print("audio recorder error: \(error.localizedDescription)")

            }
        }else{
            audioPlayer?.stop()
        }
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // 4. Create a AudioSession and set the Caregory
        let audioSession: AVAudioSession = AVAudioSession.sharedInstance()
        do{
            try audioSession.setCategory(.playAndRecord, mode: .default, policy : .default ,options:.defaultToSpeaker)
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        }catch let error as NSError{
            print("audio session error: \(error.localizedDescription)")
        }
        
        
    }
    
    @IBAction func cameraButtonTapped(_ sender: Any) {
        // 1. creat UIimagepickercontroller
        let picker = UIImagePickerController()
        // 2. setup variables(configuration)
        picker.sourceType = .camera
        picker.mediaTypes = [kUTTypeImage as String]
        picker.allowsEditing = true
        
        // 3. get the photo taken, set the delegate of the picker to self
        picker.delegate = self
        // 4. present the img picker
        present(picker,animated: true,completion: nil)
    }

}

extension StoryViewController: AVAudioPlayerDelegate, AVAudioRecorderDelegate{
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        recordButton.isEnabled = true
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
    }
    func audioRecorderEncodeErrorDidOccur(_ recorder: AVAudioRecorder, error: Error?) {

    }
    
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
    }
}

extension StoryViewController : UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // 1. get the photo
        
        if let photo = (info[.editedImage] ?? info[.originalImage]) as? UIImage{
            // 2. display in UIImageView
            stotyImageView.image = photo
        }
        
        // 3. dismiss the picker
        picker.dismiss(animated: true, completion: nil)
        
        
    }
}

