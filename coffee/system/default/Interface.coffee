###
 # @class Interface
 # @brief Provides an interface system to developer
 ###
class Interface

	###
	 # Use this method if you want to force user to implement a method
	 ###
	toImplement: () ->
		throw "You must implement all methods of an interface"
