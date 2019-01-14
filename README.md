# Clean Swift (VIP)

In the VIP pattern, the view sends a request to the ViewController. The ViewController sends a request to the Interactor. The Interactor sends a request to the Worker and when the information came back from some API or Local Data. The Worker answer to the Interactor and the Interactor don't answer directly to the ViewController. The Interactor answer the Presenter. The Presenter sends the information to the ViewController and the ViewController answer the View. Too many ways to get the right information and show to the User, but with little a bit practices you can get the goal.

![Alt text](https://rubygarage.s3.amazonaws.com/uploads/article_image/file/1797/clean-swift-1x.png?raw=true "Clean Swift (VIP)")
