class MainViewController < UIViewController

  def loadView
    views = NSBundle.mainBundle.loadNibNamed "MainView", owner:self, options:nil
    self.view = views[0]
    @tool_bar = self.view.viewWithTag 1 
    @image_view = self.view.viewWithTag 2 
  end

  def viewDidLoad
    set_up_buttons
  end

  private 

  def set_up_buttons
    @color_button =  @tool_bar.items.first
    @color_button.setTarget self
    @color_button.setAction 'color_button_tapped:'
  end

  def popoverControllerDidDismissPopover(popoverController)
    @pop = nil
    puts 'hidden'
  end

  def imagePickerController(picker, didFinishPickingMediaWithInfo:info)
    @image_view.image = info[:UIImagePickerControllerOriginalImage]
  end

  def color_button_tapped(sender)
    if @pop
      puts 'hide'
      @pop.dismissPopoverAnimated(true)
      @pop = nil
    else
      puts 'show'
      image_picker = UIImagePickerController.alloc.init
      image_picker.delegate  = self
      @pop = UIPopoverController.alloc.initWithContentViewController(image_picker) 
      @pop.delegate = self
      @pop.presentPopoverFromBarButtonItem(sender, permittedArrowDirections:UIPopoverArrowDirectionAny, animated:true)
      @pop.setPopoverContentSize([320, 280])
      puts 'tap tap tap :)'
    end

  end

end



