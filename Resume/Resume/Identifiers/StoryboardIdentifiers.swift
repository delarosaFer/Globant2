
import Foundation

/// An enum that reflects the name of storyboards
enum StoryBoardNameIdentifier: String {
    case main = "Main"
}

/// An enum that reflects the name of the StoryBoardIDs
enum StoryBoardIdentifier: String {
    case mainView = "MainView"
}

enum StoryBoardSegue: String {
    case errorSegue = "ErrorSegue"
    case successfulSegue = "StartSegue"
    case contactSegue = "ContactSegue"
}

