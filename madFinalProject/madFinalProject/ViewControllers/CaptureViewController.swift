//
//  CaptureViewController.swift
//  madFinalProject
//
//  Created by Philip Membrino on 11/13/22.
//

import UIKit
import Vision

var game_board_cells_image: [Cell] = []
var workingPic = true

class CaptureViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    var imageBoard = [String]()

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "suguruIcon")
        // Do any additional setup after loading the view.
    }
    func recognizeTest(image: UIImage, completion: @escaping ([String]) -> ()){
           var board = [String]()
           guard let cgImage = image.cgImage else {
               return
           }
           //handler
           let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
           
           let request = VNRecognizeTextRequest { request, error in
               guard let observations = request.results as? [VNRecognizedTextObservation],
                     error == nil else {
                   return
               }
               let text = observations.compactMap({
                   $0.topCandidates(1).first?.string
               }).joined(separator: " ")
               DispatchQueue.main.async {
                   
                   self.imageBoard = text.components(separatedBy: " ")
                   board = text.components(separatedBy: " ")
                   completion(board)
                   
               }
           }
           // perform additional request configuration
           request.usesCPUOnly = false //allow Vision to utilize the GPU
           request.recognitionLevel = VNRequestTextRecognitionLevel.accurate
           request.recognitionLanguages = ["en-US"]
           DispatchQueue.global().async {
               do {
                   try handler.perform([request])
               } catch {
                   print("Error: Rectangle detection failed - vision request failed.")
               }
           }
           
           
       }
    func translate(arr: [String]) {
            var horizontal = 0
            var vertical = 0
            var group = 0
            var realValue = 0
            var change = true
            var tempWorkingPic = true
            for characters in arr{
                if characters.count != 3 && characters.count != 2 {
                    workingPic = false
                    tempWorkingPic = false
                }
                
                if arr.count > 40 {
                    for (index,i) in characters.enumerated() {
                        if i == "B" && index == 0{
                            realValue = 0
                            change = true
                            
                        }
                        
                        if i != "B" && index == 0 {
                            if let number = i.wholeNumberValue {
                                realValue = number
                            }
                            change = false
                        }
                        if index == 1 {
                            if let groupNumber = i.wholeNumberValue {
                                group = groupNumber
                            }
                        }
                        if index == 2 {
                            if let groupNumber2 = i.wholeNumberValue {
                                group = 10 + groupNumber2
                            }
                        }
                        
                    }
                }
                else {
                    
                    for (index,i) in characters.enumerated() {
                        if i == "B" && index == 0{
                            realValue = 0
                            change = true
                            
                        }
                        if i != "B" && index == 0 {
                            if let number = i.wholeNumberValue {
                                realValue = number
                            }
                            change = false
                        }
                        if index == 1 {
                            if let groupNumber = i.wholeNumberValue {
                                group = groupNumber
                            }
                        }
                        
                    }
                }
                
                if arr.count < 30 {
                    if horizontal == 5 {
                        vertical += 1
                        horizontal = 0
                    }
                }
                if arr.count > 30 && arr.count < 40 {
                    if horizontal == 6 {
                        vertical += 1
                        horizontal = 0
                    }
                    
                }
                if arr.count > 40 && arr.count < 70 {
                    if horizontal == 8 {
                        vertical += 1
                        horizontal = 0
                    }
                    
                }
                
                let cell = Cell(xPos: horizontal, yPos: vertical, value: realValue, group: group, trueValue: realValue, changeable: change)
                game_board_cells_image.append(cell)
                horizontal = horizontal + 1
            }
            if tempWorkingPic == true {
                workingPic = true
            }
            
        }
    @IBAction func scan(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .camera
        present(picker, animated: true, completion:nil)
    }
    func imagePickerController(_ picker:UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]){
           guard let selectedImage = info[.originalImage] as? UIImage else {
               fatalError("Expected a dictionary containing an image ,but was provided the following: \(info)")
           }
           imageView.image = selectedImage
        game_board_cells_image.removeAll()
        recognizeTest(image: selectedImage) { result in
                   print(self.translate(arr: result))
               }
           dismiss(animated: true, completion:nil)
       }
    
    
    @IBOutlet weak var message_label: UILabel!
    @IBAction func captureVCTest(_ sender: Any) {
        if game_board_cells_image.count > 0  && workingPic == true {
            message_label.text = ""
                    let detailedVC = storyboard!.instantiateViewController(withIdentifier: "capturedBoard") as! CaptureBoardViewController
                    navigationController?.pushViewController(detailedVC, animated: true)
                }
        else {
            message_label.text = "Invalid Image"
        }
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
