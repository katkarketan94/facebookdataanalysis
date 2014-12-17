class InterfaceController < ApplicationController
 def index
 	@interface = Interface.all
 end

end