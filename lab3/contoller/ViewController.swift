//
//  ViewController.swift
//  lab3
//
//  Created by Brad Hodkinson on 9/25/18.
//  Copyright © 2018 Brad Hodkinson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentLine: Line?
    var drawingCanvas: CanvasView!
    
    private var topNavigationStackView = UIStackView()
    private var bottomNavigationStackView = UIStackView()
    
    //views for the top navigation view
    private let sliderView = UIView()
    private let clearButtonView = UIView()
    private let undoButtonView = UIView()
    private let saveButtonView = UIView()
    
    //arrays for bottom color buttons
    var bottomButtonViews:[UIView] = Array()
    var bottomButtons:[UIButton] = Array()
    var bottomIndicators:[UIView] = Array()
    
    //default current color to red
    private var currentColor: UIColor = .red
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //change the background color
        view.backgroundColor = .white
        
        //build the main structure of the app
        createTopMenu()
        createBottomMenu()
        createDrawingCanvas()
        setUpLayout()
    }
    
    
    //function to create the top navigation bar of the app
    func createTopMenu(){
        topNavigationStackView = UIStackView(arrangedSubviews: [sliderView, clearButtonView, undoButtonView, saveButtonView])
        topNavigationStackView.axis = .horizontal
        topNavigationStackView.distribution = .fillEqually
        
        //slider for adjusting line width
        sliderView.addSubview(slider)
        //clear button to clear the screen
        clearButtonView.addSubview(clearButton)
        //undo button, takes away last line
        undoButtonView.addSubview(undoButton)
        //save button, takes a screen shot and saves it to the photo library
        saveButtonView.addSubview(saveButton)
        
        //make the save icon scale to fit nicely in the navigation bar
        saveButton.imageView!.contentMode = .scaleAspectFit
        
        //add the top navigation bar to the main view
        view.addSubview(topNavigationStackView)
    }
    
    
    //function to create the bottom buttons that are used to select the color
    func createBottomMenu(){
        //array of colors to choose from for drawing
        let colors: [UIColor] = [.red, .orange, .yellow, .green, .blue, .purple, .magenta]
        
        //for each color create a button and view so it can be added to the stack view
        for color in colors {
            //create a button to select a color to draw, and add an indication circle of the current selection
            let tempButton = createColorButton(color: color)
            let tempView = createColorView()
            let tempIndicator = createIndicatorView()
            
            //auto layout constraints
            tempButton.translatesAutoresizingMaskIntoConstraints = false
            bottomButtons.append(tempButton)
            tempView.addSubview(tempButton)
            tempIndicator.translatesAutoresizingMaskIntoConstraints = false
            bottomIndicators.append(tempIndicator)
            tempView.addSubview(tempIndicator)
            bottomButtonViews.append(tempView)
        }
        
        //set color of the indicators showing which color is selected
        bottomIndicators[0].backgroundColor = .gray
        
        //add all the color button views created to the stack view
        bottomNavigationStackView = UIStackView(arrangedSubviews: bottomButtonViews)
        //settings for the stack view
        bottomNavigationStackView.axis = .horizontal
        bottomNavigationStackView.distribution = .fillEqually
        
        //add the stack view to the main view
        view.addSubview(bottomNavigationStackView)
    }
    
    
    //function to create the main drawing canvas for the app
    func createDrawingCanvas(){
        //create the drawing canvas from the custom canvas view class
        drawingCanvas = CanvasView(frame: view.frame)
        //add the drawing canvas to the main view
        view.addSubview(drawingCanvas)
    }
    
    //function to set up the auto layout and constraints for the app structure
    func setUpLayout(){
        //enable auto layout
        drawingCanvas.translatesAutoresizingMaskIntoConstraints = false
        topNavigationStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomNavigationStackView.translatesAutoresizingMaskIntoConstraints = false
        slider.translatesAutoresizingMaskIntoConstraints = false
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        undoButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        //activate constraints
        NSLayoutConstraint.activate([
            topNavigationStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            topNavigationStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            topNavigationStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            topNavigationStackView.heightAnchor.constraint(equalToConstant: 40),
            
            bottomNavigationStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            bottomNavigationStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            bottomNavigationStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            bottomNavigationStackView.heightAnchor.constraint(equalToConstant: 60),
            
            drawingCanvas.topAnchor.constraint(equalTo: topNavigationStackView.bottomAnchor, constant: 0),
            drawingCanvas.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            drawingCanvas.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            drawingCanvas.bottomAnchor.constraint(equalTo: bottomNavigationStackView.topAnchor, constant: 0),
            
            slider.topAnchor.constraint(equalTo: sliderView.topAnchor, constant: 0),
            slider.leadingAnchor.constraint(equalTo: sliderView.leadingAnchor, constant: 5),
            slider.trailingAnchor.constraint(equalTo: sliderView.trailingAnchor, constant: -5),
            slider.bottomAnchor.constraint(equalTo: sliderView.bottomAnchor, constant: 0),
            
            clearButton.topAnchor.constraint(equalTo: clearButtonView.topAnchor, constant: 0),
            clearButton.leadingAnchor.constraint(equalTo: clearButtonView.leadingAnchor, constant: 0),
            clearButton.trailingAnchor.constraint(equalTo: clearButtonView.trailingAnchor, constant: 0),
            clearButton.bottomAnchor.constraint(equalTo: clearButtonView.bottomAnchor, constant: 0),
            
            undoButton.topAnchor.constraint(equalTo: undoButtonView.topAnchor, constant: 0),
            undoButton.leadingAnchor.constraint(equalTo: undoButtonView.leadingAnchor, constant: 0),
            undoButton.trailingAnchor.constraint(equalTo: undoButtonView.trailingAnchor, constant: 0),
            undoButton.bottomAnchor.constraint(equalTo: undoButtonView.bottomAnchor, constant: 0),
            
            saveButton.centerXAnchor.constraint(equalTo: saveButtonView.centerXAnchor, constant: 0),
            saveButton.centerYAnchor.constraint(equalTo: saveButtonView.centerYAnchor, constant: 0),
            ])
        
        
        //for each button set constraints to it respective view
        var i = 0
        for tempButton in bottomButtons {
            NSLayoutConstraint.activate([
                tempButton.topAnchor.constraint(equalTo: bottomButtonViews[i].topAnchor, constant: 0),
                tempButton.centerXAnchor.constraint(equalTo: bottomButtonViews[i].centerXAnchor, constant: 0),
                tempButton.heightAnchor.constraint(equalToConstant: 36),
                tempButton.widthAnchor.constraint(equalToConstant: 36),
                bottomIndicators[i].bottomAnchor.constraint(equalTo: bottomButtonViews[i].bottomAnchor, constant: -6),
                bottomIndicators[i].centerXAnchor.constraint(equalTo: bottomButtonViews[i].centerXAnchor, constant: 0),
                bottomIndicators[i].heightAnchor.constraint(equalToConstant: 8),
                bottomIndicators[i].widthAnchor.constraint(equalToConstant: 8),
                ])
            i += 1
        }
    }
    
    
    let bottomTabBar: UITabBar = {
        let tabBarFrame = CGRect(x: 0, y: 0, width: 10, height: 10)
        let tabBar = UITabBar(frame: tabBarFrame)
        return tabBar
    }()
    
    let slider: UISlider = {
        let slider = UISlider(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        slider.isContinuous = true
        slider.maximumValue = 30
        slider.minimumValue = 2
        slider.value = 14
        return slider
    }()
    
    let clearButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Clear", for: .normal)
        button.addTarget(self, action: #selector(clearScreen(_:)), for: UIControl.Event.touchDown)
        return button
    }()
    
    let undoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Undo", for: .normal)
        button.addTarget(self, action: #selector(undoAction(_:)), for: UIControl.Event.touchDown)
        return button
    }()
    
    let saveButton: UIButton = {
        let button = UIButton(type: .custom)
        let saveImage = UIImage(named: "save")
        button.setImage(saveImage, for: .normal)
        button.addTarget(self, action: #selector(saveAction(_:)), for: UIControl.Event.touchDown)
        return button
    }()
    
    func createColorButton(color: UIColor) -> UIButton {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 18
        button.clipsToBounds = true
        button.backgroundColor = color
        button.addTarget(self, action: #selector(changeColor(_:)), for: UIControl.Event.touchDown)
        return button
    }
    
    func createColorView() -> UIView {
        let frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        return UIView(frame: frame)
    }
    
    func createIndicatorView() -> UIView {
        let frame = CGRect(x: 0, y: 0, width: 8, height: 8)
        let view = UIView(frame: frame)
        view.layer.cornerRadius = 4
        view.backgroundColor = .clear
        return view
    }
    
    
    //action to clear the screen
    @objc func clearScreen(_ sender: UIButton) {
        //clear the screen of all the lines drawn
        drawingCanvas.theLine = nil
        drawingCanvas.lines = []
    }
    
    //action to remove the last line drawn
    @objc func undoAction(_ sender: UIButton) {
        //check if there is a line to remove
        if(drawingCanvas.lines.count > 0){
            //remove the last line
            drawingCanvas.theLine = nil
            drawingCanvas.lines.removeLast()
        }
    }
    
    //action to save a screen shot
    @objc func saveAction(_ sender: UIButton) {
        //take a screen shot to save to photo library
        screenShot()
        
        //alert the user that the photo was saved
        let alert = UIAlertController(title: "Save Successful", message: "A screen shot has been taken and saved into the current device's photo album.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    //action to change the color
    @objc func changeColor(_ sender: UIButton){
        //change the current color of the line being drawn
        currentColor = sender.backgroundColor!
        
        //update the inicator circle to let user know which color is selected
        var i = 0
        for colorButton in bottomButtons {
            //if the color is selected change the indicator to gray, else have it be transparent
            if(colorButton.backgroundColor == currentColor){
                bottomIndicators[i].backgroundColor = .gray
            } else {
                bottomIndicators[i].backgroundColor = .clear
            }
            i += 1
        }
        
    }
    
    //function to take a screen shot of the current screen
    func screenShot(){
        //get the graphics for the whole screen except top bar
        UIGraphicsBeginImageContext(view.frame.size)
        //get the current context of the graphics
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        //save the current image contents of the graphics as a screen shot image
        let screenShotImage = UIGraphicsGetImageFromCurrentImageContext()
        //end the graphics context
        UIGraphicsEndImageContext()
        //write the image to users photo album
        UIImageWriteToSavedPhotosAlbum(screenShotImage!, nil, nil, nil)
    }
    
    //override function to start drawing a new line
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //get the coordinate point tapped
        let touchPoint = (touches.first)!.location(in: drawingCanvas) as CGPoint
        //update the current line
        currentLine = Line(color: currentColor, points: [touchPoint], width: CGFloat(slider.value))

        
    }
    
    //override function to add coordinates points while the line is being drawn
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //get the current point
        let touchPoint = (touches.first)!.location(in: drawingCanvas) as CGPoint
        //add the point to the coordinate points array of the line
        currentLine?.points.append(touchPoint)
        //update the current line
        drawingCanvas.theLine = currentLine

    }
    
    //override function to end the line being drawn and save it
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let newLine = currentLine {
            //add the line to the array of lines
            drawingCanvas.lines.append(newLine)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


