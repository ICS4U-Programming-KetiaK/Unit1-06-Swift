//
// Statistics.swift
// Created by Ketia Gaelle Kaze
// Created on 2022-03-08
// Version 1.0
// Copyright (c) 2022 Ketia Gaelle Kaze. All rights reserved.
//
// The Statistics program 
// reads a text file into a list, converts it to an array,
// then calls different functions to determine the mean,
// median, and mode.
import Foundation

// function that calculates mean
func calcMean(arrayOfInts: [Double]) -> Double {
    let arrayLength: Double = Double(arrayOfInts.count)

    var sum: Double = 0.0

    // calculates mean
    for number in arrayOfInts {
        sum += number
    }

    let mean: Double = sum / arrayLength

    return mean
}

// function that calculates median
func calcMedian(arrayOfInts: [Double]) -> Double {
    let arrayLength: Int = arrayOfInts.count

    // sorts array
    let arrayOfInts = arrayOfInts.sorted()

    // declaring variables
    var median: Double = 0.0
    let middle = arrayOfInts.count/2

    // calculates median
    if arrayLength % 2 == 0 {
        median = Double((arrayOfInts[middle] + arrayOfInts[middle - 1]) / 2)
    } else {
        median = Double(arrayOfInts[middle])
    }

    return median
}

// function that calculates the mode
func calcMode(arrayOfInts: [Int]) -> [Int] {
    // declaring variables
    var counts = [Int: Int]()

    // finds mode
    arrayOfInts.forEach { counts[$0] = (counts[$0] ?? 0) + 1}
    let (_, count) = counts.max(by: {$0.1 < $1.1}) ?? (0, 0)
    var modes = counts.compactMap { $1 == count ? $0 : nil}

    // sorts modes
    modes.sort()

    return modes
}
do {
  // get text file
  let arguments = CommandLine.arguments
  let userSetChoice: String = arguments[1]
  // adds list values to array
  let file: String = try String(contentsOfFile: userSetChoice)
  let arrayOfString: [String] = file.components(separatedBy: "\n")
  let arrayOfIntsFile: [Int] = arrayOfString.compactMap {Int($0)}

  // function calls
  let meanUser: Double = calcMean(arrayOfInts: arrayOfIntsFile.map { Double($0)})
  let medianUser: Double = calcMedian(arrayOfInts: arrayOfIntsFile.map { Double($0)})
  let modeUser: [Int] = calcMode(arrayOfInts: arrayOfIntsFile)

  // displays mean, medium, and mode to the user
  print(arrayOfIntsFile)
  print("The mean is: \(meanUser)")
  print("The median is: \(medianUser)")
  print("The mode(s) is/are: \(modeUser)")
} catch {
  // error catching 
  Swift.print("Invalid file!")
}
