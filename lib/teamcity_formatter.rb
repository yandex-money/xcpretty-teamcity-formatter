
class TeamCityFormatter < XCPretty::Simple
	
	def initialize (use_unicode, colorize)
		super
		STDOUT.puts("##teamcity[compilationStarted compiler='xcodebuild']")
		at_exit do
			STDOUT.puts("##teamcity[compilationFinished compiler='xcodebuild']")
		end
	end
	
	# Errors and warnings.
	def format_compile_error(file_name, file_path, reason, line, cursor)
		STDOUT.puts("##teamcity[message text='Compile error' errorDetails='#{super}' status='ERROR']\n")
		super
	end
	
	def format_error(message)
		STDOUT.puts("##teamcity[message text='Error' errorDetails='#{super}' status='ERROR']\n")
		super
	end
	
	def format_file_missing_error(error, file_path)
		STDOUT.puts("##teamcity[message text='Missing file' errorDetails='#{super}' status='ERROR']\n")
		super
	end
	
	def format_ld_warning(message)
		STDOUT.puts("##teamcity[message text='LD warning' errorDetails='#{super}' status='ERROR']\n")
		super
	end
	
	def format_undefined_symbols(message, symbol, reference)
		STDOUT.puts("##teamcity[message text='Undefined symbols' errorDetails='#{super}' status='ERROR']\n")
		super
	end
	
	def format_duplicate_symbols(message, file_paths)
		STDOUT.puts("##teamcity[message text='Duplicate symbols' errorDetails='#{super}' status='ERROR']\n")
		super
	end
	
	def format_warning(message)
		STDOUT.puts("##teamcity[message text='Warning' errorDetails='#{super}' status='ERROR']\n")
		super
	end
	
	def format_compile_warning(file_name, file_path, reason, line, cursor)
		STDOUT.puts("##teamcity[message text='Compile warning' errorDetails='#{super}' status='ERROR']\n")
		super
	end
	
end

TeamCityFormatter
