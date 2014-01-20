class Image < ActiveRecord::Base
  mount_uploader :location, ImageFileUploader
 
  def convert_single_image(input_file, options, output_file)
    logger.debug "******************convert was called***************"
    
    logger.debug "input file is #{input_file}"
    logger.debug "options are #{options}"
    logger.debug "output file is #{output_file}"

    all_args = "#{input_file} #{options} #{output_file}"
    logger.debug "all arguments are #{all_args}"
    
    logger.debug "convert commmand about to be executed"    
    execute_command(:convert, all_args)
    
    logger.debug "*****************convert_single_image finished*******************"
  end
  
  def execute_command(command_type, all_args)
    logger.debug "******* executing command *********"
    logger.debug "******* command type is #{command_type} *******"
    logger.debug "******* all arguments are #{all_args} *******"
    
    command_line_input = "#{command_type} #{all_args}"
    logger.debug "******* command_line_input is #{command_line_input}"
    
#    MojoMagick::raw_command("#{command_type}", "#{all_args}")  

    # Or try shell commands
     %x[#{command_line_input}]
    # system("#{command_line_input}")
    # `convert public/uploads/z.jpg -negate public/uploads/z2.jpg`
             #      Does string interpolation work with backticks?

    
    logger.debug "********* execute_command finished ********"
  end
  
end
