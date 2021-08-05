import UIKit

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let MAX_ARRAY_NUM = 10
    let PICKER_VIEW_COLUMN = 2
    let PICKER_VIEW_HEIGHT: CGFloat = 80
    
    var imageFileName: [String] = ["1.jpg" , "2.jpg" , "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg"]
//  var imageFileNmae2 = [String]()
//  imageFileNmae2.append("이렇게 추가도 가능하다")
//  imageFileNmae2[1] = "또 추가"
    var imageArray = [UIImage?]()
    
    
    @IBOutlet var pickerImage: UIPickerView!
    @IBOutlet var lblImageFileName: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0 ..< MAX_ARRAY_NUM{
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
       
        lblImageFileName.text = imageFileName[0]
        imageView.image = imageArray[0]
        
    }
    
    
    // 델리게이트 메서드, 피커뷰에 표시되는 행(몇개 선택할건지) 의 갯수인 1을 넘겨준다.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    // 인ㄴ수를 가지는 델리게이트 메서드 , 컴포넌트 열의 갯수을 정수값으로 넘겨준다
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }

    // 피커뷰에게 컴포넌트의 각 열의 타이틀을 문자열(String) 값으로 넘겨준다. 여기선 배열에 저장되어있는 파일명을 넘겨준다
    //    func pickerView(_ pickerView: UIPickerView, titleForRow row:Int, forComponent component: Int) -> String? {
    //        return imageFileName[row]
    //    }
    
    // 위의 주석친 메소드를 아래메소드로 수정했다!
    
    
    // viewForRow 인수가 포함되어있는 델리게이트 메서드는 각 row 의 뷰(여기서는 imageView) 를 정의하는 메서드
    // UIView 를 리턴한다
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let imageView = UIImageView(image: imageArray[row])
        imageView.frame = CGRect(x: 0, y:0 , width:100 , height: 150)
        
        return imageView
    }
    
    // 피커뷰의 deligate 메서드중 didSelectRow 인수가 포함된 메서드는 사용자가 피커뷰의 룰렛을 선택했을 때 호출된다
    // 사용자가 피커뷰에서 선택한 row 값을 사용하여 배열에서 그 row 값에 해당하는 문자열을 가지고옴. 가져온 문자열을 label 에 저장한다
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        
        if ( component == 0 ){
            
            lblImageFileName.text = imageFileName[row]

        }
        
        else{
            imageView.image = imageArray[row]
        }
    }
    
    
    // 피커뷰에 보이는 이미지의 height 를 조절해주는 델리게이트 메소드
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }

}
