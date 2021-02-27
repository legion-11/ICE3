import SpriteKit
import GameplayKit

class Cloud: GameObject
{
    
    // constructor
    init()
    {
        super.init(imageString: "cloud", initialScale: 1.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    
    override func CheckBounds()
    {
        if(position.y <= -756)
        {
            Reset()
        }
    }
    
    override func Reset()
    {
        dy = CGFloat((randomSource?.nextUniform())! * 5.0) + 5.0
        dx = CGFloat((randomSource?.nextUniform())! * -4.0) + 2.0
        
        // get a pseudo-random number from -208 to 208
        let randomX:Int = (randomSource?.nextInt(upperBound: 416))! - 208
        position.x = CGFloat(randomX)
        
        //set y position to 784...794
        let randomY:Int = (randomSource?.nextInt(upperBound: 10))! + 784
        position.y = CGFloat(randomY)
        
        isColliding = false
    }
    
    // initialization
    override func Start()
    {
        zPosition = 3
        alpha = 0.5
        Reset()
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    func Move()
    {
        position.y -= dy!
        position.x -= dx!
    }
}
