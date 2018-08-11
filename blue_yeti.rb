#!/usr/bin/ruby

require 'fileutils'


File.open('/var/lib/alsa/asound.state.replace', 'w') do |f2|
    blue_yeti = false
    File.open('/var/lib/alsa/asound.state', 'r') do |f1|  
        while line = f1.gets  
            if blue_yeti
                if line == "}\n"
                    blue_yeti = false
                end
            else
                if line == "state.B20 {\n"
                    blue_yeti = true
                    next 
                end
                f2.write line
            end
        end  
    end  
end


FileUtils.mv('/var/lib/alsa/asound.state.replace', '/var/lib/alsa/asound.state')

