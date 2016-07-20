
import Foundation
import SwiftyJSON

class StatusTextPicCellViewModel {
    
    private let model: TimeLine
    
    init(model: TimeLine) {
        self.model = model
    }
    
    var userHeaderViewModel: UserHeaderViewModel {
        return UserHeaderViewModel(model: model.userModel)
    }
    
    var text: String {
        return model.text
    }
    
    var picViewViewModel: PicViewViewModel {
        return PicViewViewModel(model: model.picUrls)
    }
    
}
